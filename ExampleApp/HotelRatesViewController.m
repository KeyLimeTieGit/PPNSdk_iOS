//
//  HotelRatesViewController.m
//  PPNSdk
//
//  Created by Sameer Siddiqui on 11/15/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import "HotelRatesViewController.h"
@import PPNSdk;

@interface HotelRatesViewController ()

@end

@implementation HotelRatesViewController {
    NSString *hotelid;
    NSDictionary *passedDict;
}

+ (HotelRatesViewController *)createwithHotelID:(NSString *)hotelID andPassedDictionary:(NSDictionary *)dict{
    NSBundle *frameworkBundle = [NSBundle bundleForClass:[self class]];
    HotelRatesViewController *main = [[UIStoryboard storyboardWithName:@"Main" bundle:frameworkBundle] instantiateViewControllerWithIdentifier:NSStringFromClass([HotelRatesViewController class])];
    main->hotelid = hotelID;
    main->passedDict = dict;
    return main;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"%@",passedDict);
    NSString *checkinDate = [passedDict objectForKey:@"checkindate"];
    NSString *checkoutDate = [passedDict objectForKey:@"checkoutdate"];
    NSArray *checkinArray = [checkinDate componentsSeparatedByString:@"/"];
    NSArray *checkoutArray = [checkoutDate componentsSeparatedByString:@"/"];
    
    NSString *newcheckin = [NSString stringWithFormat:@"%@-%@-%@",[checkinArray objectAtIndex:2],[checkinArray objectAtIndex:0],[checkinArray objectAtIndex:1]];
    NSString *newcheckout = [NSString stringWithFormat:@"%@-%@-%@",[checkoutArray objectAtIndex:2],[checkoutArray objectAtIndex:0],[checkoutArray objectAtIndex:1]];

    
    
    HotelRatesResults *results = [HotelRatesResults new];
    [results getHotelRatesForHotelID:hotelid rooms:@"1" adults:@"1" children:@"0" checkin:newcheckin checkout:newcheckout withCompletionBlock:^(NSArray *rates, NSError *error) {
       
        
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
