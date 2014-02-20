//-------------------------------------------------------------------------------
// IBM Confidential OCO Source Materials
// XXXX-XXX Copyright IBM Corp. 2013
// The source code for this program is not published or otherwise
// divested of its trade secrets, irrespective of what has
// been deposited with the U.S. Copyright Office.
//-------------------------------------------------------------------------------
//
//  IBMDataService.h
//  IBMData iOS SDK

@protocol IBMDataDelegate <NSObject>

@optional
- (void)timerStats:(NSDictionary *)stats;

@end

/** This is the main class that connects to the backend server.  It should be initialized with MBaaS app credentials.
 #### Setup the core MBaaS connection in your application delegate didFinishLaunchingWithOptions method
 - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
 {
 [IBMData setUrl:<string-url-address-of-mbaas> appID:<string-app-id> appKey:<string-app-key>];
 }
 */

@interface IBMData : NSObject;

/** This method returns the singleton instance of the MBaaS for this application.

 @return (IBMData *) The MBaaS instance for this application, or nil if none has been created.
 */
+ (IBMData *)sharedInstance;

@property (nonatomic, readonly) NSString	*url;
@property (nonatomic, readonly) NSString	*appId;
@property (nonatomic, readonly) NSString	*appKey;

@property (nonatomic, weak) id<IBMDataDelegate>     delegate;
- (BOOL)connected;

@end
