//-------------------------------------------------------------------------------
// Licensed Materials - Property of IBM
// XXXX-XXX (C) Copyright IBM Corp. 2013. All Rights Reserved.
// US Government Users Restricted Rights - Use, duplication or
// disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
//-------------------------------------------------------------------------------


#import <Foundation/Foundation.h>

/*!
 * @protocol Success and Failure Callback for all requests
 */
@protocol IBMResponseDelegate <NSObject>

/*!
 * Success callback of the response
 *
 * @param response - The response from the server for the request.
 * @param responseCode - The response code from the server for the request.
 */
-(void) onSuccess :(NSMutableDictionary*) response;

/*!
 * Failure callback of the response
 *
 * @param response - The response from the server for the request.
 * @param responseCode - The response code from the server for the request.
 */
-(void) onFailure :(NSMutableDictionary*) response;

@end
