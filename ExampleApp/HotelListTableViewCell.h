//
//  HotelListTableViewCell.h
//  PPNSdk
//
//  Created by Sameer Siddiqui on 12/1/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HotelSearchHotelModel.h"


@interface HotelListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *hotelImage;
@property (weak, nonatomic) IBOutlet UILabel *hotelTitle;
@property (weak, nonatomic) IBOutlet UILabel *hotelReview;
@property (weak, nonatomic) IBOutlet UILabel *hotelPrice;

@property (weak, nonatomic)  HotelSearchHotelModel *hotel;
@property (weak, nonatomic) IBOutlet UILabel *neighborhood;

- (void)modifyCell;

@end
