//
//  SearchViewController.m
//  PPNSdk
//
//  Created by Sameer Siddiqui on 11/8/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import "SearchViewController.h"



@import PPNSdk;

@interface SearchViewController () <UITableViewDelegate, UITableViewDataSource, UISearchControllerDelegate, UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end

@implementation SearchViewController {
    NSArray *citiesArray;
    NSArray *airportsArray;
    BOOL departures;
}

+ (SearchViewController *)createForDepartures:(BOOL)departures {
    NSBundle *frameworkBundle = [NSBundle bundleForClass:[self class]];
    SearchViewController *main = [[UIStoryboard storyboardWithName:@"Main" bundle:frameworkBundle] instantiateViewControllerWithIdentifier:NSStringFromClass([SearchViewController class])];
    main->departures = departures;
    return main;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.searchBar.delegate = self;
    self.searchBar.showsCancelButton = YES;
    self.searchBar.placeholder = @"Departure City or Airport";
    [self.searchBar becomeFirstResponder];
}

- (void)getDataForString:(NSString *)string {
//    AirAutoCompleteResults *autoComplete = [AirAutoCompleteResults new];
//    [autoComplete getAutoCompleteResultsForString:string withCompletionBlock:^(NSArray *airports, NSArray *cities, NSError *error) {
//        if (!error) {
//            if (airports.count > 0) {
//                airportsArray = airports;
//            }
//            if (cities.count > 0) {
//                citiesArray = cities;
//            }
//            dispatch_async(dispatch_get_main_queue(), ^{
//                [self.tableView reloadData];
//            });
//        }
//    }];
    
    HotelAutoCompleteResults *autocomplete = [HotelAutoCompleteResults new];
    [autocomplete getAutoCompleteResultsForString:string withCompletionBlock:^(NSArray *airports, NSArray *cities, NSError *error) {
        if (!error) {
            if (airports.count > 0) {
                airportsArray = airports;
            }
            if (cities.count > 0) {
                citiesArray = cities;
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
        }
    }];
}

#pragma mark - UITableViewDataSource


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return citiesArray.count;
    }
    else {
        return airportsArray.count;

    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    if (indexPath.section == 0) {
//        AirAutoCompleteAirportModel *airportModel = [[AirAutoCompleteAirportModel alloc]initWithJson:[airportsArray objectAtIndex:indexPath.row]];
//        cell.textLabel.text = airportModel.airport;
//        cell.detailTextLabel.text = airportModel.city;
        HotelAutoCompleteCityModel *cityModel = [[HotelAutoCompleteCityModel alloc]initWithJson:[citiesArray objectAtIndex:indexPath.row]];
        cell.textLabel.text = cityModel.city;

    }
    else {
//        AirAutoCompleteCityModel *cityModel = [[AirAutoCompleteCityModel alloc]initWithJson:[citiesArray objectAtIndex:indexPath.row]];
       
        HotelAutoCompleteAirportModel *airportModel = [[HotelAutoCompleteAirportModel alloc]initWithJson:[airportsArray objectAtIndex:indexPath.row]];
        cell.textLabel.text = airportModel.airport;

//        cell.detailTextLabel.text = @"All Airports";
    }
    return cell;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"Cities";
    }
    else {
        return @"Airports";

    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        AirAutoCompleteCityModel *cityModel = [[AirAutoCompleteCityModel alloc]initWithJson:[citiesArray objectAtIndex:indexPath.row]];
        [self.delegate didSelectValue:cityModel.city forKey:cityModel.cityid_ppn withSearchType:departures?Departures:Arrivals andTravelType:City];
    }
    else {
        AirAutoCompleteAirportModel *airportModel = [[AirAutoCompleteAirportModel alloc]initWithJson:[airportsArray objectAtIndex:indexPath.row]];
        [self.delegate didSelectValue:airportModel.airport forKey:airportModel.iata withSearchType:departures?Departures:Arrivals andTravelType:Airport];
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UISearchControllerDelegate

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    [self getDataForString:searchText];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [self dismissViewControllerAnimated:YES completion:nil];

}

@end
