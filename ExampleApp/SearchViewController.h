//
//  SearchViewController.h
//  PPNSdk
//
//  Created by Sameer Siddiqui on 11/8/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SearchVCDelegate <NSObject>

- (void)didSelectValue:(NSString *)string;

@end

@interface SearchViewController : UIViewController
+ (SearchViewController *)create;
@property (weak, nonatomic) id <SearchVCDelegate> delegate;

@end
