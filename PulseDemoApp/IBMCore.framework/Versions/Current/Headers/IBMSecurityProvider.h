//-------------------------------------------------------------------------------
// Licensed Materials - Property of IBM
// XXXX-XXX (C) Copyright IBM Corp. 2013. All Rights Reserved.
// US Government Users Restricted Rights - Use, duplication or
// disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
//-------------------------------------------------------------------------------
//
//  SecurityProvider.h
//  CoreClientSDK

#import <Foundation/Foundation.h>
#import "IBMBaaSPlugin.h"
#import "IBMSecureHttpURLRequestInvocation.h"

@protocol IBMSecurityProvider <IBMBaaSPlugin>

-(IBMSecureHttpURLRequestInvocation*) handleRequest: (IBMSecureHttpURLRequestInvocation*) secureInvocation;
-(BOOL) handleResponse: (NSURLResponse*) response withResponseInputStream: (NSInputStream*) responseStream andInvocation: (IBMSecureHttpURLRequestInvocation*)secureInvocation;

@end 
