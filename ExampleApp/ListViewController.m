//
//  departuresViewController.m
//  PPNSdk
//
//  Created by Sameer Siddiqui on 11/9/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import "ListViewController.h"
#import "HotelDetailViewController.h"
#import "HotelListTableViewCell.h"
#import "UIViewController+Navigation.h"



@import PPNSdk;

@interface ListViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ListViewController {
    NSDictionary *passedDict;
    NSArray *htls;
    UIActivityIndicatorView *activity;
}

+ (ListViewController *)createForDepartures:(BOOL)departures withDictionary:(NSDictionary *)travelDict{
    NSBundle *frameworkBundle = [NSBundle bundleForClass:[self class]];
    ListViewController *main = [[UIStoryboard storyboardWithName:@"Main" bundle:frameworkBundle] instantiateViewControllerWithIdentifier:NSStringFromClass([ListViewController class])];
    main->passedDict = travelDict;
    return main;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self getData];
    
    activity = [[UIActivityIndicatorView alloc]init];
    activity.center = self.view.center;
    [self.view insertSubview:activity aboveSubview:self.tableView];
    [activity setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    [activity hidesWhenStopped];
    [self navBarWithAAAIconAndGearIconAndTitle:@"Hotels"];
}

- (void)getData {
    
    
    NSString *origincode = [passedDict objectForKey:@"origincode"];
    NSString *checkindate = [passedDict objectForKey:@"checkindate"];
    NSString *checkoutdate = [passedDict objectForKey:@"checkoutdate"];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [activity startAnimating];
    });

    HotelSearchResults *results = [HotelSearchResults new];
    [results getHotelSearchResultsWithCheckIn:checkindate checkout:checkoutdate cityid:origincode rooms:1 adults:1 children:0 withCompletionBLock:^(NSArray *hotels, NSError *error) {
        htls = hotels;
        dispatch_async(dispatch_get_main_queue(), ^{
            [activity stopAnimating];
            [self.tableView reloadData];
        });
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return htls.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    HotelSearchHotelModel *model = [[HotelSearchHotelModel alloc]initWithJson:[htls objectAtIndex:indexPath.row]];
    HotelListTableViewCell *cell = (HotelListTableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:@"hotellistcell"];
    cell.hotel = model;
    [cell modifyCell];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    HotelSearchHotelModel *model = [[HotelSearchHotelModel alloc]initWithJson:[htls objectAtIndex:indexPath.row]];
    HotelDetailViewController *vc = [HotelDetailViewController createwithHotelID:model.hotel_id];
    vc.passedDict = passedDict;
    [self.navigationController pushViewController:vc animated:YES];
}


@end
