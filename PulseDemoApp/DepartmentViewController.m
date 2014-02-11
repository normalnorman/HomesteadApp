//
//  DepartmentViewController.m
//  PulseDemoApp
//
//  Created by crnorman on 2/10/14.
//  Copyright (c) 2014 IBM MIL. All rights reserved.
//

#import "DepartmentViewController.h"
#import "InventoryItem.h"
#import "ProductCollectionViewCell.h"

@interface DepartmentViewController ()
    @property (strong, nonatomic) NSMutableArray *productImages;
@end

@implementation DepartmentViewController

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
    
    self.productImages = [[NSMutableArray alloc] init];
	// Do any additional setup after loading the view.
    /*self.productImages = @[@"store_photos/wsh005_0501.jpg", @"store_photos/wsh005_0502.jpg", @"store_photos/wsh005_0503.jpg", @"store_photos/wsh005_0509.jpg", @"store_photos/wsh005_0510.jpg", @"store_photos/wsh005_0512.jpg", @"store_photos/wsh005_0507.jpg", @"store_photos/wsh005_0508.jpg" ];*/
    
    InventoryItem *item = [[InventoryItem alloc] init];
    item.name = @"Shoe 1";
    item.description = @"Shoe 1";
    item.inStock = YES;
    item.category = @"Shoes";
    item.sizes = @[@"5", @"6", @"7", @"8"];
    item.img = @"wsh005_0501.jpg";
    [self.productImages addObject:item];
    
    item = [[InventoryItem alloc] init];
    item.name = @"Shoe 2";
    item.description = @"Shoe 2";
    item.inStock = YES;
    item.category = @"Shoes";
    item.sizes = @[@"5", @"6", @"7", @"8"];
    item.img = @"wsh005_0502.jpg";
    [self.productImages addObject:item];
    
    item = [[InventoryItem alloc] init];
    item.name = @"Shoe 3";
    item.description = @"Shoe 3";
    item.inStock = YES;
    item.category = @"Shoes";
    item.sizes = @[@"5", @"6", @"7", @"8"];
    item.img = @"wsh005_0503.jpg";
    [self.productImages addObject:item];
    
    item = [[InventoryItem alloc] init];
    item.name = @"Shoe 4";
    item.description = @"Shoe 4";
    item.inStock = YES;
    item.category = @"Shoes";
    item.sizes = @[@"5", @"6", @"7", @"8"];
    item.img = @"wsh005_0509.jpg";
    [self.productImages addObject:item];
    
    item = [[InventoryItem alloc] init];
    item.name = @"Shoe 5";
    item.description = @"Shoe 5";
    item.inStock = YES;
    item.category = @"Shoes";
    item.sizes = @[@"5", @"6", @"7", @"8"];
    item.img = @"wsh005_0510.jpg";
    [self.productImages addObject:item];
    
    item = [[InventoryItem alloc] init];
    item.name = @"Shoe 6";
    item.description = @"Shoe 6";
    item.inStock = YES;
    item.category = @"Shoes";
    item.sizes = @[@"5", @"6", @"7", @"8"];
    item.img = @"wsh005_0512.jpg";
    [self.productImages addObject:item];
    
    item = [[InventoryItem alloc] init];
    item.name = @"Shoe 7";
    item.description = @"Shoe 7";
    item.inStock = YES;
    item.category = @"Shoes";
    item.sizes = @[@"5", @"6", @"7", @"8"];
    item.img = @"wsh005_0514.jpg";
    [self.productImages addObject:item];
    
    item = [[InventoryItem alloc] init];
    item.name = @"Shoe 8";
    item.description = @"Shoe 8";
    item.inStock = YES;
    item.category = @"Shoes";
    item.sizes = @[@"5", @"6", @"7", @"8"];
    item.img = @"wsh005_0515.jpg";
    [self.productImages addObject:item];
    
    item = [[InventoryItem alloc] init];
    item.name = @"Shoe 9";
    item.description = @"Shoe 9";
    item.inStock = YES;
    item.category = @"Shoes";
    item.sizes = @[@"5", @"6", @"7", @"8"];
    item.img = @"wsh005_0518.jpg";
    [self.productImages addObject:item];
    
    item = [[InventoryItem alloc] init];
    item.name = @"Shoe 10";
    item.description = @"Shoe 10";
    item.inStock = YES;
    item.category = @"Shoes";
    item.sizes = @[@"5", @"6", @"7", @"8"];
    item.img = @"wsh005_0519.jpg";
    [self.productImages addObject:item];
    
    item = [[InventoryItem alloc] init];
    item.name = @"Shoe 11";
    item.description = @"Shoe 11";
    item.inStock = YES;
    item.category = @"Shoes";
    item.sizes = @[@"5", @"6", @"7", @"8"];
    item.img = @"wsh005_0524.jpg";
    [self.productImages addObject:item];
    
    item = [[InventoryItem alloc] init];
    item.name = @"Shoe 12";
    item.description = @"Shoe 12";
    item.inStock = YES;
    item.category = @"Shoes";
    item.sizes = @[@"5", @"6", @"7", @"8"];
    item.img = @"wsh005_0525.jpg";
    [self.productImages addObject:item];
    
    item = [[InventoryItem alloc] init];
    item.name = @"Shoe 13";
    item.description = @"Shoe 13";
    item.inStock = YES;
    item.category = @"Shoes";
    item.sizes = @[@"5", @"6", @"7", @"8"];
    item.img = @"wsh005_0526.jpg";
    [self.productImages addObject:item];
    
    item = [[InventoryItem alloc] init];
    item.name = @"Shoe 14";
    item.description = @"Shoe 14";
    item.inStock = YES;
    item.category = @"Shoes";
    item.sizes = @[@"5", @"6", @"7", @"8"];
    item.img = @"wsh005_0527.jpg";
    [self.productImages addObject:item];
    
    item = [[InventoryItem alloc] init];
    item.name = @"Shoe 15";
    item.description = @"Shoe 15";
    item.inStock = YES;
    item.category = @"Shoes";
    item.sizes = @[@"5", @"6", @"7", @"8"];
    item.img = @"wsh005_0528.jpg";
    [self.productImages addObject:item];
    
    item = [[InventoryItem alloc] init];
    item.name = @"Shoe 16";
    item.description = @"Shoe 16";
    item.inStock = YES;
    item.category = @"Shoes";
    item.sizes = @[@"5", @"6", @"7", @"8"];
    item.img = @"wsh005_0533.jpg";
    [self.productImages addObject:item];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.productImages.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ProductCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ProductCell" forIndexPath:indexPath];
    InventoryItem *item = [self.productImages objectAtIndex:indexPath.row];
    
    cell.img.image = [UIImage imageNamed:item.img];
    cell.label.text = item.name;
    
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(150.0, 150.0);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ProductCollectionViewCell *selectedCell = (ProductCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    NSLog(@"Selected product %@", selectedCell.label.text);
}

-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
