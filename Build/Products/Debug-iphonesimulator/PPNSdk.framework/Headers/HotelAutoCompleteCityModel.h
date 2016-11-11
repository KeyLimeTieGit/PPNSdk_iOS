//
//  HotelAutoCompleteCityModel.h
//  PPNSdk
//
//  Created by Sameer Siddiqui on 11/10/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HotelAutoCompleteCityModel : NSObject

- (instancetype)initWithJson:(NSDictionary *)json;

@property (weak, nonatomic, readonly) NSString *agd_tweb_pet_count;
@property (weak, nonatomic, readonly) NSString *pet_count;
@property (weak, nonatomic, readonly) NSString *state_code;
@property (weak, nonatomic, readonly) NSString *agd_pet_count;
@property (weak, nonatomic, readonly) NSString *nearby_airports_json;
@property (weak, nonatomic, readonly) NSString *agd_tweb_count;
@property (weak, nonatomic, readonly) NSString *coordinate;
@property (weak, nonatomic, readonly) NSString *state;
@property (weak, nonatomic, readonly) NSString *country_code;
@property (weak, nonatomic, readonly) NSString *city;
@property (weak, nonatomic, readonly) NSString *country;
@property (weak, nonatomic, readonly) NSString *rank;
@property (weak, nonatomic, readonly) NSString *tweb_pet_count;
@property (weak, nonatomic, readonly) NSString *tweb_count;
@property (weak, nonatomic, readonly) NSString *cityid_ppn;
@property (weak, nonatomic, readonly) NSString *longitude;
@property (weak, nonatomic, readonly) NSString *bkg_tweb_count;
@property (weak, nonatomic, readonly) NSString *agd_count;
@property (weak, nonatomic, readonly) NSString *latitude;
@property (weak, nonatomic, readonly) NSString *hotel_count;
@property (weak, nonatomic, readonly) NSString *bkg_tweb_pet_count;
@property (weak, nonatomic, readonly) NSString *type;

@end
