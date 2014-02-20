//-------------------------------------------------------------------------------
// Licensed Materials - Property of IBM
// XXXX-XXX (C) Copyright IBM Corp. 2013. All Rights Reserved.
// US Government Users Restricted Rights - Use, duplication or
// disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
//-------------------------------------------------------------------------------
//
//  DefaultUrlConnectionDelegate.h
//  CoreClientSDK

#import "IBMBaaSBasePlugin.h"
@class IBMSecureHttpURLRequestInvocation; 

@protocol IBMUrlConnectionDelegate <NSURLConnectionDataDelegate>

@optional
- (void) handleConnection: (NSURLConnection*) connection didReceiveResponse:(NSURLResponse*) tempResponse;
- (void) handleConnection:(NSURLConnection *) connection didReceiveData:(NSData *)data;
- (void) handleConnection:(NSURLConnection *) connection didFailWithError:(NSError *)error;
- (void) handleConnectionDidFinishLoading:(NSURLConnection *)connection;
- (void) handleSecurity: (IBMSecureHttpURLRequestInvocation*)invocation;
@end

@interface IBMDefaultUrlConnectionDelegate : IBMBaaSBasePlugin<IBMUrlConnectionDelegate>

-(NSURLConnection*) invoke: (IBMSecureHttpURLRequestInvocation*) initialInvocation;
-(NSData*) getResponseDataForConnection: (NSURLConnection*) connection;
-(NSURLResponse*) getResponseForConnection: (NSURLConnection*) connection;
-(IBMSecureHttpURLRequestInvocation*) getInvocationForConnection: (NSURLConnection*) connection;

@end 
