//
//  LocationItem.h
//  PulseDemoApp
//
//  Created by crnorman on 2/14/14.
//  Copyright (c) 2014 IBM MIL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LocationItem : NSObject
@property (nonatomic, weak)NSString *mapLabel;
@property (nonatomic, weak)NSString *name;
@property (nonatomic, weak)NSString *distance;
@property (nonatomic, weak)NSString *availability;
@end
