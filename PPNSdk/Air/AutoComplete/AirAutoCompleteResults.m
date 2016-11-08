//
//  AirAutoCompleteResults.m
//  AAADealPoC
//
//  Created by Sameer Siddiqui on 11/7/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import "AirAutoCompleteResults.h"
#import "AirAutoCompleteParser.h"
#import "PPNWebService.h"


NSString *const kAirAutoCompleteServiceName = @"air/getAutoComplete";

@implementation AirAutoCompleteResults

- (void)getAutoCompleteResultsForString:(NSString *)searchedString withCompletionBlock:(AirAutoCompleteBlock)completionBlock {
    
    PPNWebService *service = [[PPNWebService alloc]init];
    [service getResponseForService:kAirAutoCompleteServiceName withDictionary:@{@"string":searchedString,@"cities":@"true",@"airports":@"true"} withCompletionBlock:^(id responseData, NSError *error) {
        
        if (!error) {
            AirAutoCompleteParser *parser = [[AirAutoCompleteParser alloc]initWithJson:responseData];
            completionBlock(parser.airportData, parser.cityData, nil);
        }
        else {
            completionBlock(nil,nil,error);
            NSLog(@"%@",error.localizedDescription);
        }
        
    }];
}

@end
