//-------------------------------------------------------------------------------
// Licensed Materials - Property of IBM
// XXXX-XXX (C) Copyright IBM Corp. 2013. All Rights Reserved.
// US Government Users Restricted Rights - Use, duplication or
// disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
//-------------------------------------------------------------------------------
//
//  SecureHttpURLRequestInvocation.h
//  CoreClientSDK

#import <Foundation/Foundation.h>
@class IBMDefaultUrlConnectionDelegate;

@interface IBMSecureHttpURLRequestInvocation : NSObject

@property (readonly, nonatomic) NSInputStream* contentStream;
@property (readonly, nonatomic) NSDictionary* headers;
@property (readonly, nonatomic) NSString* method;
@property (readonly, nonatomic) IBMDefaultUrlConnectionDelegate* delegate;
@property (readonly, nonatomic) NSTimeInterval timeout;
@property (readonly, nonatomic) NSURL* url;
@property (readonly, nonatomic) NSURLRequestCachePolicy requestCachePolicy;

-(NSURLConnection*) invoke;
-(void)resetContentStream;

@end
