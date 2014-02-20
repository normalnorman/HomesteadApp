//-------------------------------------------------------------------------------
// Licensed Materials - Property of IBM
// XXXX-XXX (C) Copyright IBM Corp. 2013. All Rights Reserved.
// US Government Users Restricted Rights - Use, duplication or
// disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
//-------------------------------------------------------------------------------
//
//  BaaSPlugin.h
//  CoreClientSDK

#import <Foundation/Foundation.h>
@class IBMPluginManager;

@protocol IBMBaaSPlugin <NSObject> 

@property (readonly, nonatomic) IBMPluginManager* pluginManager;

-(id) initWithManager: (IBMPluginManager *) manager andParams: (NSDictionary*) params;

@end
