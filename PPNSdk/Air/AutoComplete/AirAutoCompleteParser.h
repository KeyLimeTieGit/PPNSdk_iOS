//
//  AutoCompleteModel.h
//  AAADealPoC
//
//  Created by Sameer Siddiqui on 11/7/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AirAutoCompleteParser : NSObject

- (instancetype)initWithJson:(NSDictionary *)json;

@property (weak, nonatomic, readonly) NSArray *airportData;
@property (weak, nonatomic, readonly) NSArray *cityData;

@end
