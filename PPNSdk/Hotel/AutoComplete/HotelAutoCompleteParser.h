//
//  HotelAutoCompleteParser.h
//  PPNSdk
//
//  Created by Sameer Siddiqui on 11/10/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HotelAutoCompleteParser : NSObject
- (instancetype)initWithJson:(NSDictionary *)json;

@property (weak, nonatomic, readonly) NSArray *airportData;
@property (weak, nonatomic, readonly) NSArray *cityData;

@end
