//-------------------------------------------------------------------------------
// IBM Confidential OCO Source Materials
// XXXX-XXX Copyright IBM Corp. 2013
// The source code for this program is not published or otherwise
// divested of its trade secrets, irrespective of what has
// been deposited with the U.S. Copyright Office.
//-------------------------------------------------------------------------------
//
//  CloudFunctionCallBuilder.h
//  CoreClientSDK

#import <Foundation/Foundation.h>
#import "IBMCloudFunctionCallHandler.h"
#import "IBMCloudCodeService.h"
#import "IBMCloudFunctionCall.h"

@interface IBMCloudFunctionCallBuilder : NSObject

- (id)initWithService:(IBMCloudCodeService *)service;

-(IBMCloudFunctionCall*) build;
-(IBMCloudFunctionCallBuilder*) setModule: (NSString*) module;
-(IBMCloudFunctionCallBuilder*) setFunction: (NSString*) procedure;
-(IBMCloudFunctionCallBuilder*) setParams: (NSDictionary*) params;
-(IBMCloudFunctionCallBuilder*) setTimeout: (NSInteger) timeoutMillis;
-(IBMCloudFunctionCallBuilder*) setHandler: (id<IBMCloudFunctionCallHandler>) handler;
-(IBMCloudFunctionCallBuilder*) addPathParam: (NSString*)pathParam;
-(IBMCloudFunctionCallBuilder*) removePathParam: (NSString*)pathParam;

@end
