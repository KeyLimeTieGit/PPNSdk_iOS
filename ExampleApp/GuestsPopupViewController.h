//
//  GuestsPopupViewController.h
//  PPNSdk
//
//  Created by Sameer Siddiqui on 5/18/17.
//  Copyright © 2017 KeyLimeTie. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GuestsDelegate <NSObject>

- (void)didSelectNumberOfAdults:(int)adults andChildren:(int)children;

@end

@interface GuestsPopupViewController : UIViewController
+ (GuestsPopupViewController *)create;
@property (weak, nonatomic) id <GuestsDelegate> delegate;
@end
