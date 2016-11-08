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


- (void)getFlightDepartureResultsForNumberOfAdults:(int)adults originAirport:(NSString *)origin destinationAirport:(NSString *)destination departureDate:(NSString *)departure withCompletionBlock:(FlightDepartureCompletionBlock)completionBlock {
    
    PPNWebService *service = [[PPNWebService alloc]init];
    [service getResponseForService:kFlightDepartureServiceName withDictionary:@{@"sid":[PPNInternalManager internalManager].sessionID, @"adults":@(adults) ,@"origin_airport_code[]":origin, @"destination_airport_code[]":destination, @"departure_date[]":departure} withCompletionBlock:^(id responseData, NSError *error) {
        
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
