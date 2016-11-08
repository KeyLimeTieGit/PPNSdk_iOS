//
//  WebService.h
//  ACGDeals
//
//  Created by Sameer Siddiqui on 1/12/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PPNWebService : NSObject

typedef void(^CompletionBlock)(id responseData, NSError *error);

@property (weak, nonatomic) NSString *keyword;

- (void)getResponseForService:(NSString *)serviceName withDictionary:(NSDictionary *)dictionary withCompletionBlock:(CompletionBlock)completionBlock;
- (void)putResponseForService:(NSString *)serviceName withDictionary:(NSDictionary *)dictionary withCompletionBlock:(CompletionBlock)completionBlock;

@end

