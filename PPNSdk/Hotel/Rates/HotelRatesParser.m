//
//  HotelRatesParser.m
//  PPNSdk
//
//  Created by Sameer Siddiqui on 11/15/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import "HotelRatesParser.h"

@interface HotelRatesParser() {

    NSMutableDictionary     *_attributes;
    
}

@property (nonatomic, strong, readonly) NSDictionary *json;


@end

@implementation HotelRatesParser

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

- (NSDictionary *)data {
    return [[self.json objectForKey:@"getHotelRates.Live.Multi"] objectForKey:@"results"];
}

- (NSArray *)rates {
    NSMutableArray *mut = [NSMutableArray new];
    NSDictionary *hotel_data = [[self data] objectForKey:@"hotel_data"];
    for (NSString *key in hotel_data) {
        [mut addObject:[hotel_data objectForKey:key]];
    }
    NSMutableArray *ratemut = [NSMutableArray new];
    NSDictionary *rateData = [[mut firstObject] objectForKey:@"rate_data"];
    for (NSString *key in rateData) {
        [ratemut addObject:[rateData objectForKey:key]];
    }
    
    return ratemut.copy;
}


@end
