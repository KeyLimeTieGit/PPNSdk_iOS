//
//  FlightDepartureResults.m
//  PPNSdk
//
//  Created by Sameer Siddiqui on 11/8/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import "FlightDepartureResults.h"
#import "PPNWebService.h"
#import "PPNInternalManager.h"
#import "FlightDepartureParser.h"




NSString *const kFlightDepartureServiceName = @"air/getFlightDepartures";

@implementation FlightDepartureResults


- (void)getFlightDepartureResultsForNumberOfAdults:(int)adults originCode:(NSString *)origin destinationCode:(NSString *)destination departureDate:(NSString *)departure withCompletionBlock:(FlightDepartureCompletionBlock)completionBlock {
    
    NSString *originArray = [origin rangeOfCharacterFromSet:[NSCharacterSet decimalDigitCharacterSet]].location != NSNotFound ? @"origin_city_id[]" : @"origin_airport_code[]" ;
    NSString *destinationArray = [destination rangeOfCharacterFromSet:[NSCharacterSet decimalDigitCharacterSet]].location != NSNotFound ? @"destination_city_id[]" : @"destination_airport_code[]" ;
    
    
    PPNWebService *service = [[PPNWebService alloc]init];
    [service getResponseForService:kFlightDepartureServiceName withDictionary:@{@"sid":[PPNInternalManager internalManager].sessionID, @"adults":@(adults) ,originArray:origin, destinationArray:destination, @"departure_date[]":departure} withCompletionBlock:^(id responseData, NSError *error) {
        
        if (!error) {
            FlightDepartureParser *parser = [[FlightDepartureParser alloc]initWithJson:responseData];
            completionBlock(parser.itineraries, nil);
        }
        else {
            completionBlock(nil, error);
            NSLog(@"%@",error.localizedDescription);
        }
        
    }];
}


@end
