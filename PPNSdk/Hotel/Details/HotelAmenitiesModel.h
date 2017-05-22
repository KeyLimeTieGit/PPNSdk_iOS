//
//  HotelAmenitiesModel.h
//  PPNSdk
//
//  Created by Sameer Siddiqui on 5/22/17.
//  Copyright © 2017 KeyLimeTie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HotelAmenitiesModel : NSObject

- (instancetype)initWithJson:(NSDictionary *)json;

@property (weak, nonatomic, readonly) NSString *name;
@property (nonatomic) int amenityID;

@end
