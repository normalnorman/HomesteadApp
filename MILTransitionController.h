//
//  MILTransitionController.h
//  PulseDemoApp
//
//  Created by crnorman on 2/12/14.
//  Copyright (c) 2014 IBM MIL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MILTransitionController : NSObject <UIViewControllerAnimatedTransitioning>
@property (nonatomic)BOOL isReversed;
@end
