//
//  ProductDetailViewController.h
//  PulseDemoApp
//
//  Created by Blake Ball on 2/11/14.
//  Copyright (c) 2014 IBM MIL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomerObject.h"
#import "LocationItem.h"
#import "DetailViewNavigationController.h"
#import "CustomerInformationViewController.h"

@interface ProductDetailViewController : UIViewController <UIViewControllerTransitioningDelegate, UIAlertViewDelegate>
@property (strong)CustomerObject *customerObj;
@property (strong)LocationItem *locationObj;
@property (strong)DetailViewNavigationController *viewNav;
@property (strong)CustomerInformationViewController *customerForm;
-(void)invokeAlert;
-(void)hideCustomerForm;
@end
