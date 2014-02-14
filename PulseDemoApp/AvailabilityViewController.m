//
//  AvailabilityViewController.m
//  PulseDemoApp
//
//  Created by crnorman on 2/14/14.
//  Copyright (c) 2014 IBM MIL. All rights reserved.
//

#import "AvailabilityViewController.h"
#import "LocationViewCell.h"
#import "LocationItem.h"
#import "DetailViewNavigationController.h"

@interface AvailabilityViewController ()
@property (weak, nonatomic) IBOutlet UILabel *availability;
@property (weak, nonatomic) IBOutlet UILabel *locationDistance;
@property (weak, nonatomic) IBOutlet UILabel *locationAbbr;
@property (weak, nonatomic) IBOutlet UILabel *locationName;
@property (strong, nonatomic) NSMutableArray *locationData;
@end

@implementation AvailabilityViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self setIsInStock:self.availabilityLabel];
}

- (void)setIsInStock:(NSString*)available
{
    self.locationData = [[NSMutableArray alloc] init];
    
    if ([available isEqualToString:@"In Stock"])
    {
        LocationItem *location = [[LocationItem alloc] init];
        location.mapLabel = @"A.";
        location.name = @"N I-35, Austin";
        location.distance = @"12 mi";
        location.availability = @"In Stock";
        
        [self.locationData addObject:location];
        
        location = [[LocationItem alloc] init];
        location.mapLabel = @"B.";
        location.name = @"W Braker LN, Austin";
        location.distance = @"18 mi";
        location.availability = @"In Stock";
        
        [self.locationData addObject:location];
        
        location = [[LocationItem alloc] init];
        location.mapLabel = @"C.";
        location.name = @"Broder LN, Austin";
        location.distance = @"27 mi";
        location.availability = @"In Stock";
        
        [self.locationData addObject:location];
        
        location = [[LocationItem alloc] init];
        location.mapLabel = @"D.";
        location.name = @"San Antonio, TX";
        location.distance = @"110 mi";
        location.availability = @"In Stock";
        
        [self.locationData addObject:location];
        
        location = [[LocationItem alloc] init];
        location.mapLabel = @"E.";
        location.name = @"Dallas, TX";
        location.distance = @"229 mi";
        location.availability = @"In Stock";
        
        [self.locationData addObject:location];
    }else{
        LocationItem *location = [[LocationItem alloc] init];
        location.mapLabel = @"A.";
        location.name = @"N I-35, Austin";
        location.distance = @"12 mi";
        location.availability = @"Out of Stock";
        
        [self.locationData addObject:location];
        
        location = [[LocationItem alloc] init];
        location.mapLabel = @"B.";
        location.name = @"W Braker LN, Austin";
        location.distance = @"18 mi";
        location.availability = @"Out of Stock";
        
        [self.locationData addObject:location];
        
        location = [[LocationItem alloc] init];
        location.mapLabel = @"C.";
        location.name = @"Broder LN, Austin";
        location.distance = @"27 mi";
        location.availability = @"Out of Stock";
        
        [self.locationData addObject:location];
        
        location = [[LocationItem alloc] init];
        location.mapLabel = @"D.";
        location.name = @"San Antonio, TX";
        location.distance = @"110 mi";
        location.availability = @"Out of Stock";
        
        [self.locationData addObject:location];
        
        location = [[LocationItem alloc] init];
        location.mapLabel = @"E.";
        location.name = @"Dallas, TX";
        location.distance = @"229 mi";
        location.availability = @"Out of Stock";
        
        [self.locationData addObject:location];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.locationData.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LocationViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LocationListCell" forIndexPath:indexPath];
    LocationItem *item = [self.locationData objectAtIndex:indexPath.row];
    
    cell.abbr.text = item.mapLabel;
    cell.label.text = item.name;
    cell.distance.text = item.distance;
    cell.availability.text = item.availability;
    if([item.availability isEqualToString:@"Available"])
    {
        [cell.availability setTextColor:[UIColor colorWithRed:0.0 green:211.0 blue:144.0 alpha:1]];
    }
    
    return cell;
}

@end
