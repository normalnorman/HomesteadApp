//-------------------------------------------------------------------------------
// Licensed Materials - Property of IBM
// XXXX-XXX (C) Copyright IBM Corp. 2013. All Rights Reserved.
// US Government Users Restricted Rights - Use, duplication or
// disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
//-------------------------------------------------------------------------------

#import <Foundation/Foundation.h>
#import "IBMDevice.h"
#import "IBMResponseDelegate.h"
#import <IBMCore/IBMCore.h>

/*!
 * @class Operations supported by the Push Notification SDK
 *
 */
@interface IBMPushService : IBMBaaSBasePlugin{
	
	IBMDevice* pwDevice;
	NSString* deviceToken;
}

@property (readonly,nonatomic) NSString* endpoint;
@property NSInteger defaultTimeout;


/*!
 * Gets all the available Tags for the backend mobile application
 *
 * @param applicationTagsDelegate - the delegate on which either success or failure is called on finishing the request.
 */
- (void) getTags :(id<IBMResponseDelegate>)applicationTagsDelegate;

/*!
 * Gets the Tags that are subscribed by the device
 *
 * @param subscriptionsDelegate - the delegate on which either success or failure is called on finishing the request.
 */
- (void) getSubscriptions :(id<IBMResponseDelegate>) subscriptionsDelegate;

/*!
 * Registers the device on to the Push Notification Server
 *
 * @param device - the device that needs to be registered.
 * @param registerDelegate - the delegate on which either success or failure is called on finishing the request.
 */
- (void) registerDevice :(IBMDevice*) device :(id<IBMResponseDelegate>) registerDelegate;

/*!
 * Subscribes to a particular backend mobile application Tag
 *
 * @param tag - The Tag name to subscribe to.
 * @param subscribeToTagDelegate - the delegate on which either success or failure is called on finishing the request.
 */
- (void) subscribe :(NSString*) tag :(id<IBMResponseDelegate>) subscribeToTagDelegate;

/*!
 * Unsubscribes from an backend mobile application Tag
 *
 * @param tag - The Tag name to unsubscribe from.
 * @param unSubscribeFromTagDelegate - the delegate on which either success or failure is called on finishing the request.
 */
- (void) unsubscribe :(NSString*) tag :(id<IBMResponseDelegate>) unSubscribeFromTagDelegate;


/*!
 * Updates the device data on the Push Notification Server
 *
 * @param device - The device details to update.
 * @param updateDelegate - the delegate on which either success or failure is called on finishing the request.
 */
- (void) updateDevice :(IBMDevice*) device :(id<IBMResponseDelegate>) updateDelegate;


@end
