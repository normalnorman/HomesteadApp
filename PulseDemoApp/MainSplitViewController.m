//
//  MainSplitViewController.m
//  PulseDemoApp
//
//  Created by crnorman on 2/11/14.
//  Copyright (c) 2014 IBM MIL. All rights reserved.
//

#import "MainSplitViewController.h"

@interface MainSplitViewController ()
@property (nonatomic, weak)UIPopoverController *popover;
@end

@implementation MainSplitViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)splitViewController:(UISplitViewController*)svc popoverController:(UIPopoverController*)pc willPresentViewController:(UIViewController *)aViewController{
    self.popover = pc;
    if ([pc isPopoverVisible]) {
        [pc dismissPopoverAnimated:YES];
    }
}

-(void)hidePopover
{
    if(self.popover)
        [self.popover dismissPopoverAnimated:YES];
}


@end
