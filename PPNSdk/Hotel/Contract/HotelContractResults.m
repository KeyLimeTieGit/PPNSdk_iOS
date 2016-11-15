//
//  HotelContractResults.m
//  PPNSdk
//
//  Created by Sameer Siddiqui on 11/15/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import "HotelContractResults.h"
#import "HotelContractParser.h"
#import "PPNWebService.h"

NSString *const kHotelContractServiceName = @"hotel/getContractRequest";

@implementation HotelContractResults

- (void)getHotelContractForBundle:(NSString *)ppn_bundle withCompletionBlock:(HotelContractCompletionBlock)completionBlock {
    
    PPNWebService *service = [[PPNWebService alloc]init];
    [service getResponseForService:kHotelContractServiceName withDictionary:@{@"ppn_bundle":ppn_bundle} withCompletionBlock:^(id responseData, NSError *error) {
        
        if (!error) {
            HotelContractParser *parser = [[HotelContractParser alloc]initWithJson:responseData];
            HotelContractModel *model = [[HotelContractModel alloc]initWithJson:parser.contract];
            completionBlock(model, nil);
        }
        else {
            completionBlock(nil,error);
            NSLog(@"%@",error.localizedDescription);
        }
        
    }];

    
}

@end
