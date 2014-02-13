//
//  CustomerInformationViewController.m
//  PulseDemoApp
//
//  Created by crnorman on 2/12/14.
//  Copyright (c) 2014 IBM MIL. All rights reserved.
//

#import "CustomerInformationViewController.h"

@interface CustomerInformationViewController ()
- (IBAction)dismiss:(id)sender;
- (IBAction)saveInfo:(id)sender;

@end

@implementation CustomerInformationViewController

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

- (IBAction)dismiss:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)saveInfo:(id)sender {
    //[self dismiss:sender];
    UIButton *callButton = [[UIButton alloc] initWithFrame:CGRectMake(50, 400, 100, 50)];
}
@end
