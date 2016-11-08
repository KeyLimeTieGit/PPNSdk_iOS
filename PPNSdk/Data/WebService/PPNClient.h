//
//  KLTDealsClient.h
//  ACGDeals
//
//  Created by Sameer Siddiqui on 1/13/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    RequestTypeGet = 0,
    RequestTypePut,
    RequestTypePost,
}RequestType;

@interface PPNClient : NSObject

typedef void(^CompletionBlock)(id responseData, NSError *error);

- (void)requestWithURL:(NSString *)urlString WithParameterDictionary:(NSDictionary *)dictionary withRequestType:(RequestType)requestType andCompletionBlock:(CompletionBlock)completionBlock;


@end
