//
//  ViewController.m
//  ExampleApp
//
//  Created by Sameer Siddiqui on 11/8/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import "ViewController.h"
#import "SearchViewController.h"
#import "ListViewController.h"
#import "DAYCalendarView.h"


#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() ==UIUserInterfaceIdiomPhone)

#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

@import PPNSdk;

@interface ViewController () <UITextFieldDelegate, SearchVCDelegate>
@property (weak, nonatomic) IBOutlet UITextField *departureAirportTextField;
@property (weak, nonatomic) IBOutlet UITextField *arrivalAirportTextField;
@property (weak, nonatomic) IBOutlet UITextField *departureDateTextField;
@property (strong, nonatomic)  DAYCalendarView *checkincalendarView;
@property (strong, nonatomic)  DAYCalendarView *checkoutcalendarView;


@end

@implementation ViewController {
    NSString *departureKey;
    NSString *arrivalKey;
    TravelType *departureTravelType;
    TravelType *arrivalTravelType;
    UITapGestureRecognizer *tap;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    tap = [[UITapGestureRecognizer alloc]
//                                   initWithTarget:self
//                                   action:@selector(dismissKeyboard)];
//    
//    [self.view addGestureRecognizer:tap];

    _arrivalAirportTextField.delegate = self;
    _departureAirportTextField.delegate = self;
    
    CGFloat height = IS_IPHONE_5 ? 253 : IS_IPHONE_6 ? 258 : IS_IPHONE_6P ? 271 : 253;
    
    self.checkincalendarView = [[DAYCalendarView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, height)];
    self.checkoutcalendarView = [[DAYCalendarView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, height)];
    [_arrivalAirportTextField setInputView:self.checkincalendarView];
    [_departureDateTextField setInputView:self.checkoutcalendarView];

    [self.checkincalendarView addTarget:self action:@selector(calendarViewDidChange:) forControlEvents:UIControlEventValueChanged];
    [self.checkoutcalendarView addTarget:self action:@selector(calendarViewDidChange:) forControlEvents:UIControlEventValueChanged];
    
}

-(void)viewDidAppear:(BOOL)animated {
//    [super viewDidAppear:animated];
//    [self.view addGestureRecognizer:tap];
}

- (void)viewDidDisappear:(BOOL)animated {
//    [super viewDidDisappear:animated];
//    [self.view removeGestureRecognizer:tap];
}

- (void)calendarViewDidChange:(id)sender {
    //    self.datePicker.date = self.calendarView.selectedDate;
    
    if (sender == self.checkoutcalendarView) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"MM/dd/yyyy";
        self.departureDateTextField.text = [formatter stringFromDate:self.checkoutcalendarView.selectedDate];
    }
    else {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"MM/dd/yyyy";
        self.arrivalAirportTextField.text = [formatter stringFromDate:self.checkincalendarView.selectedDate];
//        self.checkoutcalendarView.selectedDate = self.checkincalendarView.selectedDate;

    }
    
}

-(void)dismissKeyboard {
    [self.arrivalAirportTextField resignFirstResponder];
    [self.departureDateTextField resignFirstResponder];
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
//    if (textField == _arrivalAirportTextField) {
//        SearchViewController *vc = [SearchViewController createForDepartures:NO];
//        [self presentViewController:vc animated:YES completion:nil];
//        vc.delegate = self;
//        return NO;
//    }
    if (textField == _departureAirportTextField) {
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
//    NSDictionary *dict = @{@"origincode":departureKey, @"destinationcode":arrivalKey, @"departuredate":_departureDateTextField.text};
        NSDictionary *dict = @{@"origincode":departureKey, @"checkindate":_arrivalAirportTextField.text, @"checkoutdate":_departureDateTextField.text};
    ListViewController *vc = [ListViewController createForDepartures:YES withDictionary:dict];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
