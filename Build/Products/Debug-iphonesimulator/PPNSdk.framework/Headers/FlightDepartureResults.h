//
//  FlightDepartureResults.h
//  PPNSdk
//
//  Created by Sameer Siddiqui on 11/8/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FlightDepartureResults : NSObject

typedef void(^FlightDepartureCompletionBlock)(NSArray *itineraries, NSError *error);

- (void)getFlightDepartureResultsForNumberOfAdults:(int)adults originAirport:(NSString *)origin destinationAirport:(NSString *)destination departureDate:(NSString *)departure withCompletionBlock:(FlightDepartureCompletionBlock)completionBlock;

@end
