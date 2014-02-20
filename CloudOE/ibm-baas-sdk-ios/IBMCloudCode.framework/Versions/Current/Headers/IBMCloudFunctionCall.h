//-------------------------------------------------------------------------------
// IBM Confidential OCO Source Materials
// XXXX-XXX Copyright IBM Corp. 2013
// The source code for this program is not published or otherwise
// divested of its trade secrets, irrespective of what has
// been deposited with the U.S. Copyright Office.
//-------------------------------------------------------------------------------
//
//  CloudeProcedureInvocation.h
//  CoreClientSDK

#import <Foundation/Foundation.h>
/** Class used to invoke cloud code*/
@interface IBMCloudFunctionCall : NSObject

/** Invokes the cloud code module specified when called from IBMCloudCodeService */
-(void) invoke;

@end
