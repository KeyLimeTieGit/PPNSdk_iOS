//
//  ViewController.m
//  ExampleApp
//
//  Created by Sameer Siddiqui on 11/8/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import "ViewController.h"
#import "ListViewController.h"
#import "DAYCalendarView.h"
#import "UIViewController+Navigation.h"
#import "SearchDestinationViewController.h"

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

@interface ViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *departureAirportTextField;
@property (weak, nonatomic) IBOutlet UITextField *arrivalAirportTextField;
@property (weak, nonatomic) IBOutlet UITextField *departureDateTextField;
@property (strong, nonatomic)  DAYCalendarView *checkincalendarView;
@property (strong, nonatomic)  DAYCalendarView *checkoutcalendarView;


@end

@implementation ViewController {
    NSString *departureKey;
    NSString *arrivalKey;

    UITapGestureRecognizer *tap;
}

+ (ViewController *)create {
    NSBundle *frameworkBundle = [NSBundle bundleForClass:[self class]];
    ViewController *main = [[UIStoryboard storyboardWithName:@"Main" bundle:frameworkBundle] instantiateViewControllerWithIdentifier:NSStringFromClass([ViewController class])];
    return main;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    [tap setCancelsTouchesInView:NO];
    
    [self.view addGestureRecognizer:tap];
    
    [self navBarWithAAAIconAndGearIconAndTitle:@"Search Hotels"];

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

- (void)dealloc {
    [self.view removeGestureRecognizer:tap];
}

- (void)calendarViewDidChange:(id)sender {

    
    if (sender == self.checkoutcalendarView) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"MM/dd/yyyy";
        self.departureDateTextField.text = [formatter stringFromDate:self.checkoutcalendarView.selectedDate];
    }
    else {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"MM/dd/yyyy";
        self.arrivalAirportTextField.text = [formatter stringFromDate:self.checkincalendarView.selectedDate];
    }
    
}

-(void)dismissKeyboard {
    [self.arrivalAirportTextField resignFirstResponder];
    [self.departureDateTextField resignFirstResponder];
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if (textField == _departureAirportTextField) {
        SearchDestinationViewController *vc = [SearchDestinationViewController create];
        [self presentViewController:vc animated:true completion:nil];
        return NO;
    }
    return YES;
}


- (IBAction)searchPressed:(id)sender {

    if ([_departureAirportTextField.text isEqualToString:@""]) {
        [self showAlertWithMessage:@"Must select Destination City"];
    }
    else if ([_arrivalAirportTextField.text isEqualToString:@""]) {
        [self showAlertWithMessage:@"Check-in date cannot be empty"];
    }
    else if ([_departureDateTextField.text isEqualToString:@""]) {
        [self showAlertWithMessage:@"Check-out date cannot be empty"];
    }
    else {
            NSDictionary *dict = @{@"origincode":departureKey, @"checkindate":_arrivalAirportTextField.text, @"checkoutdate":_departureDateTextField.text};
            ListViewController *vc = [ListViewController createForDepartures:YES withDictionary:dict];
            [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)showAlertWithMessage:(NSString *)message {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:message
                                                                   message:@""
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* prodUser = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                     handler:nil];
    [alert addAction:prodUser];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
