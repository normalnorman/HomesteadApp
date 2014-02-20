//-------------------------------------------------------------------------------
// Licensed Materials - Property of IBM
// XXXX-XXX (C) Copyright IBM Corp. 2013. All Rights Reserved.
// US Government Users Restricted Rights - Use, duplication or
// disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
//-------------------------------------------------------------------------------
//
//  SecureHttpURLRequestInvocationBuilder.h
//  CoreClientSDK

#import <Foundation/Foundation.h>
#import "IBMSecureHttpURLRequestInvocation.h"

@interface IBMSecureHttpURLRequestInvocationBuilder : NSObject

-(id) initWithSecureInvocation:(IBMSecureHttpURLRequestInvocation*) secureInvocation;
-(IBMSecureHttpURLRequestInvocation*) build;
-(IBMSecureHttpURLRequestInvocationBuilder*) setContentStreamData: (NSData*)contentStreamData;
-(IBMSecureHttpURLRequestInvocationBuilder*) addHeaderWithName: (NSString*) name andValue: (NSString*) value;
/*
    headers is expected to be a NSDictionary with the following format
    
    NSDictionary<NSString, NSArray<NSString>>
 
    In other words, its a dictionary with String keys which points to Arrays of Strings.  Any other format will be ignored and logged
 */
-(IBMSecureHttpURLRequestInvocationBuilder*) setHeaders: (NSDictionary*) headers;
-(IBMSecureHttpURLRequestInvocationBuilder*) removeHeaderWithName: (NSString*) name;
-(IBMSecureHttpURLRequestInvocationBuilder*) setHeaderWithName: (NSString*) name andValue: (NSString*) value;
-(IBMSecureHttpURLRequestInvocationBuilder*) setDelegate: (IBMDefaultUrlConnectionDelegate*) delegate;
-(IBMSecureHttpURLRequestInvocationBuilder*) setMethod: (NSString*) method;
-(IBMSecureHttpURLRequestInvocationBuilder*) setTimeout:(NSTimeInterval) timeout;
-(IBMSecureHttpURLRequestInvocationBuilder*) setServicePath: (NSString*)servicePath;
-(IBMSecureHttpURLRequestInvocationBuilder*) setUrl: (NSURL*)url;
-(IBMSecureHttpURLRequestInvocationBuilder*) setRequestCachePolicy: (NSURLRequestCachePolicy) requestCachePolicy;


@end
