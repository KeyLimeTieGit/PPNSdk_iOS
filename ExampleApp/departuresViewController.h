//
//  departuresViewController.h
//  PPNSdk
//
//  Created by Sameer Siddiqui on 11/9/16.
//  Copyright © 2016 KeyLimeTie. All rights reserved.
//

#import "ViewController.h"

@interface departuresViewController : ViewController
+ (departuresViewController *)createForDepartures:(BOOL)departures withDictionary:(NSDictionary *)travelDict;
@end
