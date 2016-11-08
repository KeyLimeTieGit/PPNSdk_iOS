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


@end
