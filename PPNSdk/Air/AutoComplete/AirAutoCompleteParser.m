//
//  AutoCompleteModel.m
//  AAADealPoC
//
//  Created by Sameer Siddiqui on 11/7/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import "AirAutoCompleteParser.h"

@interface AirAutoCompleteParser() {
    NSMutableDictionary     *_attributes;

}
@property (nonatomic, strong, readonly) NSDictionary *json;

@end

@implementation AirAutoCompleteParser

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

- (NSDictionary *)data {
    return [[[[[self.json objectForKey:@"getAirAutoComplete"] objectForKey:@"results"] objectForKey:@"getSolr"] objectForKey:@"results"] objectForKey:@"data"];
}

- (NSArray *)airportData {
    NSMutableArray *mut = [NSMutableArray new];
    NSDictionary *airport_data = [[self data] objectForKey:@"airport_data"];
    for (NSString *key in airport_data) {
        [mut addObject:[airport_data objectForKey:key]];
    }
    return mut;
}

- (NSArray *)cityData {
    NSMutableArray *mut = [NSMutableArray new];
    NSDictionary *city_data = [[self data] objectForKey:@"city_data"];
    for (NSString *key in city_data) {
        [mut addObject:[city_data objectForKey:key]];
    }
    return mut;
}


@end
