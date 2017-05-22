//
//  HotelAmenitiesModel.m
//  PPNSdk
//
//  Created by Sameer Siddiqui on 5/22/17.
//  Copyright © 2017 KeyLimeTie. All rights reserved.
//

#import "HotelAmenitiesModel.h"

@interface HotelAmenitiesModel()

@property (nonatomic, strong, readonly) NSDictionary *json;

@end

@implementation HotelAmenitiesModel

- (instancetype)initWithJson:(NSDictionary *)json {
    if (self = [super init]) {
        _json = json;
    }
    return self;
}

- (int)amenityID {
    return [[self.json objectForKey:@"id"]intValue];
}

- (NSString *)name {
    return [self.json objectForKey:@"name"];
}

@end
