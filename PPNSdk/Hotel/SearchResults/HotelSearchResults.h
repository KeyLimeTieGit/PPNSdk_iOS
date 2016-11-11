//
//  HotelSearchResults.h
//  PPNSdk
//
//  Created by Sameer Siddiqui on 11/10/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HotelSearchResults : NSObject

typedef void(^HotelSearchCompletionBlock)(NSArray *hotels, NSError *error);

- (void)getHotelSearchResultsWithCheckIn:(NSString *)checkin checkout:(NSString *)checkout cityid:(NSString *)cityid rooms:(int)rooms adults:(int)adults children:(int)children withCompletionBLock:(HotelSearchCompletionBlock)completionBlock;

@end
