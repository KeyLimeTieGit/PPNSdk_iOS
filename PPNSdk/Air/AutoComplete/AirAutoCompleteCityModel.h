//
//  AirAutoCompleteCityModel.h
//  PPNSdk
//
//  Created by Sameer Siddiqui on 11/8/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AirAutoCompleteCityModel : NSObject

- (instancetype)initWithJson:(NSDictionary *)json;

@property (weak, nonatomic, readonly) NSString *city;
@property (weak, nonatomic, readonly) NSString *city_code;
@property (weak, nonatomic, readonly) NSString *cityid_air;
@property (weak, nonatomic, readonly) NSString *cityid_ppn;
@property (weak, nonatomic, readonly) NSString *cityid_t;
@property (weak, nonatomic, readonly) NSString *coordinates;
@property (weak, nonatomic, readonly) NSString *country;
@property (weak, nonatomic, readonly) NSString *country_code;
@property (weak, nonatomic, readonly) NSString *latitude;
@property (weak, nonatomic, readonly) NSString *longitude;
@property (weak, nonatomic, readonly) NSString *score;
@property (weak, nonatomic, readonly) NSString *state_code;
@property (weak, nonatomic, readonly) NSString *type;
@property (nonatomic) int rank;

@end
