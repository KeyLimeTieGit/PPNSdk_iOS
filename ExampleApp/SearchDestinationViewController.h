//
//  SearchDestinationViewController.h
//  PPNSdk
//
//  Created by Sameer Siddiqui on 5/17/17.
//  Copyright © 2017 KeyLimeTie. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SearchDestinationDelegate <NSObject>

- (void)didSelectCity:(NSString *)city withCityPPNID:(NSString *)city_PPN_ID;

@end

@interface SearchDestinationViewController : UIViewController
+ (SearchDestinationViewController *)create;
@property (weak, nonatomic) id <SearchDestinationDelegate> delegate;
@end
