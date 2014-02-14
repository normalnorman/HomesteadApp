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
#import "ProductDetailViewController.h"
#import "MILTransitionAnimator.h"
#import "DetailViewNavigationController.h"

@interface DepartmentViewController ()
    @property (strong, nonatomic) NSMutableArray *productImages;
@end

@implementation DepartmentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initializationxxr
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
    item.name = @"Signature Jeans";
    item.description = @"Signature Jeans";
    item.inStock = @"Out of Stock!";
    item.category = @"Shoes";
    item.sizes = @[@"5", @"6", @"7", @"8"];
    item.img = @"jeans0.png";
    item.price = @"$84.99";
    [self.productImages addObject:item];
    
    item = [[InventoryItem alloc] init];
    item.name = @"Flounce Denim Jeans";
    item.description = @"Flounce Denim Jeans";
    item.inStock = @"Only 2 Left!";
    item.category = @"Shoes";
    item.sizes = @[@"5", @"6", @"7", @"8"];
    item.img = @"jeans2.png";
    item.price = @"$49.99";
    [self.productImages addObject:item];
    
    item = [[InventoryItem alloc] init];
    item.name = @"Boyfriend Jeans";
    item.description = @"Boyfriend Jeans";
    item.inStock = @"Only 3 Left!";
    item.category = @"Shoes";
    item.sizes = @[@"5", @"6", @"7", @"8"];
    item.img = @"jeans3.png";
    item.price = @"$44.99";
    [self.productImages addObject:item];
    
    item = [[InventoryItem alloc] init];
    item.name = @"Deep Dye Jeans";
    item.description = @"Deep Dye Jeans";
    item.inStock = @"";
    item.category = @"Shoes";
    item.sizes = @[@"5", @"6", @"7", @"8"];
    item.img = @"jeans4.png";
    item.price = @"$29.59";
    [self.productImages addObject:item];
    
    item = [[InventoryItem alloc] init];
    item.name = @"Weekender Jeans";
    item.description = @"Weekender Jeans";
    item.inStock = @"";
    item.category = @"Shoes";
    item.sizes = @[@"5", @"6", @"7", @"8"];
    item.img = @"jeans5.png";
    item.price = @"$34.99";
    [self.productImages addObject:item];
    
    item = [[InventoryItem alloc] init];
    item.name = @"Black Legging Jeans";
    item.description = @"Black Legging Jeans";
    item.inStock = @"In Stock";
    item.category = @"Shoes";
    item.sizes = @[@"5", @"6", @"7", @"8"];
    item.img = @"jeans6.png";
    item.price = @"$27.99";
    [self.productImages addObject:item];
    
    item = [[InventoryItem alloc] init];
    item.name = @"Bootcut Jeans";
    item.description = @"Bootcut Jeans";
    item.inStock = @"In Stock";
    item.category = @"Shoes";
    item.sizes = @[@"5", @"6", @"7", @"8"];
    item.img = @"jeans7.png";
    item.price = @"$44.99";
    [self.productImages addObject:item];
    
    item = [[InventoryItem alloc] init];
    item.name = @"Bicycle Jeans";
    item.description = @"Bicycle Jeans";
    item.inStock = @"In Stock";
    item.category = @"Shoes";
    item.sizes = @[@"5", @"6", @"7", @"8"];
    item.img = @"jeans8.png";
    item.price = @"$44.99";
    [self.productImages addObject:item];
    
    item = [[InventoryItem alloc] init];
    item.name = @"Moto Jeans";
    item.description = @"Moto Jeans";
    item.inStock = @"In Stock";
    item.category = @"Shoes";
    item.sizes = @[@"5", @"6", @"7", @"8"];
    item.img = @"jeans9.png";
    item.price = @"$29.59";
    [self.productImages addObject:item];
    
    item = [[InventoryItem alloc] init];
    item.name = @"Wide Leg Jeans";
    item.description = @"Wide Leg Jeans";
    item.inStock = @"In Stock";
    item.category = @"Shoes";
    item.sizes = @[@"5", @"6", @"7", @"8"];
    item.img = @"jeans10.png";
    item.price = @"$34.99";
    [self.productImages addObject:item];
    
    item = [[InventoryItem alloc] init];
    item.name = @"Deep Dye Jeans";
    item.description = @"Deep Dye Jeans";
    item.inStock = @"In Stock";
    item.category = @"Shoes";
    item.sizes = @[@"5", @"6", @"7", @"8"];
    item.img = @"jeans4.png";
    item.price = @"$44.99";
    [self.productImages addObject:item];
    
    item = [[InventoryItem alloc] init];
    item.name = @"Boyfriend Jeans";
    item.description = @"Boyfriend Jeans";
    item.inStock = @"In Stock";
    item.category = @"Shoes";
    item.sizes = @[@"5", @"6", @"7", @"8"];
    item.img = @"jeans3.png";
    item.price = @"$59.99";
    [self.productImages addObject:item];
    
    item = [[InventoryItem alloc] init];
    item.name = @"Weekender Jeans";
    item.description = @"Weekender Jeans";
    item.inStock = @"In Stock";
    item.category = @"Shoes";
    item.sizes = @[@"5", @"6", @"7", @"8"];
    item.img = @"jeans5.png";
    item.price = @"$69.99";
    [self.productImages addObject:item];
    
    item = [[InventoryItem alloc] init];
    item.name = @"Bootcut Jeans";
    item.description = @"Bootcut Jeans";
    item.inStock = @"In Stock";
    item.category = @"Shoes";
    item.sizes = @[@"5", @"6", @"7", @"8"];
    item.img = @"jeans7.png";
    item.price = @"$39.99";
    [self.productImages addObject:item];
    
    item = [[InventoryItem alloc] init];
    item.name = @"Flounce Denim Jeans";
    item.description = @"Flounce Denim Jeans";
    item.inStock = @"In Stock";
    item.category = @"Shoes";
    item.sizes = @[@"5", @"6", @"7", @"8"];
    item.img = @"jeans2.png";
    item.price = @"$58.00";
    [self.productImages addObject:item];
    
    
    /*item = [[InventoryItem alloc] init];
    item.name = @"Shoe 11";
    item.description = @"Shoe 11";
    item.inStock = YES;
    item.category = @"Shoes";
    item.sizes = @[@"5", @"6", @"7", @"8"];
    item.img = @"wcl004_0419.jpg";
    [self.productImages addObject:item];
    
    item = [[InventoryItem alloc] init];
    item.name = @"Shoe 12";
    item.description = @"Shoe 12";
    item.inStock = YES;
    item.category = @"Shoes";
    item.sizes = @[@"5", @"6", @"7", @"8"];
    item.img = @"wcl004_0420.jpg";
    [self.productImages addObject:item];
    
    item = [[InventoryItem alloc] init];
    item.name = @"Shoe 13";
    item.description = @"Shoe 13";
    item.inStock = YES;
    item.category = @"Shoes";
    item.sizes = @[@"5", @"6", @"7", @"8"];
    item.img = @"wcl004_0405.jpg";
    [self.productImages addObject:item];
    
    item = [[InventoryItem alloc] init];
    item.name = @"Shoe 14";
    item.description = @"Shoe 14";
    item.inStock = YES;
    item.category = @"Shoes";
    item.sizes = @[@"5", @"6", @"7", @"8"];
    item.img = @"wcl004_0408.jpg";
    [self.productImages addObject:item];
    
    item = [[InventoryItem alloc] init];
    item.name = @"Shoe 15";
    item.description = @"Shoe 15";
    item.inStock = YES;
    item.category = @"Shoes";
    item.sizes = @[@"5", @"6", @"7", @"8"];
    item.img = @"wcl004_0418.jpg";
    [self.productImages addObject:item];
    
    item = [[InventoryItem alloc] init];
    item.name = @"Shoe 16";
    item.description = @"Shoe 16";
    item.inStock = YES;
    item.category = @"Shoes";
    item.sizes = @[@"5", @"6", @"7", @"8"];
    item.img = @"wcl004_0402.jpg";
    [self.productImages addObject:item]; */
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
    cell.availability.text = item.inStock;
    cell.price.text = item.price;
    
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(170.0, 265.0);
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
    NSLog(@"Item deselected");
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [super prepareForSegue:segue sender:sender];
    ProductDetailViewController *vc = segue.destinationViewController;
    vc.transitioningDelegate = self;
    vc.modalTransitionStyle = UIModalPresentationCustom;
    vc.viewNav = (DetailViewNavigationController*)self.navigationController;
    
    if(vc.viewNav.customerObj.name.length > 0)
    {
        NSLog(@"Customer is set, do something here");
        vc.customerObj = vc.viewNav.customerObj;
    }
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source {
    
    MILTransitionAnimator *animator = [MILTransitionAnimator new];
    [animator setBounds:CGRectMake(260, 0, 768, 768)];
    animator.presenting = YES;
    return animator;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    MILTransitionAnimator *animator = [MILTransitionAnimator new];
    return animator;
}

-(void)showDetailViewForCustomer:(NSObject *)customer
{
    NSLog(@"Showing Detail View for customer");
    [self performSegueWithIdentifier: @"ProductDetailSegue" sender: self];
}

@end
