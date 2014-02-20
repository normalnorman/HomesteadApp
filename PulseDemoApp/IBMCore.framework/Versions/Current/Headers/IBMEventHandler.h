//-------------------------------------------------------------------------------
// Licensed Materials - Property of IBM
// XXXX-XXX (C) Copyright IBM Corp. 2013. All Rights Reserved.
// US Government Users Restricted Rights - Use, duplication or
// disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
//-------------------------------------------------------------------------------
//
//  BaaSEventHandler.h
//  CoreClientSDK

#import <Foundation/Foundation.h>
@protocol IBMEvent;

@protocol IBMEventHandler <NSObject>
 
-(void) handleEvent: (id<IBMEvent>) event;

@end
