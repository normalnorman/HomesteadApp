//
//  MasterViewController.h
//  PulseDemoApp
//
//  Created by crnorman on 2/7/14.
//  Copyright (c) 2014 IBM MIL. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

@end
