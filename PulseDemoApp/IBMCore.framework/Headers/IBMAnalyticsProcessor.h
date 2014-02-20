//-------------------------------------------------------------------------------
// Licensed Materials - Property of IBM
// XXXX-XXX (C) Copyright IBM Corp. 2013. All Rights Reserved.
// US Government Users Restricted Rights - Use, duplication or
// disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
//-------------------------------------------------------------------------------
//
//  AnalyticsProcessor.h
//  CoreClientSDK


#import <Foundation/Foundation.h>
#import "IBMBaaSPlugin.h"

@protocol IBMAnalyticsProcessor <IBMBaaSPlugin>

-(void) reportEvent: (NSString*) event withData: (NSData*) data;

@end
 