//-------------------------------------------------------------------------------
// Licensed Materials - Property of IBM
// XXXX-XXX (C) Copyright IBM Corp. 2013. All Rights Reserved.
// US Government Users Restricted Rights - Use, duplication or
// disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
//-------------------------------------------------------------------------------
//
//  BaaSUtil.h
//  CoreClientSDK

#import <Foundation/Foundation.h>

@interface IBMBaaSUtil : NSObject

+(void) throwExceptionWith: (NSString*) name andReason: (NSString*) reason andUserInfo: (NSDictionary *) userInfo;
+(void) throwInvalidInitCall: (NSString*) correctConstructor;

@end
