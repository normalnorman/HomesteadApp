//-------------------------------------------------------------------------------
// IBM Confidential OCO Source Materials
// XXXX-XXX Copyright IBM Corp. 2013
// The source code for this program is not published or otherwise
// divested of its trade secrets, irrespective of what has
// been deposited with the U.S. Copyright Office.
//-------------------------------------------------------------------------------
//
//  CloudFunctionCallHandler.h
//  CoreClientSDK

#import <Foundation/Foundation.h>
#import "IBMCloudFunctionCallResult.h"
#import "IBMCloudFunctionCall.h"

/** Provides a set of methods that will be called back for an IBMCloudFunctionCall */
@protocol IBMCloudFunctionCallHandler <NSObject>

/**
Called with the results of the function call.

 @param result The IBMCloudFunctionCallResult for a given IBMCloudFunctionCall.
 
*/
-(void) onResponse: (IBMCloudFunctionCallResult*) result;

/**
 Called when the response is detected as authorization failure by one of
  the security plugins.
 
  @param functionCall The function call that is about to be made.
 
 */
-(void) onSecurityHandling: (IBMCloudFunctionCall*) functionCall;

/**
  Called when function call failed.
 
  @param functionCall The IBMCloudFunctionCall that failed
  @param reason The error that describes the failure
 */
-(void) onFailure: (IBMCloudFunctionCall*) functionCall withReason: (NSError*) reason;

@end
