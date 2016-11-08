//
//  ViewController.m
//  ExampleApp
//
//  Created by Sameer Siddiqui on 11/8/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import "ViewController.h"
@import PPNSdk;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    AirAutoCompleteResults *autoComplete = [AirAutoCompleteResults new];
    [autoComplete getAutoCompleteModelForString:@"chicago" withCompletionBlock:^(NSArray *airports, NSArray *cities, NSError *error) {
        NSLog(@"Airports = %@\nCities = %@",airports, cities);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
