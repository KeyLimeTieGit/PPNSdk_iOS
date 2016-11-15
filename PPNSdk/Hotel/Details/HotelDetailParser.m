//
//  HotelDetailParser.m
//  PPNSdk
//
//  Created by Sameer Siddiqui on 11/11/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import "HotelDetailParser.h"

@interface HotelDetailParser() {
    NSMutableDictionary     *_attributes;
    
}

@property (nonatomic, strong, readonly) NSDictionary *json;

@end

@implementation HotelDetailParser

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
    return [[self.json objectForKey:@"getHotelHotelDetails"] objectForKey:@"results"];
}

- (NSDictionary *)hotelData {
    NSMutableArray *mut = [NSMutableArray new];
    NSDictionary *hotel_data = [[self data] objectForKey:@"hotel_data"];
    for (NSString *key in hotel_data) {
        [mut addObject:[hotel_data objectForKey:key]];
    }
    return [mut firstObject];
}


@end
