//
//  WebService.m
//  ACGDeals
//
//  Created by Sameer Siddiqui on 1/12/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import "PPNWebService.h"
#import <UIKit/UIKit.h>
#import "PPNClient.h"
#import "SSOrderedDictionary.h"
#import "PPNInternalManager.h"

NSString *const kPPNPlatformUrl = @"https://api.rezserver.com/api";


@interface PPNWebService ()  <NSURLSessionTaskDelegate>

@property(nonatomic, copy) CompletionBlock completionBlock;

@end

@implementation PPNWebService
- (id)init {
    if (self = [super init]) {
    }
    return self;
}


- (void)getResponseForService:(NSString *)serviceName withDictionary:(NSDictionary *)dictionary withCompletionBlock:(CompletionBlock)completionBlock {
    SSOrderedDictionary *dict = [[SSOrderedDictionary alloc]initWithDictionary:dictionary];

        [self responseForService:serviceName withDictionary:dict withRequestType:RequestTypeGet withCompletionBlock:completionBlock];
}

- (void)putResponseForService:(NSString *)serviceName withDictionary:(NSDictionary *)dictionary withCompletionBlock:(CompletionBlock)completionBlock {
    SSOrderedDictionary *dict = [[SSOrderedDictionary alloc]initWithDictionary:dictionary];
    [dict insertObject:@"" forKey:@"SessionID" atIndex:dictionary.count];
    
    
    [self responseForService:serviceName withDictionary:dict withRequestType:RequestTypePut withCompletionBlock:completionBlock];
}

- (void)responseForService:(NSString *)serviceName withDictionary:(NSDictionary *)dictionary withRequestType:(RequestType)requestType withCompletionBlock:(CompletionBlock)completionBlock {
    
    self.completionBlock = completionBlock;
    NSString *urlString = [NSString stringWithFormat:@"%@/%@", kPPNPlatformUrl, serviceName];
    
    
    SSOrderedDictionary *dict = [[SSOrderedDictionary alloc]initWithDictionary:dictionary];
    [dict insertObject:@"json" forKey:@"format" atIndex:dictionary.count];
    [dict insertObject:[PPNInternalManager internalManager].refid forKey:@"refid" atIndex:dictionary.count];
    [dict insertObject:[PPNInternalManager internalManager].api_key forKey:@"api_key" atIndex:dictionary.count];


    PPNClient* client = [[PPNClient alloc]init];
    [client requestWithURL:urlString WithParameterDictionary:dict withRequestType:requestType andCompletionBlock:^(id responseData, NSError *error) {
        if ([responseData isKindOfClass:[NSDictionary class]]) {
    
            
            if (completionBlock)
                completionBlock(responseData, error);
        }
 
    }];
}

@end
