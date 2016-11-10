//
//  departuresViewController.m
//  PPNSdk
//
//  Created by Sameer Siddiqui on 11/9/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import "departuresViewController.h"
@import PPNSdk;

@interface departuresViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation departuresViewController {
    NSDictionary *passedDict;
    NSArray *itins;
    UIActivityIndicatorView *activity;
}

+ (departuresViewController *)createForDepartures:(BOOL)departures withDictionary:(NSDictionary *)travelDict{
    NSBundle *frameworkBundle = [NSBundle bundleForClass:[self class]];
    departuresViewController *main = [[UIStoryboard storyboardWithName:@"Main" bundle:frameworkBundle] instantiateViewControllerWithIdentifier:NSStringFromClass([departuresViewController class])];
    main->passedDict = travelDict;
    return main;
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
}

- (void)getData {
    
    NSString *origincode = [passedDict objectForKey:@"origincode"];
    NSString *destinationcode = [passedDict objectForKey:@"destinationcode"];
    NSString *departuredate = [passedDict objectForKey:@"departuredate"];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [activity startAnimating];
    });

    FlightDepartureResults *fdr = [FlightDepartureResults new];
    [fdr getFlightDepartureResultsForNumberOfAdults:1 originCode:origincode destinationCode:destinationcode departureDate:departuredate withCompletionBlock:^(NSArray *itineraries, NSError *error) {
        itins = itineraries;
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
    return itins.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    FlightDepartureItineraryModel *model = [[FlightDepartureItineraryModel alloc]initWithJson:[itins objectAtIndex:indexPath.row]];
    cell.textLabel.text = model.airline_name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@%.02f",model.currency_symbol,model.total_fare];
    return cell;
}


@end
