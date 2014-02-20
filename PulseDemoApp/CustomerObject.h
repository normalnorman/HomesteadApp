//
//  CustomerObject.h
//  PulseDemoApp
//
//  Created by crnorman on 2/13/14.
//  Copyright (c) 2014 IBM MIL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <IBMData/IBMData.h>

@interface CustomerObject : IBMDataObject <IBMDataObjectSpecialization>
@property (strong)NSString *fullName;
@property (strong)NSString *email;
@property (strong)NSString *phoneNumber;
@property (strong)NSString *address;
@end
