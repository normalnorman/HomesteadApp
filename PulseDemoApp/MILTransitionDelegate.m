//
//  MILTransitionDelegate.m
//  PulseDemoApp
//
//  Created by crnorman on 2/12/14.
//  Copyright (c) 2014 IBM MIL. All rights reserved.
//

#import "MILTransitionDelegate.h"
#import "MILTransitionController.h"

@implementation MILTransitionDelegate

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    MILTransitionController *transitioning = [[MILTransitionController alloc]init];
    return transitioning;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    MILTransitionController *transitioning = [[MILTransitionController alloc]init];
    transitioning.isReversed = YES;
    return transitioning;
}

@end
