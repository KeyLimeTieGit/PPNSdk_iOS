//
//  PPNInternalManager.h
//  PPNSdk
//
//  Created by Sameer Siddiqui on 11/8/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PPNInternalManager : NSObject

+ (PPNInternalManager *)internalManager;

@property (strong, nonatomic) NSString *api_key;
@property (strong, nonatomic) NSString *refid;


@end
