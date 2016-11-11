//
//  HotelSearchResults.m
//  PPNSdk
//
//  Created by Sameer Siddiqui on 11/10/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import "HotelSearchResults.h"
#import "HotelSearchParser.h"
#import "PPNWebService.h"


NSString *const kHotelSearchServiceName = @"hotel/getResults";

@implementation HotelSearchResults

- (void)getHotelSearchResultsWithCheckIn:(NSString *)checkin checkout:(NSString *)checkout cityid:(NSString *)cityid rooms:(int)rooms adults:(int)adults children:(int)children withCompletionBLock:(HotelSearchCompletionBlock)completionBlock {
    
    PPNWebService *service = [[PPNWebService alloc]init];
    [service getResponseForService:kHotelSearchServiceName withDictionary:@{@"check_in":checkin,@"check_out":checkout, @"city_id":cityid, @"rooms":@(rooms), @"adults":@(adults), @"children":@(children)} withCompletionBlock:^(id responseData, NSError *error) {
        
        if (!error) {
            HotelSearchParser *parser = [[HotelSearchParser alloc]initWithJson:responseData];
            completionBlock(parser.hotelData, nil);
        }
        else {
            completionBlock(nil,error);
            NSLog(@"%@",error.localizedDescription);
        }
        
    }];

}

@end
