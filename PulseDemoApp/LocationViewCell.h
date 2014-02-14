//
//  LocationViewCell.h
//  PulseDemoApp
//
//  Created by crnorman on 2/14/14.
//  Copyright (c) 2014 IBM MIL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LocationViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *availability;
@property (weak, nonatomic) IBOutlet UILabel *abbr;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UILabel *distance;

@end
