//
//  departuresViewController.h
//  PPNSdk
//
//  Created by Sameer Siddiqui on 11/9/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListViewController : UIViewController
+ (ListViewController *)create;

@property (nonatomic) int numberOfAdults;
@property (nonatomic) int numberOfChildren;
@property (strong, nonatomic)  NSDate *checkinDate;
@property (strong, nonatomic)  NSDate *checkoutDate;
@property (strong, nonatomic)  NSString *cityppnID;
@property (strong, nonatomic)  NSString *city;


@end
