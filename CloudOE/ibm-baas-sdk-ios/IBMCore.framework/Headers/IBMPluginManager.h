//-------------------------------------------------------------------------------
// Licensed Materials - Property of IBM
// XXXX-XXX (C) Copyright IBM Corp. 2013. All Rights Reserved.
// US Government Users Restricted Rights - Use, duplication or
// disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
//-------------------------------------------------------------------------------
//
//  BaaSPluginManager.h
//  CoreClientSDK

#import <Foundation/Foundation.h>
#import "IBMBaaSPlugin.h"
#import "IBMBaaSConfig.h"
#import "IBMTransportFilter.h"
#import "IBMSecurityProvider.h"


@interface IBMPluginManager : NSObject 

@property (readonly, nonatomic) IBMBaaSConfig* config;

-(id<IBMBaaSPlugin>)getPluginByClassName:(NSString*)className;
-(NSArray*)getPluginsByClassName:(NSString*)className;
-(id<IBMBaaSPlugin>) registerPluginWithClassName: (NSString*)className andParams: (NSDictionary*) params;
-(NSArray<IBMTransportFilter>*)transportFilters;

@end
