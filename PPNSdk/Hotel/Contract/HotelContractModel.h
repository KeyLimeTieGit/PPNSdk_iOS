//
//  HotelContractModel.h
//  PPNSdk
//
//  Created by Sameer Siddiqui on 11/15/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HotelContractModel : NSObject

- (instancetype)initWithJson:(NSDictionary *)json;

@property (weak, nonatomic, readonly) NSString *ppn_bundle;
@property (weak, nonatomic, readonly) NSString *check_in_date;
@property (weak, nonatomic, readonly) NSString *check_out_date;
@property (weak, nonatomic, readonly) NSString *hotel_id;
@property (weak, nonatomic, readonly) NSString *hotel_name;
@property (weak, nonatomic, readonly) NSString *hotel_phone;
@property (weak, nonatomic, readonly) NSString *star_rating;
@property (weak, nonatomic, readonly) NSString *address_line_one;
@property (weak, nonatomic, readonly) NSString *city_name;
@property (weak, nonatomic, readonly) NSString *state_code;
@property (weak, nonatomic, readonly) NSString *zip;
@property (weak, nonatomic, readonly) NSString *country_code;
@property (weak, nonatomic, readonly) NSString *check_in_time;
@property (weak, nonatomic, readonly) NSString *check_out_time;
@property (weak, nonatomic, readonly) NSString *aaa_member_benefit;
@property (weak, nonatomic, readonly) NSString *room_title;
@property (weak, nonatomic, readonly) NSString *room_description;
@property (weak, nonatomic, readonly) NSString *occupancy_limit;
@property (weak, nonatomic, readonly) NSString *display_price;
@property (weak, nonatomic, readonly) NSString *display_taxes;
@property (weak, nonatomic, readonly) NSString *display_total;
@property (weak, nonatomic, readonly) NSString *tracking_id;

@end
