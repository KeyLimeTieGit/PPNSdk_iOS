//
//  HotelDetailViewController.m
//  PPNSdk
//
//  Created by Sameer Siddiqui on 11/11/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import "HotelDetailViewController.h"
#import "HotelRatesViewController.h"
@import PPNSdk;

@interface HotelDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *hoteNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *hotelPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *hotelDescriptionLabel;

@end

@implementation HotelDetailViewController {
    NSString *hotelid;
    UIActivityIndicatorView *activity;

}

+ (HotelDetailViewController *)createwithHotelID:(NSString *)hotelID{
    NSBundle *frameworkBundle = [NSBundle bundleForClass:[self class]];
    HotelDetailViewController *main = [[UIStoryboard storyboardWithName:@"Main" bundle:frameworkBundle] instantiateViewControllerWithIdentifier:NSStringFromClass([HotelDetailViewController class])];
    main->hotelid = hotelID;
    return main;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.hotelDescriptionLabel.numberOfLines = 0;
    
    activity = [[UIActivityIndicatorView alloc]init];
    activity.center = self.view.center;
    [self.view addSubview:activity];
    [activity setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    [activity hidesWhenStopped];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [activity startAnimating];
    });

    HotelDetailResults *results = [HotelDetailResults new];
    [results getHotelDetailForHotelID:hotelid withCompletionBlock:^(HotelDetailModel *hotel, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [activity stopAnimating];
            self.hoteNameLabel.text = hotel.name;
            self.hotelPriceLabel.text = [NSString stringWithFormat:@"Prices From: %@",hotel.low_rate_display_price];
            self.hotelDescriptionLabel.text = hotel.hotel_description;
        });

    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)selectRoomPressed:(id)sender {
    HotelRatesViewController *vc = [HotelRatesViewController createwithHotelID:hotelid andPassedDictionary:self.passedDict];
    [self.navigationController pushViewController:vc animated:YES];
}



@end
