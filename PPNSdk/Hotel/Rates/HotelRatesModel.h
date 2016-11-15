//
//  HotelRatesModel.h
//  PPNSdk
//
//  Created by Sameer Siddiqui on 11/15/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HotelRatesModel : NSObject

- (instancetype)initWithJson:(NSDictionary *)json;

@property (weak, nonatomic, readonly) NSString *hotel_description;
@property (weak, nonatomic, readonly) NSString *book_policy;
@property (weak, nonatomic, readonly) NSString *promo;
@property (weak, nonatomic, readonly) NSString *title;
@property (weak, nonatomic, readonly) NSString *ppn_bundle;
@property (weak, nonatomic, readonly) NSString *prepaid;

@property (nonatomic) double display_total;

@end
