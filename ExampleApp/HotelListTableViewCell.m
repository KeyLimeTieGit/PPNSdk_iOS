//
//  HotelListTableViewCell.m
//  PPNSdk
//
//  Created by Sameer Siddiqui on 12/1/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import "HotelListTableViewCell.h"
#import "UIImageView+WebCache.h"


@implementation HotelListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
  
    
}

- (void)modifyCell {
    self.hotelPrice.text = [NSString stringWithFormat:@"$%@", self.hotel.display_price];
    self.hotelTitle.text = self.hotel.name;
    self.hotelReview.text = [NSString stringWithFormat:@"%@ of 5 stars",self.hotel.star_rating];
    [self.hotelImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https:%@",self.hotel.thumbnailx300]]
                 placeholderImage:[UIImage imageNamed:@"watermark"]];
   
    self.neighborhood.text = self.hotel.neighborhood_name;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
