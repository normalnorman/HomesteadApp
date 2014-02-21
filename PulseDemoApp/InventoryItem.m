//
//  InventoryItem.m
//  PulseDemoApp
//
//  Created by crnorman on 2/9/14.
//  Copyright (c) 2014 IBM MIL. All rights reserved.
//

#import "InventoryItem.h"

@implementation InventoryItem
@dynamic name;
@dynamic description;
@dynamic inStock;
@dynamic category;
@dynamic sizes;
@dynamic img;
@dynamic price;

+(void)initialize
{
    [self registerSpecialization];
}

+(NSString*)dataClassName{
    return @"InventoryItem";
}

-(void)sync
{
    [self saveInBackgroundWithCallback:^(NSError *error, id obj) {
        if(error){
            // Error handing code here
            NSLog(@"createItem failed with error: %@", error);
        }
    }];
}


@end
