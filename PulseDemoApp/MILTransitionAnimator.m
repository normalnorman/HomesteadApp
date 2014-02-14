//
//  MILTransitionAnimator.m
//  PulseDemoApp
//
//  Created by crnorman on 2/13/14.
//  Copyright (c) 2014 IBM MIL. All rights reserved.
//

#import "MILTransitionAnimator.h"

@implementation MILTransitionAnimator
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
    return 0.3f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    CGRect endFrame = self.bounds;
    
    if (self.presenting) {
        fromViewController.view.userInteractionEnabled = NO;
        
        [transitionContext.containerView addSubview:fromViewController.view];
        [transitionContext.containerView addSubview:toViewController.view];
        
        CGRect startFrame = endFrame;
        startFrame.origin.x += 320;
        
        toViewController.view.frame = startFrame;
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            fromViewController.view.tintAdjustmentMode = UIViewTintAdjustmentModeDimmed;
            toViewController.view.frame = endFrame;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    }
    else {
        toViewController.view.userInteractionEnabled = YES;
        
        [transitionContext.containerView addSubview:toViewController.view];
        [transitionContext.containerView addSubview:fromViewController.view];
        
        endFrame.origin.x += 320;
        
        [UIView animateWithDuration:0.1f animations:^{
            toViewController.view.tintAdjustmentMode = UIViewTintAdjustmentModeAutomatic;
            fromViewController.view.frame = endFrame;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    }
}

@end
