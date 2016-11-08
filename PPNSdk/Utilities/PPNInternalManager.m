//
//  PPNInternalManager.m
//  PPNSdk
//
//  Created by Sameer Siddiqui on 11/8/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import "PPNInternalManager.h"

@implementation PPNInternalManager

+ (PPNInternalManager *)internalManager {
    static dispatch_once_t pred = 0;
    __strong static PPNInternalManager *_manager = nil;
    dispatch_once(&pred, ^{
        _manager = [[PPNInternalManager alloc] init];
    });
    
    return _manager;
}
@end
