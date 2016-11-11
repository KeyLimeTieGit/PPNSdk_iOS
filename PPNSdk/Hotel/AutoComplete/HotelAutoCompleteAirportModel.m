//
//  HotelAutoCompleteAirportModel.m
//  PPNSdk
//
//  Created by Sameer Siddiqui on 11/10/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import "HotelAutoCompleteAirportModel.h"

@interface HotelAutoCompleteAirportModel() {
    NSMutableDictionary     *_attributes;
}

@property (nonatomic, strong, readonly) NSDictionary *json;

@end

@implementation HotelAutoCompleteAirportModel

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

- (NSString *)airport {
    return [[self json] objectForKey:@"airport"];
}

- (NSString *)city {
    return [[self json] objectForKey:@"city"];
}

- (NSString *)cityid_ppn {
    return [[self json] objectForKey:@"cityid_ppn"];
}

- (NSString *)country_code {
    return [[self json] objectForKey:@"country_code"];
}

- (NSString *)iata {
    return [[self json] objectForKey:@"iata"];
}

- (NSString *)state_code {
    return [[self json] objectForKey:@"state_code"];
}

- (NSString *)type {
    return [[self json] objectForKey:@"type"];
}

- (int)rank {
    return [[[self json] objectForKey:@"rank"] intValue];
}

- (NSString *)coordinate {
    return [[self json] objectForKey:@"coordinate"];
}

- (NSString *)active_car {
    return [[self json] objectForKey:@"active_car"];
}

- (NSString *)active_hotel {
    return [[self json] objectForKey:@"active_hotel"];
}

- (NSString *)active_air {
    return [[self json] objectForKey:@"active_air"];
}

- (NSString *)airport_spell {
    return [[self json] objectForKey:@"airport_spell"];
}

- (NSString *)icao {
    return [[self json] objectForKey:@"icao"];
}

- (NSString *)airport_id_ppn {
    return [[self json] objectForKey:@"airport_id_ppn"];
}

- (NSString *)active_vp {
    return [[self json] objectForKey:@"active_vp"];
}
@end
