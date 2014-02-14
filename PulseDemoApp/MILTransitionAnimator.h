//
//  MILTransitionAnimator.h
//  PulseDemoApp
//
//  Created by crnorman on 2/13/14.
//  Copyright (c) 2014 IBM MIL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MILTransitionAnimator : NSObject
@property (nonatomic, assign, getter = isPresenting) BOOL presenting;
@property (nonatomic, assign, getter = setBounds) CGRect bounds;
@end
