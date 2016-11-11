//
//  HotelAutoCompleteResults.h
//  PPNSdk
//
//  Created by Sameer Siddiqui on 11/10/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HotelAutoCompleteResults : NSObject
typedef void(^HotelAutoCompleteBlock)(NSArray *airports, NSArray *cities, NSError *error);

- (void)getAutoCompleteResultsForString:(NSString *)searchedString withCompletionBlock:(HotelAutoCompleteBlock)completionBlock;

@end
