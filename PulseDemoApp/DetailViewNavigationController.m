//
//  DetailViewNavigationController.m
//  PulseDemoApp
//
//  Created by crnorman on 2/14/14.
//  Copyright (c) 2014 IBM MIL. All rights reserved.
//

#import "DetailViewNavigationController.h"
#import "DepartmentViewController.h"
#import <IBMCore/IBMCore.h>

@interface DetailViewNavigationController ()
@end

@implementation DetailViewNavigationController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setCustomerObject:(CustomerObject *)customerObj
{
    self.customerObj = [[CustomerObject alloc]init];
    self.customerObj.fullName = [NSString stringWithString:customerObj.fullName];
    self.customerObj.email = [NSString stringWithString:customerObj.email];
    self.customerObj.phoneNumber  = [NSString stringWithString:customerObj.phoneNumber];
    self.customerObj.address  = [NSString stringWithString:customerObj.address];
}

-(void)showCustomerDetail:(CustomerObject*)customerObj
{
    [self setCustomerObject:customerObj];
    DepartmentViewController *dvc;
    
    //if the search results view controller is shown, get a reference to that view controller
    if(self.viewControllers.count > 1)
    {
        dvc = self.viewControllers[1];
    }else{ //otherwise, instantiate a new version of the view controller
        dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"Main"];
        [self pushViewController:dvc animated:YES];
    }
    
    [dvc showDetailViewForCustomer:self.customerObj];
}


@end
