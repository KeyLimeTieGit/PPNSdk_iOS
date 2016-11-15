//
//  HotelRatesViewController.h
//  PPNSdk
//
//  Created by Sameer Siddiqui on 11/15/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import "ViewController.h"

@interface HotelRatesViewController : ViewController

+ (HotelRatesViewController *)createwithHotelID:(NSString *)hotelID andPassedDictionary:(NSDictionary *)dict;

@end
