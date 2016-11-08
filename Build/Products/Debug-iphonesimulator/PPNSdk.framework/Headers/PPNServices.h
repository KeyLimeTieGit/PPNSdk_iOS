//
//  PPNServices.h
//  PPNSdk
//
//  Created by Sameer Siddiqui on 11/8/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PPNServices : NSObject
+ (id<NSObject>)sharedServices;
+ (void)provideAPIKey:(NSString *)APIKey refid:(NSString *)refid;
@end
