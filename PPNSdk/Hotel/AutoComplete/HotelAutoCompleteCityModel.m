//
//  HotelAutoCompleteCityModel.m
//  PPNSdk
//
//  Created by Sameer Siddiqui on 11/10/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import "HotelAutoCompleteCityModel.h"


@interface HotelAutoCompleteCityModel() {
    NSMutableDictionary     *_attributes;
}

@property (nonatomic, strong, readonly) NSDictionary *json;

@end

@implementation HotelAutoCompleteCityModel

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

- (NSString *)agd_tweb_pet_count {
    return [[self json] objectForKey:@"agd_tweb_pet_count"];
}

- (NSString *)pet_count {
    return [[self json] objectForKey:@"pet_count"];
}

- (NSString *)state_code {
    return [[self json] objectForKey:@"state_code"];
}

- (NSString *)agd_pet_count {
    return [[self json] objectForKey:@"agd_pet_count"];
}

- (NSString *)nearby_airports_json {
    return [[self json] objectForKey:@"nearby_airports_json"];
}

- (NSString *)agd_tweb_count {
    return [[self json] objectForKey:@"agd_tweb_count"];
}

- (NSString *)coordinate {
    return [[self json] objectForKey:@"coordinate"];
}

- (NSString *)state {
    return [[self json] objectForKey:@"state"];
}

- (NSString *)country_code {
    return [[self json] objectForKey:@"country_code"];
}

- (NSString *)city {
    return [[self json] objectForKey:@"city"];
}

- (NSString *)country {
    return [[self json] objectForKey:@"country"];
}

- (NSString *)rank{
    return [[self json] objectForKey:@"rank"];
}

- (NSString *)tweb_pet_count {
    return [[self json] objectForKey:@"tweb_pet_count"];
}

- (NSString *)tweb_count {
    return [[self json] objectForKey:@"tweb_count"];
}

- (NSString *)cityid_ppn {
    return [[self json] objectForKey:@"cityid_ppn"];
}

- (NSString *)longitude {
    return [[self json] objectForKey:@"longitude"];
}

- (NSString *)bkg_tweb_count {
    return [[self json] objectForKey:@"bkg_tweb_count"];
}

- (NSString *)agd_count {
    return [[self json] objectForKey:@"agd_count"];
}

- (NSString *)latitude {
    return [[self json] objectForKey:@"latitude"];
}

- (NSString *)hotel_count {
    return [[self json] objectForKey:@"hotel_count"];
}

- (NSString *)bkg_tweb_pet_count {
    return [[self json] objectForKey:@"bkg_tweb_pet_count"];
}

- (NSString *)type{
    return [[self json] objectForKey:@"type"];
}

@end
