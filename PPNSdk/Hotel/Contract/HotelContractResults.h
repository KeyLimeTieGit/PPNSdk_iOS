//
//  HotelContractResults.h
//  PPNSdk
//
//  Created by Sameer Siddiqui on 11/15/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HotelContractModel.h"


@interface HotelContractResults : NSObject

typedef void(^HotelContractCompletionBlock)(HotelContractModel *contract, NSError *error);

- (void)getHotelContractForBundle:(NSString *)ppn_bundle withCompletionBlock:(HotelContractCompletionBlock)completionBlock;

@end
