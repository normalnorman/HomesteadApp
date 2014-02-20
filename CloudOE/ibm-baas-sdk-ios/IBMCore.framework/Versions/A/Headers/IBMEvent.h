//-------------------------------------------------------------------------------
// Licensed Materials - Property of IBM
// XXXX-XXX (C) Copyright IBM Corp. 2013. All Rights Reserved.
// US Government Users Restricted Rights - Use, duplication or
// disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
//-------------------------------------------------------------------------------
//
//  BaaSEvent.h
//  CoreClientSDK

#import <Foundation/Foundation.h>

@protocol IBMEvent <NSObject> 

@property (readonly, nonatomic) NSString* name;
@property (readonly, nonatomic) NSDate* time;

@end
