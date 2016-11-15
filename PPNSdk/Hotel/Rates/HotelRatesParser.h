//
//  HotelRatesParser.h
//  PPNSdk
//
//  Created by Sameer Siddiqui on 11/15/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HotelRatesParser : NSObject

- (instancetype)initWithJson:(NSDictionary *)json;

@property (weak, nonatomic, readonly) NSArray *rates;

@end
