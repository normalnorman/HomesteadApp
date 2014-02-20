//
//  AppDelegate.h
//  PulseDemoApp
//
//  Created by crnorman on 2/7/14.
//  Copyright (c) 2014 IBM MIL. All rights reserved.
//

#import <UIKit/UIKit.h>

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define CUSTOM_GREEN_COLOR [UIColor colorWithRed:0.0f green:210.0f/255.0f blue:146.0f/255.0f alpha:1];
#define CUSTOM_PURPLE_COLOR [UIColor colorWithRed:127.0f/255.0f green:47.0f/255.0f blue:249.0f/255.0f alpha:1];

@interface AppDelegate : UIResponder <UIApplicationDelegate, UIAlertViewDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UISplitViewController *splitViewController;
@property (strong, nonatomic) UINavigationController *mainNavigationController;
@end
