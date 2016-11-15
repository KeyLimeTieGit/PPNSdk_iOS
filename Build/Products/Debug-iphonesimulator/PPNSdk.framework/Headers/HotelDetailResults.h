//
//  HotelDetailResults.h
//  PPNSdk
//
//  Created by Sameer Siddiqui on 11/11/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HotelDetailModel.h"


@interface HotelDetailResults : NSObject

typedef void(^HotelDetailCompletionBlock)(HotelDetailModel *hotel, NSError *error);

- (void)getHotelDetailForHotelID:(NSString *)hotelID withCompletionBlock:(HotelDetailCompletionBlock)completionBlock;

@end
