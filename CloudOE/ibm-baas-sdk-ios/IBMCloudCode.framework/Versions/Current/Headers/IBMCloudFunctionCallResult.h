//-------------------------------------------------------------------------------
// IBM Confidential OCO Source Materials
// XXXX-XXX Copyright IBM Corp. 2013
// The source code for this program is not published or otherwise
// divested of its trade secrets, irrespective of what has
// been deposited with the U.S. Copyright Office.
//-------------------------------------------------------------------------------
//
//  CloudFunctionCallResult.h
//  CoreClientSDK

#import <Foundation/Foundation.h>
#import "IBMCloudFunctionCall.h"

/** An Object that contains the originating IBMCloudFunctionCall and its resulting JSON */
@interface IBMCloudFunctionCallResult : NSObject

 /** The resulting JSON from the cloud code call*/
@property (readonly, nonatomic) NSDictionary* result;

 /** The original IBMCloudFunctionCall that produced the result */
@property (readonly, nonatomic) IBMCloudFunctionCall* functionCall;

@end
