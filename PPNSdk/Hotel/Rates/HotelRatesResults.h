//
//  HotelRatesResults.h
//  PPNSdk
//
//  Created by Sameer Siddiqui on 11/14/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HotelRatesResults : NSObject

typedef void(^HotelRatesCompletionBlock)(NSArray *rates, NSError *error);

- (void)getHotelRatesForHotelID:(NSString *)hotelID rooms:(NSString *)rooms adults:(NSString *)adults children:(NSString *)children checkin:(NSString *)checkin checkout:(NSString *)checkout withCompletionBlock:(HotelRatesCompletionBlock)completionBlock;

@end
