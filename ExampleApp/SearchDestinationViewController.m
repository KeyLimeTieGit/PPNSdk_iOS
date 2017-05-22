//
//  SearchDestinationViewController.m
//  PPNSdk
//
//  Created by Sameer Siddiqui on 5/17/17.
//  Copyright © 2017 KeyLimeTie. All rights reserved.
//

#import "SearchDestinationViewController.h"
#import "HotelAutoCompleteResults.h"
#import "HotelAutoCompleteCityModel.h"

@interface SearchDestinationViewController () <UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@property (strong, nonatomic) NSArray* citiesArray;

@end

@implementation SearchDestinationViewController

+ (SearchDestinationViewController *)create {
    NSBundle *frameworkBundle = [NSBundle bundleForClass:[self class]];
    SearchDestinationViewController *main = [[UIStoryboard storyboardWithName:@"Main" bundle:frameworkBundle] instantiateViewControllerWithIdentifier:NSStringFromClass([SearchDestinationViewController class])];
    return main;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    
    UIImageView *imgview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 15, 15)];
    imgview.image = [UIImage imageNamed:@"pin"];
    imgview.contentMode = UIViewContentModeScaleAspectFit;
    
    self.citiesArray = [NSArray new];
    
    self.textField.leftViewMode = UITextFieldViewModeAlways;
    self.textField.leftView = imgview;
    self.textField.layer.borderColor = [[UIColor blueColor] CGColor];
    
    UITapGestureRecognizer *tapper = [[UITapGestureRecognizer alloc]
                                      initWithTarget:self action:@selector(handleSingleTap:)];
    tapper.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapper];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.textField addTarget:self action:@selector(textFieldEdited:event:) forControlEvents:UIControlEventEditingChanged];
    [self.textField becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.textField removeTarget:self
                          action:@selector(textFieldEdited:event:)
                forControlEvents:UIControlEventEditingChanged];
}

- (IBAction)closeButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - textfield delegate

- (void)handleSingleTap:(UITapGestureRecognizer *) sender {
    [self.view endEditing:YES];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [[self view] endEditing:YES];
}

- (void)textFieldEdited:(UITextField*)textfield event:(UIEvent*)event {
    NSString *stringTitle = nil;
    stringTitle = textfield.text;
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    [self performSelector:@selector(updateSearchResultsForSearchString:) withObject:stringTitle afterDelay:0.1f];
}

- (BOOL)textFieldShouldClear:(UITextField *)textField {
    self.citiesArray = [NSArray new];
    [self.tableView reloadData];
    return YES;
}

- (void)updateSearchResultsForSearchString:(NSString *)string {
    if ([string length] <= 2) {
        self.citiesArray = [NSArray new];
        [self.tableView reloadData];
    }
    else {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.activityIndicator startAnimating];
        });
        HotelAutoCompleteResults *results = [HotelAutoCompleteResults new];
        [results getAutoCompleteResultsForString:string withCompletionBlock:^(NSArray *airports, NSArray *cities, NSError *error) {
            if (!error) {
                if (cities.count > 0) {
                    self.citiesArray = cities;
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.tableView reloadData];
                    [self.activityIndicator stopAnimating];
                });
            }
        }];
    }
}


#pragma mark - Tablview Delegate and Datasource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.citiesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    HotelAutoCompleteCityModel *cityModel = [[HotelAutoCompleteCityModel alloc]initWithJson:[self.citiesArray objectAtIndex:indexPath.row]];
    if (cityModel.state != nil) {
        cell.textLabel.text = [NSString stringWithFormat:@"%@, %@", cityModel.city, cityModel.state];
    }
    else {
        cell.textLabel.text = cityModel.city;
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.textColor = [[UIColor whiteColor] colorWithAlphaComponent:0.7];
    cell.detailTextLabel.text = cityModel.country;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    HotelAutoCompleteCityModel *cityModel = [[HotelAutoCompleteCityModel alloc]initWithJson:[self.citiesArray objectAtIndex:indexPath.row]];
    [self.delegate didSelectCity:cityModel.city withCityPPNID:cityModel.cityid_ppn];
    [self dismissViewControllerAnimated:YES completion:nil];

}



@end
