//
//  CustomerInformationViewController.h
//  PulseDemoApp
//
//  Created by crnorman on 2/12/14.
//  Copyright (c) 2014 IBM MIL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomerObject.h"

@interface CustomerInformationViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate>
@property (strong)CustomerObject *customerObj;
-(void)setCustomerData:(CustomerObject*)customerObj;
@end
