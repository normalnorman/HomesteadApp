//
//  DetailViewNavigationController.h
//  PulseDemoApp
//
//  Created by crnorman on 2/14/14.
//  Copyright (c) 2014 IBM MIL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomerObject.h"

@interface DetailViewNavigationController : UINavigationController <UIAlertViewDelegate>
@property (retain)CustomerObject *customerObj;
- (void)fakePush;
- (void)setCustomerObject:(CustomerObject*)customerObj;
@end

