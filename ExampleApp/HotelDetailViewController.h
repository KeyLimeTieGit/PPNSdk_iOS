//
//  HotelDetailViewController.h
//  PPNSdk
//
//  Created by Sameer Siddiqui on 11/11/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import "ViewController.h"

@interface HotelDetailViewController : ViewController

+ (HotelDetailViewController *)createwithHotelID:(NSString *)hotelID;

@property (nonatomic, weak) NSDictionary *passedDict;

@end
