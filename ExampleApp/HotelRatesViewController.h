//
//  HotelRatesViewController.h
//  PPNSdk
//
//  Created by Sameer Siddiqui on 11/15/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HotelRatesViewController : UIViewController

+ (HotelRatesViewController *)create;

@property (nonatomic) int numberOfAdults;
@property (nonatomic) int numberOfChildren;
@property (strong, nonatomic)  NSString *checkinDate;
@property (strong, nonatomic)  NSString *checkoutDate;
@property (strong, nonatomic)  NSString *cityppnID;
@property (strong, nonatomic)  NSString *city;
@property (strong, nonatomic)  NSString *hotelID;

@end
