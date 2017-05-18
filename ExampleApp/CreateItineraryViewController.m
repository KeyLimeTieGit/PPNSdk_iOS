//
//  CreateItineraryViewController.m
//  PPNSdk
//
//  Created by Sameer Siddiqui on 5/17/17.
//  Copyright © 2017 KeyLimeTie. All rights reserved.
//

#import "CreateItineraryViewController.h"
#import "SearchDestinationViewController.h"
#import <PopupCalendar/PopupCalendar-Swift.h>
#import "GuestsPopupViewController.h"
#import "ListViewController.h"


@interface CreateItineraryViewController () <SearchDestinationDelegate, CalendarViewDelegate, GuestsDelegate>

@property (weak, nonatomic) IBOutlet UIButton *destinationButton;
@property (weak, nonatomic) IBOutlet UIButton *datesButton;
@property (weak, nonatomic) IBOutlet UIButton *numberOfGuestsButton;


@end

@implementation CreateItineraryViewController {
    NSString *selectedCityPPNID;
    int numberOfAdults;
    int numberOfChildren;
    NSDate *checkInDate;
    NSDate *checkOutDate;
}

+ (CreateItineraryViewController *)create {
    NSBundle *frameworkBundle = [NSBundle bundleForClass:[self class]];
    CreateItineraryViewController *main = [[UIStoryboard storyboardWithName:@"Main" bundle:frameworkBundle] instantiateViewControllerWithIdentifier:NSStringFromClass([CreateItineraryViewController class])];
    return main;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor lightGrayColor];
    numberOfAdults = 1;
    numberOfChildren = 0;
    checkInDate = [NSDate new];
    checkOutDate = [NSDate dateWithTimeInterval:(24*60*60) sinceDate:[NSDate date]];
    [self didSelectNumberOfAdults:numberOfAdults andChildren:numberOfChildren];
    [self didSelectDatesWithCheckinDate:checkInDate checkoutDate:checkOutDate];
}

- (IBAction)destinationbuttonPressed:(id)sender {
    SearchDestinationViewController *vc = [SearchDestinationViewController create];
    vc.delegate = self;
    [self presentViewController:vc animated:YES completion:nil];
}
- (IBAction)datesButtonPressed:(id)sender {
    CalendarViewController *vc = [CalendarViewController create];
    vc.delegate = self;
    vc.modalPresentationStyle = UIModalPresentationOverCurrentContext;

    [self presentViewController:vc animated:YES completion:nil];
}
- (IBAction)numberOfGuestButtonPressed:(id)sender {
    GuestsPopupViewController *vc = [GuestsPopupViewController create];
    vc.delegate = self;
    vc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    [self presentViewController:vc animated:YES completion:nil];

}

#pragma mark - Search Destinations Delegate
- (void)didSelectCity:(NSString *)city withCityPPNID:(NSString *)city_PPN_ID {
    NSString *cityString = [NSString stringWithFormat:@"  📍 %@", city];
    [self.destinationButton setTitle:cityString forState:UIControlStateNormal];
    selectedCityPPNID = city_PPN_ID;
}

- (void)didSelectDatesWithCheckinDate:(NSDate *)checkinDate checkoutDate:(NSDate *)checkoutDate {
    checkInDate = checkinDate;
    checkOutDate = checkoutDate;
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"MMMM dd, yyyy";
    NSString *checkin = [formatter stringFromDate:checkinDate];
    NSString *checkout = [formatter stringFromDate:checkoutDate];

    NSString *travelStr = [NSString stringWithFormat:@"  🗓️  %@-%@",checkin, checkout];
    [self.datesButton setTitle:travelStr forState:UIControlStateNormal];
}

- (void)didSelectNumberOfAdults:(int)adults andChildren:(int)children {
    numberOfAdults = adults;
    numberOfChildren = children;
    int numberOfGuests = numberOfAdults + numberOfChildren;
    NSString *guestsStr = numberOfGuests > 1 ? @"Guests" : @"Guest";
    [self.numberOfGuestsButton setTitle:[NSString stringWithFormat:@"  👤 %d %@", numberOfGuests, guestsStr] forState:UIControlStateNormal];
}

- (IBAction)search:(id)sender {
    ListViewController *vc = [ListViewController create];
    vc.numberOfAdults = numberOfAdults;
    vc.numberOfChildren = numberOfChildren;
    vc.checkinDate = checkInDate;
    vc.checkoutDate = checkOutDate;
    vc.cityppnID = selectedCityPPNID;
    [self.navigationController pushViewController:vc animated:YES];
}


@end
