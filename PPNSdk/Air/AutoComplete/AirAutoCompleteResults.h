//
//  AirAutoCompleteResults.h
//  AAADealPoC
//
//  Created by Sameer Siddiqui on 11/7/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AirAutoCompleteResults : NSObject

typedef void(^AirAutoCompleteBlock)(NSArray *airports, NSArray *cities, NSError *error);

- (void)getAutoCompleteModelForString:(NSString *)searchedString withCompletionBlock:(AirAutoCompleteBlock)completionBlock;

@end
