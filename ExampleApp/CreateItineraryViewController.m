//
//  CreateItineraryViewController.m
//  PPNSdk
//
//  Created by Sameer Siddiqui on 5/17/17.
//  Copyright © 2017 KeyLimeTie. All rights reserved.
//

#import "CreateItineraryViewController.h"
#import "SearchDestinationViewController.h"

@interface CreateItineraryViewController () <SearchDestinationDelegate>

@property (weak, nonatomic) IBOutlet UIButton *destinationButton;
@property (weak, nonatomic) IBOutlet UIButton *datesButton;
@property (weak, nonatomic) IBOutlet UIButton *numberOfGuestsButton;


@end

@implementation CreateItineraryViewController {
    NSString *selectedCityPPNID;
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
}

- (IBAction)destinationbuttonPressed:(id)sender {
    SearchDestinationViewController *vc = [SearchDestinationViewController create];
    vc.delegate = self;
    [self presentViewController:vc animated:YES completion:nil];
}
- (IBAction)datesButtonPressed:(id)sender {
}
- (IBAction)numberOfGuestButtonPressed:(id)sender {
}

#pragma mark - Search Destinations Delegate
- (void)didSelectCity:(NSString *)city withCityPPNID:(NSString *)city_PPN_ID {
    NSString *cityString = [NSString stringWithFormat:@"  📍 %@", city];
    [self.destinationButton setTitle:cityString forState:UIControlStateNormal];
    selectedCityPPNID = city_PPN_ID;
}


@end
