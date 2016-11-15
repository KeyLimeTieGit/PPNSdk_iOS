//
//  departuresViewController.h
//  PPNSdk
//
//  Created by Sameer Siddiqui on 11/9/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import "ViewController.h"

@interface ListViewController : ViewController
+ (ListViewController *)createForDepartures:(BOOL)departures withDictionary:(NSDictionary *)travelDict;
@end
