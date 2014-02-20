//-------------------------------------------------------------------------------
// Licensed Materials - Property of IBM
// XXXX-XXX (C) Copyright IBM Corp. 2013. All Rights Reserved.
// US Government Users Restricted Rights - Use, duplication or
// disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
//-------------------------------------------------------------------------------
//
//  BaaS.h
//  CoreClientSDK

#import <Foundation/Foundation.h>
#import "IBMBaaSConfig.h"
@class IBMPluginManager;
@protocol IBMEvent;
@protocol IBMEventHandler;

/**

IBMBaaS singleton.
 
You must call IBMBaaS.initializeSDK before invoking any methods
 
 */
@interface IBMBaaS : NSObject

/** This must be the first method called.  It initializes the SDK framework by reading the configuration.json options and loading all defined mobile plugins.*/
+(void) initializeSDK;

/** 
@return The SDK version. Format vMajor.Minor.Service.
*/
+(NSString*) getSDKVersion;

/**
	  Dispatch an IBMEvent to all registered IBMEventHandler's
	 
	  @param event the IBMEvent to dispatch
	 */
+(void) dispatchEvent: (id<IBMEvent>) event;

	/**
	  Register an IBMEventHandler that will receive all IBMEvent's
	  sent by IBMBaaS#dispatchEvent(IBMEvent)
	 
	  @param handler IBMEventHandler to register for receiving IBMEvent's
	 */
+(void) registerEventHandler: (id<IBMEventHandler>) handler;

 /** 
  Used to access the IBMPluginManager
  @return the IBMPluginManager that was created by the initializeSDK invocation.
  */
+(IBMPluginManager*) pluginManager;

@end
