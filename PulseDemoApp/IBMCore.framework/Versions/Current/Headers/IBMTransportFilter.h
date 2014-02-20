//-------------------------------------------------------------------------------
// Licensed Materials - Property of IBM
// XXXX-XXX (C) Copyright IBM Corp. 2013. All Rights Reserved.
// US Government Users Restricted Rights - Use, duplication or
// disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
//-------------------------------------------------------------------------------
//
//  TransportFilter.h
//  CoreClientSDK

#import <Foundation/Foundation.h>
#import "IBMBaaSPlugin.h"
#import "IBMSecureHttpURLRequestInvocation.h"

@protocol IBMTransportFilter <IBMBaaSPlugin>

-(IBMSecureHttpURLRequestInvocation*) processRequest: (IBMSecureHttpURLRequestInvocation*)invocation;
-(NSURLResponse*)processResponse: (NSURLResponse*) response;

@end
