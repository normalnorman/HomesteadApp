//-------------------------------------------------------------------------------
// Licensed Materials - Property of IBM
// XXXX-XXX (C) Copyright IBM Corp. 2013. All Rights Reserved.
// US Government Users Restricted Rights - Use, duplication or
// disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
//-------------------------------------------------------------------------------
//
//  BaaSConfig.h
//  CoreClientSDK

#import <Foundation/Foundation.h>

/**
  <h1>IBMBaaS configuration loader</h1>
  <p>
  Reads the configuration.json (bundle location/configuration.json)
  <p>
  Configuration format is:
 
  <pre>
  {
  	applicationId : <b>required</b>
    "<i>&lt;application id&gt;</i>",
  	plugins : <b>optional</b>
  		[
  			{
  			class : <b>required</b>
  				"<i>&lt;class name of plugin implementing IBMBaaSPlugin&gt;</i>"
  			parameters : <b>optional</b>
  				{
  					<i>&lt;json object to be passed to plugin at initialization time through IBMBaaSPlugin#initialize(IBMPluginManager, String, JSONObject)&gt;</i>
  				}
  			}
  			<i>&lt;additional plugin configuration&gt;</i> <b>optional</b>
  		]
  }
  </pre>
 
 
 */
@interface IBMBaaSConfig : NSObject

@property (readonly,nonatomic) NSArray* pluginArray;
@property (readonly, nonatomic) NSString* baasUrl;
@property (readonly, nonatomic) NSString* applicationId;
@property (readonly, nonatomic) NSString* clientId;
@property (readonly, nonatomic) NSString* platformId;

@end
