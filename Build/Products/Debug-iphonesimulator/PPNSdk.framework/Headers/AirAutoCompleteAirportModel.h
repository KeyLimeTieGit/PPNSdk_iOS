//
//  AutoCompleteAirportModel.h
//  PPNSdk
//
//  Created by Sameer Siddiqui on 11/8/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AirAutoCompleteAirportModel : NSObject

- (instancetype)initWithJson:(NSDictionary *)json;

@property (weak, nonatomic, readonly) NSString *airport;
@property (weak, nonatomic, readonly) NSString *city;
@property (weak, nonatomic, readonly) NSString *cityid_ppn;
@property (weak, nonatomic, readonly) NSString *country_code;
@property (weak, nonatomic, readonly) NSString *iata;
@property (weak, nonatomic, readonly) NSString *state_code;
@property (weak, nonatomic, readonly) NSString *type;
@property (nonatomic) int rank;


@end
