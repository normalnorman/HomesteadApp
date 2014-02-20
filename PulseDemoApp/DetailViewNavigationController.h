//
//  DetailViewNavigationController.h
//  PulseDemoApp
//
//  Created by crnorman on 2/14/14.
//  Copyright (c) 2014 IBM MIL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomerObject.h"

@interface DetailViewNavigationController : UINavigationController
@property (retain)CustomerObject *customerObj;
- (void)setCustomerObject:(CustomerObject*)customerObj;
- (void)showCustomerDetail:(CustomerObject*)customerObj;
@end

