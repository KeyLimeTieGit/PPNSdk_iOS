//
//  HotelRatesResults.m
//  PPNSdk
//
//  Created by Sameer Siddiqui on 11/14/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import "HotelRatesResults.h"
#import "HotelRatesParser.h"

#import "PPNWebService.h"

NSString *const kHotelRatesServiceName = @"hotel/getRates.Live.Multi";

@implementation HotelRatesResults

- (void)getHotelRatesForHotelID:(NSString *)hotelID rooms:(NSString *)rooms adults:(NSString *)adults children:(NSString *)children checkin:(NSString *)checkin checkout:(NSString *)checkout withCompletionBlock:(HotelRatesCompletionBlock)completionBlock {
    
    PPNWebService *service = [[PPNWebService alloc]init];
    [service getResponseForService:kHotelRatesServiceName withDictionary:@{@"hotel_ids":hotelID, @"rooms":rooms, @"adults":adults, @"children":children, @"check_in":checkin, @"check_out":checkout} withCompletionBlock:^(id responseData, NSError *error) {
        
        if (!error) {
            HotelRatesParser *parser = [[HotelRatesParser alloc]initWithJson:responseData];
            completionBlock (parser.rates, nil);
        }
        else {
            completionBlock(nil,error);
            NSLog(@"%@",error.localizedDescription);
        }
        
    }];

    
}

@end
