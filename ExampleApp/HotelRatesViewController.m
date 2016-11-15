//
//  HotelRatesViewController.m
//  PPNSdk
//
//  Created by Sameer Siddiqui on 11/15/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import "HotelRatesViewController.h"
#import "HotelRatesTableViewCell.h"
#import "HotelContractViewController.h"

@import PPNSdk;

@interface HotelRatesViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation HotelRatesViewController {
    NSString *hotelid;
    NSDictionary *passedDict;
    NSArray *ratesArr;
    UIActivityIndicatorView *activity;

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
    activity = [[UIActivityIndicatorView alloc]init];
    activity.center = self.view.center;
    [self.view insertSubview:activity aboveSubview:self.tableView];
    [activity setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    [activity hidesWhenStopped];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [activity startAnimating];
    });
    
    NSLog(@"%@",passedDict);
    NSString *checkinDate = [passedDict objectForKey:@"checkindate"];
    NSString *checkoutDate = [passedDict objectForKey:@"checkoutdate"];
    NSArray *checkinArray = [checkinDate componentsSeparatedByString:@"/"];
    NSArray *checkoutArray = [checkoutDate componentsSeparatedByString:@"/"];
    
    NSString *newcheckin = [NSString stringWithFormat:@"%@-%@-%@",[checkinArray objectAtIndex:2],[checkinArray objectAtIndex:0],[checkinArray objectAtIndex:1]];
    NSString *newcheckout = [NSString stringWithFormat:@"%@-%@-%@",[checkoutArray objectAtIndex:2],[checkoutArray objectAtIndex:0],[checkoutArray objectAtIndex:1]];

    
    
    HotelRatesResults *results = [HotelRatesResults new];
    [results getHotelRatesForHotelID:hotelid rooms:@"1" adults:@"1" children:@"0" checkin:newcheckin checkout:newcheckout withCompletionBlock:^(NSArray *rates, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            ratesArr = rates;
            [self.tableView reloadData];
            [activity stopAnimating];
        });

    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return ratesArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HotelRatesModel *model = [[HotelRatesModel alloc]initWithJson:[ratesArr objectAtIndex:indexPath.row]];
    HotelRatesTableViewCell *cell = (HotelRatesTableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:@"ratescell"];
    cell.titleLabel.text = model.title;
    cell.promoLablel.text = ![model.promo isKindOfClass:[NSNull class]] ? model.promo : @"";
    cell.priceLabel.text = [NSString stringWithFormat:@"Total Price = $%.02f", model.display_total];
    cell.policyLabel.text = model.book_policy;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    HotelRatesModel *model = [[HotelRatesModel alloc]initWithJson:[ratesArr objectAtIndex:indexPath.row]];
    HotelContractViewController *vc = [HotelContractViewController createwithBundle:model.ppn_bundle];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
