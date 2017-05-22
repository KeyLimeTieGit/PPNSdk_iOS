//
//  HomeViewController.m
//  PPNSdk
//
//  Created by Sameer Siddiqui on 5/17/17.
//  Copyright © 2017 KeyLimeTie. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeSuggestionCell.h"
#import "UIViewController+Navigation.h"
#import "CreateItineraryViewController.h"
#import "ListViewController.h"


@interface HomeViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIButton *hotelButton;
@property (weak, nonatomic) IBOutlet UIButton *airButton;
@property (weak, nonatomic) IBOutlet UIButton *carButton;

@property (weak, nonatomic) IBOutlet UIStackView *stackView;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addLineToStackView];
    [self navBarWithAAAIconAndGearIconAndTitle:@"AAA Travel"];

}

- (void)addLineToStackView {
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, self.stackView.frame.origin.y + self.stackView.frame.size.height , self.view.frame.size.width, 0.2)];
    line.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    [self.view addSubview:line];
}

- (NSArray *)data {
    return @[@{@"country":@"Illinois",@"City":@"Chicago",@"Image":@"chicago",@"cityppnid":@"800047804"},
             @{@"country":@"Florida",@"City":@"Tampa",@"Image":@"tampa",@"cityppnid":@"800047518"},
             @{@"country":@"Michigan",@"City":@"Detroit",@"Image":@"detroit",@"cityppnid":@"800048593"},
             @{@"country":@"California",@"City":@"San Francisco",@"Image":@"sanfran",@"cityppnid":@"800046992"},
             @{@"country":@"Texas",@"City":@"Austin",@"Image":@"austin",@"cityppnid":@"800050468"}];
}

#pragma mark - UITableViewDataSource and Delegate


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self data].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeSuggestionCell *cell = (HomeSuggestionCell *)[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    NSDictionary *dict = [[self data] objectAtIndex:indexPath.row];
    cell.cityLabel.text = [dict objectForKey:@"City"];
    cell.countryLabel.text = [dict objectForKey:@"country"];
    cell.mainImageView.image = [UIImage imageNamed:[dict objectForKey:@"Image"]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dict = [[self data] objectAtIndex:indexPath.row];
    NSString *city = [dict objectForKey:@"City"];
    NSString *cityID = [dict objectForKey:@"cityppnid"];
    NSDate *checkin = [NSDate date];
    NSDate *checkout = [NSDate dateWithTimeInterval:(24*60*60) sinceDate:[NSDate date]];
    ListViewController *vc = [ListViewController create];
    vc.city = city;
    vc.cityppnID = cityID;
    vc.checkinDate = checkin;
    vc.checkoutDate = checkout;
    vc.numberOfAdults = 1;
    vc.numberOfChildren = 0;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - Actions
- (IBAction)hotelButtonPressed:(id)sender {
    CreateItineraryViewController *vc = [CreateItineraryViewController create];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)flightsButtonPressed:(id)sender {
    [self showSelfDismissingAlertWithMessage:@"Air travel is currently unavailable"];
}
- (IBAction)carsButtonPressed:(id)sender {
    [self showSelfDismissingAlertWithMessage:@"Car rentals are currently unavailable"];
}


- (void)showSelfDismissingAlertWithMessage:(NSString *)message {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:message
                                                                   message:@""
                                                            preferredStyle:UIAlertControllerStyleAlert];
    [self presentViewController:alert animated:YES completion:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [alert dismissViewControllerAnimated:YES completion:nil];
    });
}


@end




