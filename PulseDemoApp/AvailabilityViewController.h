//
//  AvailabilityViewController.h
//  PulseDemoApp
//
//  Created by crnorman on 2/14/14.
//  Copyright (c) 2014 IBM MIL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AvailabilityViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong) UIColor *customGreenColor;
@property (strong) UIColor *customPurpleColor;
@property (strong) NSString *availabilityLabel;
@end
