//
//  UIViewController+Navigation.m
//  ACGDeals
//
//  Created by Sameer Siddiqui on 1/22/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import "UIViewController+Navigation.h"
#import "UIColor+Extensions.h"

const float buttonHeight =  35.0 * 0.85;
const float buttonWidth =  75.0 * 0.85;
const float cornerRadius = 4.0;

@implementation UIViewController (Navigation)
UIButton *rightButton;

- (void)setNavBarTitle:(NSString *)title {
    UILabel *titleLabel = [UILabel new];
    titleLabel.attributedText = [[NSAttributedString alloc]initWithString:title attributes:@{NSForegroundColorAttributeName:[UIColor gray],
                                                                                              NSFontAttributeName:[UIFont fontWithName:@"ArialMT" size:16]}];
                                 
    [titleLabel sizeToFit];
    self.navigationItem.titleView = titleLabel;
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
}

- (void)addLeftButtonImageItem:(UIImage *)image selector:(SEL)selector animation:(BOOL)animation {
    // Create a custom button with the image
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:image forState:UIControlStateNormal];
    leftButton.frame = CGRectMake(0, 0, 44, 27);
    // Add the target
    [leftButton addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    leftButton.userInteractionEnabled = NO;
    
    // Add the container bar button
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    self.navigationItem.backBarButtonItem = nil;
    
    if (animation) {
        [leftButton setAlpha:0.0f];
        [UIView animateWithDuration:0.5f animations:^{
            [leftButton setAlpha:1.0f];
        }];
    }
}

- (void)addBackButton {
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    leftButton.frame = CGRectMake(0, 0, 22, 22);
    // Add the target
    [leftButton addTarget:self action:@selector(goBackScreen) forControlEvents:UIControlEventTouchUpInside];
    leftButton.userInteractionEnabled = YES;
    
    // Add the container bar button
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    self.navigationItem.backBarButtonItem = nil;
    
    [leftButton setAlpha:0.0f];
    [UIView animateWithDuration:0.5f animations:^{
        [leftButton setAlpha:1.0f];
    }];
}

- (void)goBackScreen {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)navBarWithAAAIconAndGearIconAndTitle:(NSString *)title {
    
    [self setNavBarTitle:title];
    [self addLeftButtonImageItem:[UIImage imageNamed:@"aaa_logo"] selector:nil animation:NO];
}
@end
