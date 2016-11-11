//
//  HotelAutoCompleteAirportModel.h
//  PPNSdk
//
//  Created by Sameer Siddiqui on 11/10/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HotelAutoCompleteAirportModel : NSObject

- (instancetype)initWithJson:(NSDictionary *)json;

@property (weak, nonatomic, readonly) NSString *airport;
@property (weak, nonatomic, readonly) NSString *city;
@property (weak, nonatomic, readonly) NSString *cityid_ppn;
@property (weak, nonatomic, readonly) NSString *country_code;
@property (weak, nonatomic, readonly) NSString *iata;
@property (weak, nonatomic, readonly) NSString *state_code;
@property (weak, nonatomic, readonly) NSString *type;
@property (weak, nonatomic, readonly) NSString *coordinate;
@property (weak, nonatomic, readonly) NSString *active_car;
@property (weak, nonatomic, readonly) NSString *active_hotel;
@property (weak, nonatomic, readonly) NSString *active_air;
@property (weak, nonatomic, readonly) NSString *airport_spell;
@property (weak, nonatomic, readonly) NSString *icao;
@property (weak, nonatomic, readonly) NSString *airport_id_ppn;
@property (weak, nonatomic, readonly) NSString *active_vp;

@property (nonatomic) int rank;

@end
