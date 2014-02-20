//-------------------------------------------------------------------------------
// Licensed Materials - Property of IBM
// XXXX-XXX (C) Copyright IBM Corp. 2013. All Rights Reserved.
// US Government Users Restricted Rights - Use, duplication or
// disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
//-------------------------------------------------------------------------------

#import <Foundation/Foundation.h>

/*!
 * The device object that is used for registration of the device on the Push Notification server
 *
 */
@interface IBMDevice : NSObject

/*!
 *	The Alias of the Device
 */
@property (nonatomic, retain) NSString* alias;
/*!
 *	The Consumer Id of the Device
 */
@property (nonatomic, retain) NSString* consumerId;
/*!
 *	The Device Token to be passed to the Push Notification Server to receive Notifications.
 */
@property (nonatomic, retain) NSString* token;

@end
