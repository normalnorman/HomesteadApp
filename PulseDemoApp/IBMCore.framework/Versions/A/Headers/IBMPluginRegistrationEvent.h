//-------------------------------------------------------------------------------
// Licensed Materials - Property of IBM
// XXXX-XXX (C) Copyright IBM Corp. 2013. All Rights Reserved.
// US Government Users Restricted Rights - Use, duplication or
// disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
//-------------------------------------------------------------------------------
//
//  PluginRegistrationBaaSEvent.h
//  CoreClientSDK

#import <Foundation/Foundation.h>
#import "IBMBaseEvent.h"
#import "IBMBaaSPlugin.h"

@interface IBMPluginRegistrationEvent : IBMBaseEvent

@property (readonly, nonatomic) id<IBMBaaSPlugin> plugin;

-(id) initWithPlugin: (id<IBMBaaSPlugin>) plugin;

@end
