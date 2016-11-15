//
//  HotelContractModel.m
//  PPNSdk
//
//  Created by Sameer Siddiqui on 11/15/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import "HotelContractModel.h"

@interface HotelContractModel() {
    NSMutableDictionary     *_attributes;
}

@property (nonatomic, strong, readonly) NSDictionary *json;

@end

@implementation HotelContractModel

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

- (NSString *)ppn_bundle {
    return [[self json] objectForKey:@"ppn_bundle"];
}

- (NSString *)check_in_date {
    return [[self json] objectForKey:@"check_in"];
}

- (NSString *)check_out_date {
    return [[self json] objectForKey:@"check_out"];
}

- (NSString *)hotel_id {
    return [[[self json] objectForKey:@"hotel"] objectForKey:@"hotel_id"];
}

- (NSString *)hotel_name {
    return [[[self json] objectForKey:@"hotel"] objectForKey:@"hotel_name"];
}

- (NSString *)hotel_phone {
    return [[[self json] objectForKey:@"hotel"] objectForKey:@"phone_number"];
}

- (NSString *)star_rating {
    return [[[self json] objectForKey:@"hotel"] objectForKey:@"star_rating"];
}

- (NSString *)address_line_one {
    return [[[[self json] objectForKey:@"hotel"] objectForKey:@"address"] objectForKey:@"address_line_one"];
}

- (NSString *)city_name {
    return [[[[self json] objectForKey:@"hotel"] objectForKey:@"address"] objectForKey:@"city_name"];
}

- (NSString *)state_code {
    return [[[[self json] objectForKey:@"hotel"] objectForKey:@"address"] objectForKey:@"state_code"];
}

- (NSString *)zip {
    return [[[[self json] objectForKey:@"hotel"] objectForKey:@"address"] objectForKey:@"zip"];
}

- (NSString *)country_code {
    return [[[[self json] objectForKey:@"hotel"] objectForKey:@"address"] objectForKey:@"country_code"];
}

- (NSString *)check_in_time {
    return [[[self json] objectForKey:@"hotel"] objectForKey:@"check_in_time"];
}

- (NSString *)check_out_time {
    return [[[self json] objectForKey:@"hotel"] objectForKey:@"check_out_time"];
}

- (NSString *)aaa_member_benefit {
    return [[[[[[self json] objectForKey:@"hotel"] objectForKey:@"address"] objectForKey:@"plugin_data"] objectForKey:@"aaa"] objectForKey:@"member_benefit_text"];
}

- (NSString *)room_description {
    return [[[self json] objectForKey:@"room_info"] objectForKey:@"description"];
}

- (NSString *)room_title {
    return [[[self json] objectForKey:@"room_info"] objectForKey:@"title"];
}

- (NSString *)occupancy_limit {
    return [[[self json] objectForKey:@"room_info"] objectForKey:@"occupancy_limit"];
}

- (NSString *)display_price {
    return [[[[self json] objectForKey:@"room_info"] objectForKey:@"price_details"] objectForKey:@"display_price"];
}

- (NSString *)display_taxes {
    return [[[[self json] objectForKey:@"room_info"] objectForKey:@"price_details"] objectForKey:@"display_taxes"];
}

- (NSString *)display_total {
    return [[[[self json] objectForKey:@"room_info"] objectForKey:@"price_details"] objectForKey:@"display_total"];
}

- (NSString *)tracking_id {
    return [[self json] objectForKey:@"tracking_id"];
}
@end
