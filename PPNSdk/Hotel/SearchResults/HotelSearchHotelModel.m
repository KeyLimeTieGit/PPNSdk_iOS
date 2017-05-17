//
//  HotelSearchHotelModel.m
//  PPNSdk
//
//  Created by Sameer Siddiqui on 11/10/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import "HotelSearchHotelModel.h"

@interface HotelSearchHotelModel(){
    NSMutableDictionary     *_attributes;
}

@property (nonatomic, strong, readonly) NSDictionary *json;


@end


@implementation HotelSearchHotelModel

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


- (NSString *)hotel_id {
    return [[self json] objectForKey:@"id"];
}

- (NSString *)name {
    return [[self json] objectForKey:@"name"];
}

- (NSString *)star_rating {
    return [[self json] objectForKey:@"star_rating"];
}

- (NSString *)review_rating {
    return [[self json] objectForKey:@"review_rating"];
}

- (NSString *)review_rating_desc {
    return [[self json] objectForKey:@"review_rating_desc"];
}

- (NSString *)thumbnail {
    return [[self json] objectForKey:@"thumbnail"];
}

- (NSString *)thumbnailx150 {
    return [[[self json] objectForKey:@"thumbnail_hq"] objectForKey:@"hundred_fifty_square"];
}

- (NSString *)thumbnailx300 {
    return [[[self json] objectForKey:@"thumbnail_hq"] objectForKey:@"three_hundred_square"];
}

- (NSString *)city_name {
    return [[[self json] objectForKey:@"address"] objectForKey:@"city_name"];
}

- (NSString *)address_line_one {
    return [[[self json] objectForKey:@"address"] objectForKey:@"address_line_one"];
}

- (NSString *)state_code {
    return [[[self json] objectForKey:@"address"] objectForKey:@"state_code"];
}

- (NSString *)state_name {
    return [[[self json] objectForKey:@"address"] objectForKey:@"state_name"];
}

- (NSString *)country_code {
    return [[[self json] objectForKey:@"address"] objectForKey:@"country_code"];
}

- (NSString *)country_name {
    return [[[self json] objectForKey:@"address"] objectForKey:@"country_name"];
}

- (NSString *)zip {
    return [[[self json] objectForKey:@"address"] objectForKey:@"zip"];
}

- (NSString *)neighborhood_name {
    NSDictionary *neighborhood = [[self json] objectForKey:@"neighborhood"];
    if (neighborhood != nil && ![neighborhood isKindOfClass:[NSNull class]]) {
        NSString *str = [neighborhood objectForKey:@"name"];
        if (str != nil && ![str isKindOfClass:[NSNull class]]) {
            return str;
        }
        else return @"";
    }
    else return @"";
    
}

- (NSString *)display_price {
    return [[[self json] objectForKey:@"static_low_rate"] objectForKey:@"display_price"];
}

- (NSString *)display_symbol {
    return [[[self json] objectForKey:@"static_low_rate"] objectForKey:@"display_symbol"];
}

- (NSString *)display_currency {
    return [[[self json] objectForKey:@"static_low_rate"] objectForKey:@"display_currency"];
}

- (int)review_count {
    return [[[self json] objectForKey:@"review_count"] intValue];
}

- (id)checkIfEmpty:(id)object {
    if ([object isKindOfClass:[NSNull class]]) return nil;
    else if ([object isKindOfClass:[NSString class]] && [object isEqualToString:@""]) return nil;
    else return object;
}

@end
