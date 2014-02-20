//
//  CustomerObject.m
//  PulseDemoApp
//
//  Created by crnorman on 2/13/14.
//  Copyright (c) 2014 IBM MIL. All rights reserved.
//

#import "CustomerObject.h"

@implementation CustomerObject
@dynamic fullName;
@dynamic email;
@dynamic phoneNumber;
@dynamic address;

+(void) initialize
{
    [self registerSpecialization];
}

+(NSString*) dataClassName
{
    return @"Customer";
}
@end
