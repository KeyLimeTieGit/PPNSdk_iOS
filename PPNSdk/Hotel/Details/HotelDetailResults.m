//
//  HotelDetailResults.m
//  PPNSdk
//
//  Created by Sameer Siddiqui on 11/11/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import "HotelDetailResults.h"
#import "HotelDetailParser.h"
#import "PPNWebService.h"


NSString *const kHotelDetailServiceName = @"hotel/getHotelDetails";


@implementation HotelDetailResults

- (void)getHotelDetailForHotelID:(NSString *)hotelID withCompletionBlock:(HotelDetailCompletionBlock)completionBlock {
    
    PPNWebService *service = [[PPNWebService alloc]init];
    [service getResponseForService:kHotelDetailServiceName withDictionary:@{@"hotel_id":hotelID} withCompletionBlock:^(id responseData, NSError *error) {
        
        if (!error) {

            HotelDetailParser *parser = [[HotelDetailParser alloc]initWithJson:responseData];
            HotelDetailModel *model = [[HotelDetailModel alloc]initWithJson:parser.hotelData];
            completionBlock(model, nil);
        }
        else {
            completionBlock(nil,error);
            NSLog(@"%@",error.localizedDescription);
        }
        
    }];

    
    
}

@end
