//
//  HotelAutoCompleteResults.m
//  PPNSdk
//
//  Created by Sameer Siddiqui on 11/10/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import "HotelAutoCompleteResults.h"
#import "HotelAutoCompleteParser.h"
#import "PPNWebService.h"

NSString *const kHotelAutoCompleteServiceName = @"hotel/getAutoSuggestV2";

@implementation HotelAutoCompleteResults

- (void)getAutoCompleteResultsForString:(NSString *)searchedString withCompletionBlock:(HotelAutoCompleteBlock)completionBlock {
    
    if ([searchedString length] > 2) {
        PPNWebService *service = [[PPNWebService alloc]init];
        [service getResponseForService:kHotelAutoCompleteServiceName withDictionary:@{@"string":searchedString,@"get_cities":@(1), @"get_airports":@(1)} withCompletionBlock:^(id responseData, NSError *error) {
            
            if (!error) {
                HotelAutoCompleteParser *parser = [[HotelAutoCompleteParser alloc]initWithJson:responseData];
                completionBlock(parser.airportData, parser.cityData, nil);
            }
            else {
                completionBlock(nil,nil,error);
                NSLog(@"%@",error.localizedDescription);
            }
            
        }];
    }
}



@end
