//
//  MILTransitionController.m
//  PulseDemoApp
//
//  Created by crnorman on 2/12/14.
//  Copyright (c) 2014 IBM MIL. All rights reserved.
//

#import "MILTransitionController.h"

@implementation MILTransitionController

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
    return self.isReversed ? 0.8 : 1.6;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)context
{
    UIView *inView = [context containerView];
    UIView *toView = [[context viewControllerForKey:UITransitionContextToViewControllerKey]view];
    UIView *fromView = [[context viewControllerForKey:UITransitionContextFromViewControllerKey]view];
    
    if (self.isReversed) {
        [inView insertSubview:toView belowSubview:fromView];
    }
    else {
        toView.frame = CGRectMake(768, 60, 200, 768);
        toView.transform = CGAffineTransformMakeScale(0, 0);
        [inView addSubview:toView];
    }
    
    CGFloat damping = self.isReversed ? 1 : 0.6;
    NSTimeInterval duration = [self transitionDuration:context];
    
    [toView setUserInteractionEnabled: true];
    [fromView setUserInteractionEnabled: false];
    
    [UIView animateWithDuration:duration delay:0 usingSpringWithDamping:damping initialSpringVelocity:10.0 options:0 animations:^{
        if (self.isReversed) {
            fromView.transform = CGAffineTransformMakeScale(0, 0);
        }
        else {
            toView.transform = CGAffineTransformIdentity; // i.e. CGAffineTransformMakeScale(1, 1);
        }
        
    } completion:^(BOOL finished) {
        [context completeTransition:finished]; // vital
    }];
}

@end
