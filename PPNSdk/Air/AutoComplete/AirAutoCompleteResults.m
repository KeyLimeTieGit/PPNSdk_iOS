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


NSString *const kServiceName = @"air/getAutoComplete";

@implementation AirAutoCompleteResults

- (void)getAutoCompleteModelForString:(NSString *)searchedString withCompletionBlock:(AirAutoCompleteBlock)completionBlock {
    
    PPNWebService *service = [[PPNWebService alloc]init];
    [service getResponseForService:kServiceName withDictionary:@{@"string":searchedString,@"cities":@"true",@"airports":@"true"} withCompletionBlock:^(id responseData, NSError *error) {
        
        if (!error) {
//            NSLog(@"%@",responseData);
            AirAutoCompleteParser *model = [[AirAutoCompleteParser alloc]initWithJson:responseData];
            completionBlock(model.airportData,model.cityData, nil);
        }
        else {
            NSLog(@"%@",error.localizedDescription);
        }
        
    }];
}

@end
