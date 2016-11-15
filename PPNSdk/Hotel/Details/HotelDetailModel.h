//
//  HotelDetailModel.h
//  PPNSdk
//
//  Created by Sameer Siddiqui on 11/11/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HotelDetailModel : NSObject

- (instancetype)initWithJson:(NSDictionary *)json;

@property (weak, nonatomic, readonly) NSString *hotel_id;
@property (weak, nonatomic, readonly) NSString *hotel_id_a;
@property (weak, nonatomic, readonly) NSString *hotel_id_b;
@property (weak, nonatomic, readonly) NSString *hotel_id_t;
@property (weak, nonatomic, readonly) NSString *hotel_id_r;
@property (weak, nonatomic, readonly) NSString *name;
@property (weak, nonatomic, readonly) NSString *star_rating;
@property (weak, nonatomic, readonly) NSString *review_rating;
@property (weak, nonatomic, readonly) NSString *review_rating_desc;
@property (weak, nonatomic, readonly) NSString *bookingURL;
@property (weak, nonatomic, readonly) NSString *thumbnail;
@property (weak, nonatomic, readonly) NSString *thumbnailx150;
@property (weak, nonatomic, readonly) NSString *thumbnailx300;
@property (weak, nonatomic, readonly) NSString *city_name;
@property (weak, nonatomic, readonly) NSString *address_line_one;
@property (weak, nonatomic, readonly) NSString *state_code;
@property (weak, nonatomic, readonly) NSString *state_name;
@property (weak, nonatomic, readonly) NSString *country_code;
@property (weak, nonatomic, readonly) NSString *country_name;
@property (weak, nonatomic, readonly) NSString *zip;
@property (weak, nonatomic, readonly) NSString *neighborhood_name;
@property (weak, nonatomic, readonly) NSString *low_rate_display_price;
@property (weak, nonatomic, readonly) NSString *low_rate_display_symbol;
@property (weak, nonatomic, readonly) NSString *low_rate_display_currency;
@property (weak, nonatomic, readonly) NSString *check_in_time;
@property (weak, nonatomic, readonly) NSString *check_out_time;
@property (weak, nonatomic, readonly) NSString *hotel_description;
@property (weak, nonatomic, readonly) NSString *room_count;

@property (nonatomic) int review_count;

@end
