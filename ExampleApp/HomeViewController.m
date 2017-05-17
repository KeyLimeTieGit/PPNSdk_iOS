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
#import "ViewController.h"

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
    return @[@{@"country":@"Japan",@"City":@"Kyoto",@"Image":@"kyoto"},
             @{@"country":@"Italy",@"City":@"Corniglia",@"Image":@"italy"},
             @{@"country":@"Morocco",@"City":@"Marrakech",@"Image":@"morocco"},
             @{@"country":@"South Africa",@"City":@"Cape Town",@"Image":@"capetown"},
             @{@"country":@"Michigan",@"City":@"Traverse City",@"Image":@"michigan"},
             @{@"country":@"Japan",@"City":@"Kyoto",@"Image":@"kyoto"}];
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
    
}

#pragma mark - Actions
- (IBAction)hotelButtonPressed:(id)sender {
    ViewController *vc = [ViewController create];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)flightsButtonPressed:(id)sender {
}
- (IBAction)carsButtonPressed:(id)sender {
}


@end




