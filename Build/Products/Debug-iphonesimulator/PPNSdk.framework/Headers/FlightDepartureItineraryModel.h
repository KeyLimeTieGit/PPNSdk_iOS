//
//  FlightDepartureItineraryModel.h
//  PPNSdk
//
//  Created by Sameer Siddiqui on 11/8/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FlightDepartureItineraryModel : NSObject

- (instancetype)initWithJson:(NSDictionary *)json;

@property (weak, nonatomic, readonly) NSString *currency;
@property (weak, nonatomic, readonly) NSString *currency_symbol;
@property (weak, nonatomic, readonly) NSString *ppn_contract_bundle;
@property (weak, nonatomic, readonly) NSString *ppn_seat_bundle;
@property (weak, nonatomic, readonly) NSString *flight_duration;
@property (weak, nonatomic, readonly) NSString *notes;
@property (weak, nonatomic, readonly) NSString *airline_code;
@property (weak, nonatomic, readonly) NSString *airline_name;
@property (weak, nonatomic, readonly) NSString *airline_logo;
@property (weak, nonatomic, readonly) NSString *departure_airport_code;
@property (weak, nonatomic, readonly) NSString *departure_airport_name;
@property (weak, nonatomic, readonly) NSString *departure_airport_city;
@property (weak, nonatomic, readonly) NSString *departure_airport_state;
@property (weak, nonatomic, readonly) NSString *departure_airport_country;
@property (weak, nonatomic, readonly) NSString *departure_date;
@property (weak, nonatomic, readonly) NSString *departure_date_long;
@property (weak, nonatomic, readonly) NSString *departure_time_24h;
@property (weak, nonatomic, readonly) NSString *departure_time_12h;
@property (weak, nonatomic, readonly) NSString *arrival_airport_code;
@property (weak, nonatomic, readonly) NSString *arrival_airport_name;
@property (weak, nonatomic, readonly) NSString *arrival_airport_city;
@property (weak, nonatomic, readonly) NSString *arrival_airport_state;
@property (weak, nonatomic, readonly) NSString *arrival_airport_country;
@property (weak, nonatomic, readonly) NSString *arrival_date;
@property (weak, nonatomic, readonly) NSString *arrival_date_long;
@property (weak, nonatomic, readonly) NSString *arrival_time_24h;
@property (weak, nonatomic, readonly) NSString *arrival_time_12h;

@property (weak, nonatomic, readonly) NSArray *connections;

@property (nonatomic) double base_fare;
@property (nonatomic) double taxes;
@property (nonatomic) double fees;
@property (nonatomic) double taxes_and_fees;
@property (nonatomic) double fare_per_ticket;
@property (nonatomic) double total_fare;

@property (nonatomic) int connection_count;
@property (nonatomic) int stop_count;
@property (nonatomic) int airline_count;

@end
