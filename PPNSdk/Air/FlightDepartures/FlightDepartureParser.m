//
//  FlightDepartureParser.m
//  PPNSdk
//
//  Created by Sameer Siddiqui on 11/8/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import "FlightDepartureParser.h"


@interface FlightDepartureParser() {
    NSMutableDictionary *_attributes;
    
}
@property (nonatomic, strong, readonly) NSDictionary *json;

@end


@implementation FlightDepartureParser

- (instancetype)initWithJson:(NSDictionary *)json {
    if (self = [super init]) {
        _json = json;
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@", self.json.description];
}

- (NSDictionary *)getAttributes {
    return _attributes.copy;
}

- (NSDictionary *)itineraryData {
    return [[[[self.json objectForKey:@"getAirFlightDepartures"] objectForKey:@"results"] objectForKey:@"result"] objectForKey:@"itinerary_data"] ;
}

- (NSArray *)itineraries {
    
    NSDictionary *itenDict = [self itineraryData];
    NSMutableArray *mut = [NSMutableArray new];
    for (NSString *key in itenDict) {
        [mut addObject:[[self itineraryData] objectForKey:key]];
    }
    return mut;
}

@end
