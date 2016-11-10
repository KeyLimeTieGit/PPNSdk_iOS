//
//  SearchViewController.h
//  PPNSdk
//
//  Created by Sameer Siddiqui on 11/8/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, SearchType) {
    Departures,
    Arrivals
};

typedef NS_ENUM(NSInteger, TravelType) {
    Airport,
    City
};


@protocol SearchVCDelegate <NSObject>

- (void)didSelectValue:(NSString *)string forKey:(NSString *)key withSearchType:(SearchType)searchType andTravelType:(TravelType)travelType ;

@end

@interface SearchViewController : UIViewController
+ (SearchViewController *)createForDepartures:(BOOL)departures;
@property (weak, nonatomic) id <SearchVCDelegate> delegate;

@end
