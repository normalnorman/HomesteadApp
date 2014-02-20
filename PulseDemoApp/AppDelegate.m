//
//  AppDelegate.m
//  PulseDemoApp
//
//  Created by crnorman on 2/7/14.
//  Copyright (c) 2014 IBM MIL. All rights reserved.
//



#import <IBMCore/IBMCore.h>
#import "AppDelegate.h"
#import "CustomerObject.h"
#import "DetailViewNavigationController.h"
#import "DepartmentViewController.h"
#import <IBMPush/IBMPush.h>

// Constants used in Push device.  You may change these or dynamically create them.
#define CONSUMER_ID @"Homestead"
#define DEVICE_ALIAS  @"Test iPad"

// Push error codes
#define DEVICE_ALREADY_REGISTERED @"FPWSE0002E"

@interface AppDelegate () <IBMResponseDelegate>

@property IBMDevice *device;
@property (strong, nonatomic) CustomerObject *customerObj;

@end

@implementation AppDelegate

-(BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    return YES;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [IBMBaaS initializeSDK];
    self.splitViewController = (UISplitViewController *)self.window.rootViewController;
    self.mainNavigationController = [self.splitViewController.viewControllers lastObject];
    self.splitViewController.delegate = (id)self.mainNavigationController.topViewController;
    
    // Register application for push notifications
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert)];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    NSLog(@"Did receive remote push: %@", userInfo);
    [self showAlert:self];
}

-(void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    NSLog(@"Failed to regsiter for push: %@", error);
}

#pragma mark - IBMResponseDelegate methods
-(void)onSuccess:(NSMutableDictionary *)response
{
    NSLog(@"onSuccess: %@", response);
}

-(void) onSuccess :(NSMutableDictionary*) response :(NSInteger)responseCode
{
    NSLog(@"onSuccess: %@", response);
}

-(void) onFailure :(NSMutableDictionary*) response
{
    if(![[response objectForKey:@"code"] isEqualToString: DEVICE_ALREADY_REGISTERED]){
        // We ignore device already registered errors as this is expected on the second call
        NSLog(@"onFailure: %@", response);
    }
}

#pragma mark - Methods for receiving device registration and notifications
-(void) application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    IBMPluginManager *pluginManager = [IBMBaaS pluginManager];
    
    // Register Device to receive Push Notifications
    IBMPushService *pushService = (IBMPushService*)[pluginManager getPluginByClassName: NSStringFromClass([IBMPushService class])];
    
    // Create the device object
    self.device = [[IBMDevice alloc]init];
	self.device.consumerId=CONSUMER_ID;
	self.device.token = deviceToken.description;
	self.device.alias = DEVICE_ALIAS;
    
    // Call the push service to register the device and listener
    [pushService registerDevice:self.device :self ];
}

#pragma mark Alert View Delegate code
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    
    if([title isEqualToString:@"OK"])
    {
        [(DetailViewNavigationController*)self.mainNavigationController showCustomerDetail:self.customerObj];
    }
}

- (void)showAlert:(id)sender {
    IBMQuery *qry = [CustomerObject query];
    [qry findObjectsInBackgroundWithBlock:^(NSError *error, NSArray *objects){
        if (!error) {
            int index = (int)objects.count - 1;
            self.customerObj = [objects objectAtIndex:index];
            DetailViewNavigationController *detailNav = (DetailViewNavigationController*)self.mainNavigationController;
            [detailNav setCustomerObject:self.customerObj];
            
            UILocalNotification *notification = [[UILocalNotification alloc]init];
            notification.alertBody = @"Artic Alltrack Ski Boots have shipped";
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Artic Alltrack Ski Boots have shipped"
                                                            message:[NSString stringWithFormat:@"%@ has received the Ski Boots ordered in store.  Do you want to follow up?", detailNav.customerObj.fullName]
                                                           delegate:self
                                                  cancelButtonTitle:@"Cancel"
                                                  otherButtonTitles:@"OK",
                                  nil];
            [alert show];
            
        }else{
            // Error handing code here
            NSLog(@"Get customer failed with error: %@", error);
        }
    }];
}

@end
