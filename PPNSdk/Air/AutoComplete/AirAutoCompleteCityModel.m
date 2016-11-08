//
//  AirAutoCompleteCityModel.m
//  PPNSdk
//
//  Created by Sameer Siddiqui on 11/8/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import "AirAutoCompleteCityModel.h"

@interface AirAutoCompleteCityModel() {
    NSMutableDictionary     *_attributes;
}

@property (nonatomic, strong, readonly) NSDictionary *json;

@end


@implementation AirAutoCompleteCityModel

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


- (NSString *)city {
    return [[self json] objectForKey:@"city"];
}

- (NSString *)city_code {
    return [[self json] objectForKey:@"city_code"];
}

- (NSString *)cityid_air {
    return [[self json] objectForKey:@"cityid_air"];
}

- (NSString *)cityid_ppn {
    return [[self json] objectForKey:@"cityid_ppn"];
}

- (NSString *)cityid_t {
    return [[self json] objectForKey:@"cityid_t"];
}

- (NSString *)coordinates {
    return [[self json] objectForKey:@"coordinate"];
}

- (NSString *)country {
    return [[self json] objectForKey:@"country"];
}

- (NSString *)country_code {
    return [[self json] objectForKey:@"country_code"];
}

- (NSString *)latitude {
    return [[self json] objectForKey:@"latitude"];
}

- (NSString *)longitude {
    return [[self json] objectForKey:@"longitude"];
}

- (NSString *)score {
    return [[self json] objectForKey:@"score"];
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
