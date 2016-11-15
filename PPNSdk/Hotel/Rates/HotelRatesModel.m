//
//  HotelRatesModel.m
//  PPNSdk
//
//  Created by Sameer Siddiqui on 11/15/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import "HotelRatesModel.h"

@interface HotelRatesModel() {
    NSMutableDictionary     *_attributes;
}

@property (nonatomic, strong, readonly) NSDictionary *json;


@end

@implementation HotelRatesModel

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

- (NSString *)hotel_description {
    return [[self json] objectForKey:@"description"];
}

- (NSString *)book_policy {
    return [[[self json] objectForKey:@"details_summary"] objectForKey:@"book_policy"];
}

- (NSString *)promo {
    return [[[self json] objectForKey:@"details_summary"] objectForKey:@"promo"];
}

- (NSString *)title {
    return [[self json] objectForKey:@"title"];
}

- (NSString *)ppn_bundle {
    return [[self json] objectForKey:@"ppn_bundle"];
}

- (NSString *)prepaid {
    return [[self json] objectForKey:@"prepaid"];
}

- (double)display_total {
    return [[[[self json] objectForKey:@"price_details"] objectForKey:@"display_total"] doubleValue];
}

@end
