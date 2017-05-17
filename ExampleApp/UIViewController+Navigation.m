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
                                                                                              NSFontAttributeName:[UIFont fontWithName:@"Arial-BoldMT" size:13]}];
//    titleLabel.text = title;
//    titleLabel.textColor = [UIColor darkGray];
//    titleLabel.font =
                                 
    [titleLabel sizeToFit];
    self.navigationItem.titleView = titleLabel;
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
//    if ([InternalManager internalPreferences].userIsLoggedIn) {
//        [self addRightButtonImageItem:[InternalManager internalPreferences].settingsImage touchDownImage:[InternalManager internalPreferences].settingsTouchDownImage forSettings:YES animation:YES];
//    }
//    else {
//        [self addRightButtonImageItem:nil touchDownImage:nil forSettings:NO animation:NO];
//    }
}
//
//- (void)addRightButtonImageItem:(UIImage *)image touchDownImage:(UIImage *)touchDownImage forSettings:(BOOL)settings animation:(BOOL)animation {
//    // Create a custom button with the image
//    rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    
//    //button from aaa stuff
//    rightButton.layer.cornerRadius = cornerRadius;
//    rightButton.layer.borderColor = [UIColor clearColor].CGColor;
//    [rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [rightButton setTitle:@"" forState:UIControlStateNormal];
//    
//    if (settings) {
//        [rightButton addTarget:self action:@selector(settingsButtonPressed) forControlEvents:UIControlEventTouchUpInside];
//        [rightButton addTarget:self action:@selector(settingsButtonTouchedDown) forControlEvents:UIControlEventTouchDown];
//        [rightButton setImage:image forState:UIControlStateNormal];
//        [rightButton setImage:touchDownImage forState:UIControlStateHighlighted];
//        rightButton.backgroundColor = [UIColor whiteColor];
////        rightButton.imageEdgeInsets = UIEdgeInsetsMake(0.0, buttonWidth - image.size.width, 0.0, 0.0);
//        [rightButton setAttributedTitle:[[NSAttributedString alloc]initWithString:@"" attributes:nil] forState:UIControlStateNormal];
//        [rightButton setAttributedTitle:[[NSAttributedString alloc]initWithString:@"" attributes:nil] forState:UIControlStateHighlighted];
//        
//        //change this for correct frame
//        rightButton.frame = CGRectMake(0, 0, 25,25);
//
//    } else {
//        [rightButton addTarget:self action:@selector(loginUser) forControlEvents:UIControlEventTouchUpInside];
//        rightButton.backgroundColor = [UIColor coolBlue];
//        [rightButton setImage:nil forState:UIControlStateNormal];
//        [rightButton setImage:nil forState:UIControlStateHighlighted];
//        rightButton.frame = CGRectMake(0, 0, buttonWidth,buttonHeight);
//        NSMutableDictionary *fontAttribute = [FontData getFontType:FontTypeRegular WithSize:18.0 * 0.85 color:[UIColor whiteColor]].mutableCopy;
//        [fontAttribute setObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
//        [fontAttribute setObject:@(5.0) forKey:NSBaselineOffsetAttributeName];
//        NSMutableAttributedString *titleString = [[NSMutableAttributedString alloc]initWithString:@"Log in >" attributes:fontAttribute];
//        NSRange range = NSMakeRange(7, 1);
//        [titleString addAttributes:[FontData getFontType:FontTypeRegular WithSize:23.0 * 0.85 color:[UIColor whiteColor]].mutableCopy range:range];
//        [titleString addAttribute:NSBaselineOffsetAttributeName value:@(2.5) range:range];
//        [rightButton setAttributedTitle:titleString forState:UIControlStateNormal];
//        [rightButton setAttributedTitle:titleString forState:UIControlStateHighlighted];
//        [rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        [rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
//        rightButton.frame = CGRectMake(0, 0, buttonWidth,buttonHeight);
//    }
//    
////    rightButton.frame = CGRectMake(0, 0, 20,20);
//    
//    // Add the container bar button
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
//    self.navigationItem.backBarButtonItem = nil;
//    
//    if (animation) {
//        [rightButton setAlpha:0.0f];
//        [UIView animateWithDuration:0.5f animations:^{
//            [rightButton setAlpha:1.0f];
//        }];
//    }
//}
//
//- (void)settingsButtonPressed {
//    rightButton.backgroundColor = [InternalManager internalPreferences].userIsLoggedIn? [UIColor clearColor] : [UIColor coolBlue];
//    [[InternalManager internalPreferences]triggerSettings];
//}
//
//- (void)settingsButtonTouchedDown {
//    rightButton.backgroundColor = [InternalManager internalPreferences].userIsLoggedIn? [UIColor clearColor] : [UIColor coolBluePressed];
//}


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

- (void)navBarWithAAAIconAndGearIconAndTitle:(NSString *)title {
    
    [self setNavBarTitle:title];
    [self addLeftButtonImageItem:[UIImage imageNamed:@"aaa_logo"] selector:nil animation:NO];
//    if ([InternalManager internalPreferences].userIsLoggedIn) {
//        [self addRightButtonImageItem:[InternalManager internalPreferences].settingsImage touchDownImage:[InternalManager internalPreferences].settingsTouchDownImage forSettings:YES animation:YES];
//    }
//    else {
//        [self addRightButtonImageItem:nil touchDownImage:nil forSettings:NO animation:NO];
//    }
}
//
//- (void)navBarWithAAAIconAndGearIconAndJoinNow{
//    
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    [button addTarget:self
//               action:@selector(loginUser)
//     forControlEvents:UIControlEventTouchUpInside];
//    [button setAttributedTitle:[[NSAttributedString alloc]initWithString:@"Join AAA Now" attributes:@{NSForegroundColorAttributeName:[InternalManager internalPreferences].navBarTitleColor, NSFontAttributeName:[InternalManager internalPreferences].titleFont}] forState:UIControlStateNormal];
//    [button sizeToFit];
//    [button setTitle:@"Join AAA Now" forState:UIControlStateNormal];
//    
//    button.frame = CGRectMake(0, 0, 160.0, 40.0);
//    self.navigationItem.titleView =button;
//    [self addLeftButtonImageItem:[InternalManager internalPreferences].navBarLeftImage selector:nil animation:NO];
//    if ([InternalManager internalPreferences].userIsLoggedIn) {
//        [self addRightButtonImageItem:[InternalManager internalPreferences].settingsImage touchDownImage:[InternalManager internalPreferences].settingsTouchDownImage forSettings:YES animation:YES];
//    }
//    else {
//        [self addRightButtonImageItem:nil touchDownImage:nil forSettings:NO animation:NO];
//    }
//}
//
//- (void)loginUser {
//    ActivityTracking *tracker = [ActivityTracking new];
//    [tracker trackActivityForScreen:@"User Signin" ActivityID:18 DealID:0 partnerID:0];
//
//    [[InternalManager internalPreferences]triggerLogin];
//}
//
//- (void)settingsPressed {
//    [[InternalManager internalPreferences]triggerSettings];
//}

@end
