//
//  DetailViewManager.h
//  PulseDemoApp
//
//  Created by crnorman on 2/10/14.
//  Copyright (c) 2014 IBM MIL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol SubstitutableDetailViewController
@property (nonatomic, retain) UIBarButtonItem *navigationPaneBarButtonItem;
@end

@interface DetailViewManager : NSObject <UISplitViewControllerDelegate>

/// Things for IB
// The split view this class will be managing.
@property (nonatomic, retain) IBOutlet UISplitViewController *splitViewController;

// The presently displayed detail view controller.  This is modified by the various
// view controllers in the navigation pane of the split view controller.
@property (nonatomic, assign) IBOutlet UIViewController<SubstitutableDetailViewController> *detailViewController;

@end