//
//  CustomerObject.h
//  PulseDemoApp
//
//  Created by crnorman on 2/13/14.
//  Copyright (c) 2014 IBM MIL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomerObject : NSObject
@property (nonatomic, weak)NSString *name;
@property (nonatomic, weak)NSString *email;
@property (nonatomic, weak)NSString *phoneNumber;
@end
