//
//  KLTDealsClient.m
//  ACGDeals
//
//  Created by Sameer Siddiqui on 1/13/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import "PPNClient.h"

const int kPPNDefaultTimeoutMS = 100;
const int kPPNRetryMax = 3;

@interface PPNClient()

@property(nonatomic, copy) CompletionBlock completionBlock;

@end

@implementation PPNClient {
    int retryCount;
    BOOL retry;
}


#pragma mark - Client Requests


- (void)requestWithURL:(NSString *)urlString WithParameterDictionary:(NSDictionary *)dictionary withRequestType:(RequestType)requestType andCompletionBlock:(CompletionBlock)completionBlock {
    
    //track how long responses are taking
//    NSDate *methodStart = [NSDate date];

    self.completionBlock = completionBlock;
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    NSURL *url;
    NSMutableURLRequest *request;
    
    NSString *parameters = @"";
    for (id paramKey in [dictionary allKeys]) {
        if ([paramKey isKindOfClass:[NSString class]]) {
            id value = [dictionary objectForKey:paramKey];
            if ([value isKindOfClass:[NSString class]]) {
                parameters = [parameters stringByAppendingFormat:@"%@%@=%@", ([parameters isEqualToString:@""]?@"":@"&"), paramKey, value];
            }
            if ([value isKindOfClass:[NSNumber class]]) {
                parameters = [parameters stringByAppendingFormat:@"%@%@=%lld", ([parameters isEqualToString:@""]?@"":@"&"), paramKey, [value longLongValue]];
            }
        }
    }

    
    switch (requestType) {
        case RequestTypeGet:
        {
            if (!retry) {
                urlString = [NSString stringWithFormat:@"%@?%@",urlString,parameters];
            }
            [urlString stringByRemovingPercentEncoding];
            urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
            url = [NSURL URLWithString:urlString];
            request = [[NSMutableURLRequest alloc] initWithURL:url];
            [request setHTTPMethod:@"GET"];
            
        }
            break;
            
        case RequestTypePost:
        {
            url = [NSURL URLWithString:urlString];
            request = [[NSMutableURLRequest alloc] initWithURL:url];
            NSError *error;
            NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictionary options:kNilOptions error:&error];
            [request setHTTPMethod:@"POST"];
            [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
            request.HTTPBody = jsonData;
        }
            break;
            
        case RequestTypePut:
        {
            if (!retry) {
                urlString = [NSString stringWithFormat:@"%@?%@",urlString,parameters];
            }
            urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
            url = [NSURL URLWithString:urlString];
            request = [[NSMutableURLRequest alloc] initWithURL:url];
            [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
            [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
            [request setHTTPMethod:@"PUT"];
        }
            break;
            
        default:
            break;
    }
    request.timeoutInterval = kPPNDefaultTimeoutMS;
//    NSLog(@"Request sent : %@",request.URL.absoluteString);
    
    __weak typeof (self) weakSelf = self;

    NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler: ^(NSData *data, NSURLResponse *httpResponse, NSError *error) {
        NSObject *response = [self processResponse:data withResponse:(NSHTTPURLResponse *)httpResponse withError:error];
//        NSHTTPURLResponse * status = (NSHTTPURLResponse *)httpResponse;

        //track how long responses are taking
//        NSDate *methodFinish = [NSDate date];
//        NSTimeInterval executionTime = [methodFinish timeIntervalSinceDate:methodStart];
        //
        
        if ([response isKindOfClass:[NSArray class]]) {
            completionBlock(response, nil);
//            NSLog(@"\nREQUEST = %@ \nRESPONSE = %@ StatusCode = %ld  \n  ExecutionTime = %f",request.URL.absoluteString,response, (long)status.statusCode, executionTime);
        }

        if ([response isKindOfClass:[NSDictionary class]]) {
            completionBlock(response, nil);
//            NSLog(@"\nREQUEST = %@  \nRESPONSE = %@ StatusCode = %ld  \n  ExecutionTime = %f",request.URL.absoluteString,response, (long)status.statusCode, executionTime);
        }
        
        else if ([response isKindOfClass:[NSError class]]) {
            
            if (retryCount<kPPNRetryMax) {
                retry = YES;
                [weakSelf requestWithURL:urlString WithParameterDictionary:nil withRequestType:requestType andCompletionBlock:^(id responseData, NSError *error) {
                    retry = NO;
                    completionBlock(responseData, nil);
                }];
                retryCount++;
//                NSLog(@"Retry count: %d  for request %@",retryCount, request.URL.absoluteString);
            }
            else {
                completionBlock(nil,(NSError *)response);
//                NSLog(@"\nREQUEST = %@  \nERROR = %@ StatusCode = %ld  \n  ExecutionTime = %f",request.URL.absoluteString,response, (long)status.statusCode, executionTime);
            }
        }
        
        else if ([response isKindOfClass:[NSString class]]) {
            completionBlock(nil,(NSError *)response);
//            NSLog(@"\nREQUEST = %@  \nString = %@ StatusCode = %ld \n  ExecutionTime = %f",request.URL.absoluteString,response,(long)status.statusCode, executionTime);
        }

    }];
    [task resume];
}

- (NSObject *)processResponse:(NSData *)data withResponse:(NSHTTPURLResponse *)response withError:(NSError *)error {
    
    if (error) {
        return error;
    }
    
    NSDictionary *jsonResponse = [NSJSONSerialization JSONObjectWithData:data
                                                                 options:kNilOptions
                                                                   error:&error];
    if (response.statusCode >= 300 || response.statusCode == 0) {
        NSDictionary *dict = jsonResponse;
        if (dict.count > 0) {
            NSString *message = dict[@"Message"];
            if (message.length > 0) {
                error = [NSError errorWithDomain:@"PPN" code:((NSHTTPURLResponse *)response).statusCode userInfo:@{NSLocalizedDescriptionKey : message}];
            }
            else {
                error = nil;
            }
            
        }
        if (!error) {
            error = [NSError errorWithDomain:@"PPN" code:((NSHTTPURLResponse *)response).statusCode userInfo:@{NSLocalizedDescriptionKey : @"Unknown error: please investigate!"}];
        }
        return error;
    }
    else {
        if (jsonResponse) {
            return jsonResponse;
        }
        else {
            return [NSString stringWithFormat:@"No response data with status code :%ld",(long)response.statusCode];
        }
    }
}

@end
