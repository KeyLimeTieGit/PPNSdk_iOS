//
//  AutoCompleteAirportModel.m
//  PPNSdk
//
//  Created by Sameer Siddiqui on 11/8/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import "AirAutoCompleteAirportModel.h"

@interface AirAutoCompleteAirportModel() {
    NSMutableDictionary     *_attributes;
}

@property (nonatomic, strong, readonly) NSDictionary *json;

@end


@implementation AirAutoCompleteAirportModel

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

@end
