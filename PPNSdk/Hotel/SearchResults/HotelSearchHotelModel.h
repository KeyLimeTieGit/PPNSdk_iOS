//
//  HotelSearchHotelModel.h
//  PPNSdk
//
//  Created by Sameer Siddiqui on 11/10/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HotelSearchHotelModel : NSObject

- (instancetype)initWithJson:(NSDictionary *)json;

@property (weak, nonatomic, readonly) NSString *hotel_id;
@property (weak, nonatomic, readonly) NSString *name;
@property (weak, nonatomic, readonly) NSString *star_rating;
@property (weak, nonatomic, readonly) NSString *review_rating;
@property (weak, nonatomic, readonly) NSString *review_rating_desc;
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
@property (weak, nonatomic, readonly) NSString *display_price;
@property (weak, nonatomic, readonly) NSString *display_symbol;
@property (weak, nonatomic, readonly) NSString *display_currency;

@property (nonatomic) int review_count;

@end
