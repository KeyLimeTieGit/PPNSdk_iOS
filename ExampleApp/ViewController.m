//
//  ViewController.m
//  ExampleApp
//
//  Created by Sameer Siddiqui on 11/8/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import "ViewController.h"
#import "SearchViewController.h"


@interface ViewController () <UITextFieldDelegate, SearchVCDelegate>
@property (weak, nonatomic) IBOutlet UITextField *airportTextField;
@property (weak, nonatomic) IBOutlet UITextField *departureDateTextField;
@property (weak, nonatomic) IBOutlet UITextField *returnDateTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _airportTextField.delegate = self;
   }

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if (textField == _airportTextField) {
        SearchViewController *vc = [SearchViewController create];
        [self presentViewController:vc animated:YES completion:nil];
        vc.delegate = self;
        return NO;
    }
    return YES;
}

- (void)didSelectValue:(NSString *)string {
    _airportTextField.text = string;
}

- (IBAction)searchPressed:(id)sender {
    
}

@end