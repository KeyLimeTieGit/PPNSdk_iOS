//
//  ViewController.m
//  ExampleApp
//
//  Created by Sameer Siddiqui on 11/8/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import "ViewController.h"
#import "SearchViewController.h"
#import "departuresViewController.h"


@import PPNSdk;

@interface ViewController () <UITextFieldDelegate, SearchVCDelegate>
@property (weak, nonatomic) IBOutlet UITextField *departureAirportTextField;
@property (weak, nonatomic) IBOutlet UITextField *arrivalAirportTextField;

@property (weak, nonatomic) IBOutlet UITextField *departureDateTextField;
@property (weak, nonatomic) IBOutlet UITextField *returnDateTextField;

@end

@implementation ViewController {
    NSString *departureKey;
    NSString *arrivalKey;
    TravelType *departureTravelType;
    TravelType *arrivalTravelType;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _arrivalAirportTextField.delegate = self;
    _departureAirportTextField.delegate = self;
    
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if (textField == _arrivalAirportTextField) {
        SearchViewController *vc = [SearchViewController createForDepartures:NO];
        [self presentViewController:vc animated:YES completion:nil];
        vc.delegate = self;
        return NO;
    }
    else if (textField == _departureAirportTextField) {
        SearchViewController *vc = [SearchViewController createForDepartures:YES];
        [self presentViewController:vc animated:YES completion:nil];
        vc.delegate = self;
        return NO;
    }
    return YES;
}

- (void)didSelectValue:(NSString *)string forKey:(NSString *)key withSearchType:(SearchType)searchType andTravelType:(TravelType)travelType {
    if (searchType == Departures) {
        _departureAirportTextField.text = string;
        departureKey = key;
        departureTravelType = &travelType;
    }
    else {
        _arrivalAirportTextField.text = string;
        arrivalKey = key;
        arrivalTravelType = &travelType;
    }
}

- (IBAction)searchPressed:(id)sender {
    NSDictionary *dict = @{@"origincode":departureKey, @"destinationcode":arrivalKey, @"departuredate":_departureDateTextField.text};
    departuresViewController *vc = [departuresViewController createForDepartures:YES withDictionary:dict];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
