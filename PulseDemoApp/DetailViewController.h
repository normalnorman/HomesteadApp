//
//  DetailViewController.h
//  PulseDemoApp
//
//  Created by crnorman on 2/7/14.
//  Copyright (c) 2014 IBM MIL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
