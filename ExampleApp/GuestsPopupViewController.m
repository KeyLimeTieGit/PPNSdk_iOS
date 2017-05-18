//
//  GuestsPopupViewController.m
//  PPNSdk
//
//  Created by Sameer Siddiqui on 5/18/17.
//  Copyright © 2017 KeyLimeTie. All rights reserved.
//

#import "GuestsPopupViewController.h"

@interface GuestsPopupViewController ()

@property (weak, nonatomic) IBOutlet UILabel *adultsNumber;
@property (weak, nonatomic) IBOutlet UILabel *childrenNumber;


@end

@implementation GuestsPopupViewController {
    int numberOfAdults;
    int numberOfChildren;
}

+ (GuestsPopupViewController *)create {
    NSBundle *frameworkBundle = [NSBundle bundleForClass:[self class]];
    GuestsPopupViewController *main = [[UIStoryboard storyboardWithName:@"Main" bundle:frameworkBundle] instantiateViewControllerWithIdentifier:NSStringFromClass([GuestsPopupViewController class])];
    return main;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    numberOfAdults = 1;
    numberOfChildren = 0;
    [self setupLabel:YES];
}
- (IBAction)adultplus:(id)sender {
    numberOfAdults++;
    [self setupLabel:YES];
}
- (IBAction)adultminus:(id)sender {
    numberOfAdults--;
    [self setupLabel:YES];
}
- (IBAction)childrenPlus:(id)sender {
    numberOfChildren++;
    [self setupLabel:NO];
}
- (IBAction)childrenminus:(id)sender {
    numberOfChildren--;
    [self setupLabel:NO];
}
- (IBAction)close:(id)sender {
    [self.delegate didSelectNumberOfAdults:numberOfAdults andChildren:numberOfChildren];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)setupLabel:(BOOL)adults {
    if (adults) {
        self.adultsNumber.text = [NSString stringWithFormat:@"%d", numberOfAdults];
    }
    else {
        self.childrenNumber.text = [NSString stringWithFormat:@"%d", numberOfChildren];
    }
}

@end
