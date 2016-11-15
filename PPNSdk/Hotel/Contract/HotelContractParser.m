//
//  HotelContractParser.m
//  PPNSdk
//
//  Created by Sameer Siddiqui on 11/15/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import "HotelContractParser.h"

@interface HotelContractParser(){
    
    NSMutableDictionary     *_attributes;
    
}

@property (nonatomic, strong, readonly) NSDictionary *json;

@end

@implementation HotelContractParser

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
    return [[self.json objectForKey:@"getHotelContractRequest"] objectForKey:@"results"];
}

- (NSDictionary *)contract {
    return [[self data] objectForKey:@"result"];
}



@end
