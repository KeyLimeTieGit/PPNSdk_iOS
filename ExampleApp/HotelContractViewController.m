//
//  HotelContractViewController.m
//  PPNSdk
//
//  Created by Sameer Siddiqui on 11/15/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import "HotelContractViewController.h"
@import PPNSdk;

@interface HotelContractViewController ()

@end

@implementation HotelContractViewController {
    NSString *ppnbundle;
    UIActivityIndicatorView *activity;
}

+ (HotelContractViewController *)createwithBundle:(NSString *)ppn_bundle {
    NSBundle *frameworkBundle = [NSBundle bundleForClass:[self class]];
    HotelContractViewController *main = [[UIStoryboard storyboardWithName:@"Main" bundle:frameworkBundle] instantiateViewControllerWithIdentifier:NSStringFromClass([HotelContractViewController class])];
    main->ppnbundle = ppn_bundle;

    return main;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    activity = [[UIActivityIndicatorView alloc]init];
    activity.center = self.view.center;
    [self.view addSubview:activity];
    [activity setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    [activity hidesWhenStopped];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [activity startAnimating];
    });

    
    HotelContractResults *results = [HotelContractResults new];
    [results getHotelContractForBundle:ppnbundle withCompletionBlock:^(HotelContractModel *contract, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [activity stopAnimating];
        });

        NSLog(@"%@", contract.room_description);
    }];
    
}

@end
