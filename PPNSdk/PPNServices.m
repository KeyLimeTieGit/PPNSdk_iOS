//
//  PPNServices.m
//  PPNSdk
//
//  Created by Sameer Siddiqui on 11/8/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import "PPNServices.h"
#import "PPNInternalManager.h"


@implementation PPNServices

+ (id<NSObject>)sharedServices {
    static dispatch_once_t pred = 0;
    __strong static PPNServices *_manager = nil;
    dispatch_once(&pred, ^{
        _manager = [[PPNServices alloc] init];
    });
    
    return _manager;
}


+ (void)provideAPIKey:(NSString *)APIKey refid:(NSString *)RefID{
    [PPNInternalManager internalManager].api_key = APIKey;
    [PPNInternalManager internalManager].refid = RefID;
}

@end
