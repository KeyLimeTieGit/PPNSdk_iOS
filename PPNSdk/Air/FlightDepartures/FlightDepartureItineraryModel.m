//
//  FlightDepartureItineraryModel.m
//  PPNSdk
//
//  Created by Sameer Siddiqui on 11/8/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import "FlightDepartureItineraryModel.h"

@interface FlightDepartureItineraryModel() {
    NSMutableDictionary     *_attributes;
}

@property (nonatomic, strong, readonly) NSDictionary *json;

@end

@implementation FlightDepartureItineraryModel

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

#pragma mark - Properties

- (NSDictionary *)priceDetails {
    return [self.json objectForKey:@"price_details"];
}

- (NSDictionary *)slice_data{
    NSMutableArray *mut = [NSMutableArray new];
    NSDictionary *slice = [self.json objectForKey:@"slice_data"];
    for (NSString *key in slice) {
        [mut addObject:[slice objectForKey:key]];
    }
    
    return [mut objectAtIndex:0];
}

- (NSString *)currency {
    return [[self priceDetails] objectForKey:@"display_currency"];
}

- (NSString *)currency_symbol {
    return [[self priceDetails] objectForKey:@"display_symbol"];
}

- (double)base_fare {
    return [[[self priceDetails] objectForKey:@"display_base_fare"] doubleValue];
}

- (double)taxes {
    return [[[self priceDetails] objectForKey:@"display_taxes"] doubleValue];
}

- (double)fees {
    return [[[self priceDetails] objectForKey:@"display_fees"] doubleValue];
}

- (double)taxes_and_fees {
    return [[[self priceDetails] objectForKey:@"display_taxes_and_fees"] doubleValue];
}

- (double)fare_per_ticket {
    return [[[self priceDetails] objectForKey:@"display_total_fare_per_ticket"] doubleValue];
}

- (double)total_fare {
    return [[[self priceDetails] objectForKey:@"display_total_fare"] doubleValue];
}

- (NSString *)ppn_contract_bundle {
    return [self.json objectForKey:@"ppn_contract_bundle"];
}

- (NSString *)ppn_seat_bundle {
    return [self.json objectForKey:@"ppn_seat_bundle"];
}

- (NSString *)flight_duration {
    return [[[self slice_data] objectForKey:@"info"] objectForKey:@"duration"];
}

- (int)connection_count {
    return [[[[self slice_data] objectForKey:@"info"] objectForKey:@"connection_count"] intValue];
}

- (int)stop_count {
    return [[[[self slice_data] objectForKey:@"info"] objectForKey:@"stop_count"] intValue];
}

- (NSString *)notes {
    return [[[self slice_data] objectForKey:@"info"] objectForKey:@"notes"];
}

- (NSString *)airline_code {
    return [[[self slice_data] objectForKey:@"airline"] objectForKey:@"code"];
}

- (NSString *)airline_name {
    return [[[self slice_data] objectForKey:@"airline"] objectForKey:@"name"];
}

- (NSString *)airline_logo {
    return [[[self slice_data] objectForKey:@"airline"] objectForKey:@"logo"];
}

- (int)airline_count {
    return [[[[self slice_data] objectForKey:@"airline"] objectForKey:@"airline_count"] intValue];
}

- (NSString *)departure_airport_code {
    return [[[[self slice_data] objectForKey:@"departure"] objectForKey:@"airport"] objectForKey:@"code"];
}

- (NSString *)departure_airport_name {
    return [[[[self slice_data] objectForKey:@"departure"] objectForKey:@"airport"] objectForKey:@"name"];
}

- (NSString *)departure_airport_city {
    return [[[[self slice_data] objectForKey:@"departure"] objectForKey:@"airport"] objectForKey:@"city"];
}

- (NSString *)departure_airport_state {
    return [[[[self slice_data] objectForKey:@"departure"] objectForKey:@"airport"] objectForKey:@"state"];
}

-(NSString *)departure_airport_country {
    return [[[[self slice_data] objectForKey:@"departure"] objectForKey:@"airport"] objectForKey:@"country"];
}

- (NSString *)departure_date {
    return [[[[self slice_data] objectForKey:@"departure"] objectForKey:@"datetime"] objectForKey:@"date"];
}

- (NSString *)departure_date_long {
    return [[[[self slice_data] objectForKey:@"departure"] objectForKey:@"datetime"] objectForKey:@"date_display"];
}

- (NSString *)departure_time_12h {
    return [[[[self slice_data] objectForKey:@"departure"] objectForKey:@"datetime"] objectForKey:@"time_12h"];
}

- (NSString *)departure_time_24h {
    return [[[[self slice_data] objectForKey:@"departure"] objectForKey:@"datetime"] objectForKey:@"time_24h"];
}

- (NSString *)arrival_airport_code {
    return [[[[self slice_data] objectForKey:@"arrival"] objectForKey:@"airport"] objectForKey:@"code"];
}

- (NSString *)arrival_airport_name {
    return [[[[self slice_data] objectForKey:@"arrival"] objectForKey:@"airport"] objectForKey:@"name"];
}

- (NSString *)arrival_airport_city {
    return [[[[self slice_data] objectForKey:@"arrival"] objectForKey:@"airport"] objectForKey:@"city"];
}

- (NSString *)arrival_airport_state {
    return [[[[self slice_data] objectForKey:@"arrival"] objectForKey:@"airport"] objectForKey:@"state"];
}

-(NSString *)arrival_airport_country {
    return [[[[self slice_data] objectForKey:@"arrival"] objectForKey:@"airport"] objectForKey:@"country"];
}

- (NSString *)arrival_date {
    return [[[[self slice_data] objectForKey:@"arrival"] objectForKey:@"datetime"] objectForKey:@"date"];
}

- (NSString *)arrival_date_long {
    return [[[[self slice_data] objectForKey:@"arrival"] objectForKey:@"datetime"] objectForKey:@"date_display"];
}

- (NSString *)arrival_time_12h {
    return [[[[self slice_data] objectForKey:@"arrival"] objectForKey:@"datetime"] objectForKey:@"time_12h"];
}

- (NSString *)arrival_time_24h {
    return [[[[self slice_data] objectForKey:@"arrival"] objectForKey:@"datetime"] objectForKey:@"time_24h"];
}

- (NSArray *)connections {
    NSMutableArray *mut = [NSMutableArray new];
    NSDictionary *connectiondata = [[self slice_data] objectForKey:@"flight_data"];
    for (NSString *key in connectiondata) {
        [mut addObject:[connectiondata objectForKey:key]];
    }
    return mut;
}


@end
