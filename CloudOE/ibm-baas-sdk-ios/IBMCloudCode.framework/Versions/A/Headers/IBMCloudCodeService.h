//-------------------------------------------------------------------------------
// IBM Confidential OCO Source Materials
// XXXX-XXX Copyright IBM Corp. 2013
// The source code for this program is not published or otherwise
// divested of its trade secrets, irrespective of what has
// been deposited with the U.S. Copyright Office.
//-------------------------------------------------------------------------------
//
//  CloudCodeService.h
//  CoreClientSDK

#import <IBMCore/IBMCore.h>
#import "IBMCloudFunctionCallHandler.h"

/** IBMCloudCodeService provides the ability to call cloud code functions defined in the mobile backend */
@interface IBMCloudCodeService : IBMBaaSBasePlugin

/** The default timeout will be used for all invocations that do not specify timeout explicitly */
@property NSInteger defaultTimeout;

/** The default handler will be used when invoking the cloud service without a handler */
@property (atomic, retain) id<IBMCloudFunctionCallHandler> defaultHandler;

/**

A shorthand method for dispatching a MBaaS Cloud Code function calls. To get access to all options of IBMCloudFunctionCall IBMCloudCodeService#newFunctionCallBuilder()

@param module The cloud code module to call
@param function The function name that will be invoked inside of the module
@param params Parameters for the function call
@param timeoutMillis The timeout value for the function call
@param handler The IBMCloudFunctionCallHandler that will process the results of the function call

 */
-(void) callFunction: (NSString *) function inModule: (NSString *) module withParams: (NSDictionary*) params usingHandler: (id<IBMCloudFunctionCallHandler>) handler withOverrideTimeout: (NSInteger) timeoutMillis;

/**
 
 A shorthand method for dispatching a MBaaS Cloud Code function calls. To get access to all options of IBMCloudFunctionCall IBMCloudCodeService#newFunctionCallBuilder()
 
 @param module The cloud code module to call
 @param function The function name that will be invoked inside of the module
 @param params Parameters for the function call
 @param handler The IBMCloudFunctionCallHandler that will process the results of the function call
 
 */
-(void) callFunction: (NSString *) function inModule: (NSString *) module withParams: (NSDictionary*) params usingHandler: (id<IBMCloudFunctionCallHandler>) handler;

/**
 
 A shorthand method for dispatching a MBaaS Cloud Code function calls. To get access to all options of IBMCloudFunctionCall IBMCloudCodeService#newFunctionCallBuilder()
 
 @param module The cloud code module to call
 @param function The function name that will be invoked inside of the module
 @param params Parameters for the function call
 
 */
-(void) callFunction: (NSString *) function inModule: (NSString *) module withParams: (NSDictionary*) params;

/**
 
 A shorthand method for dispatching a MBaaS Cloud Code function calls. To get access to all options of IBMCloudFunctionCall IBMCloudCodeService#newFunctionCallBuilder()
 
 @param module The cloud code module to call
 @param function The function name that will be invoked inside of the module
 
 */
-(void) callFunction: (NSString *) function inModule: (NSString *) module;

@end
