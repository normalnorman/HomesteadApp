//-------------------------------------------------------------------------------
// Licensed Materials - Property of IBM
// XXXX-XXX (C) Copyright IBM Corp. 2013. All Rights Reserved.
// US Government Users Restricted Rights - Use, duplication or
// disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
//-------------------------------------------------------------------------------
//
//  BaseBaaSPlugin.h
//  CoreClientSDK

#import <Foundation/Foundation.h>
#import "IBMPluginManager.h"
#import "IBMEventHandler.h"

@interface IBMBaaSBasePlugin : NSObject<IBMBaaSPlugin, IBMEventHandler>

@property (readonly, nonatomic) IBMPluginManager* pluginManager;
@property (readonly, nonatomic) IBMBaaSConfig* config;

-(void) postInit;

@end
