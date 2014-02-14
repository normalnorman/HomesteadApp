//
//  DetailViewNavigationController.m
//  PulseDemoApp
//
//  Created by crnorman on 2/14/14.
//  Copyright (c) 2014 IBM MIL. All rights reserved.
//

#import "DetailViewNavigationController.h"
#import "DepartmentViewController.h"

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


#pragma mark Alert View Delegate code
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    
    if([title isEqualToString:@"OK"])
    {
        NSLog(@"%@", self.viewControllers);
        if(self.viewControllers.count > 1)
        {
            DepartmentViewController *dvc = self.viewControllers[1];
            [dvc showDetailViewForCustomer:self.customerObj];
        }
            
    }
}

-(void)setCustomerObject:(CustomerObject *)customerObj
{
    self.customerObj = [[CustomerObject alloc]init];
    self.customerObj.name = [NSString stringWithString:customerObj.name];
    self.customerObj.email = [NSString stringWithString:customerObj.email];
    self.customerObj.phoneNumber  = [NSString stringWithString:customerObj.phoneNumber];
}


- (void)fakePush
{
    [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(showAlert:) userInfo:nil repeats:NO];
}

- (void)showAlert:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Signature Jeans (Evolution Cotton) Available"
                                                    message:[NSString stringWithFormat:@"Would you like to notify %@?", self.customerObj.name]
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"OK",
                          nil];
    [alert show];
}


@end
