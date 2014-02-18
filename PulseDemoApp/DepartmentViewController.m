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
    item.name = @"Performance Ski Boots";
    item.description = @"Performance Ski Boots";
    item.inStock = @"Out of Stock!";
    item.category = @"Boots";
    item.sizes = @[@"5", @"6", @"7", @"8"];
    item.img = @"BootsImages_11.png";
    item.price = @"$549.95";
    [self.productImages addObject:item];
    
    item = [[InventoryItem alloc] init];
    item.name = @"Kids' Ski Boots";
    item.description = @"Kids' Ski Boots";
    item.inStock = @"Out of Stock!";
    item.category = @"Boots";
    item.sizes = @[@"5", @"6", @"7", @"8"];
    item.img = @"BootsImages_06.png";
    item.price = @"$199.95";
    [self.productImages addObject:item];
    
    item = [[InventoryItem alloc] init];
    item.name = @"Dynamite Ski Boots";
    item.description = @"Dynamite Ski Boots";
    item.inStock = @"New Colors!";
    item.category = @"Boots";
    item.sizes = @[@"5", @"6", @"7", @"8"];
    item.img = @"BootsImages_08.png";
    item.price = @"$499.99";
    [self.productImages addObject:item];
    
    item = [[InventoryItem alloc] init];
    item.name = @"Arctic Alltrack Ski Boots";
    item.description = @"Arctic Alltrack Ski Boots";
    item.inStock = @"Only 2 left!";
    item.category = @"Boots";
    item.sizes = @[@"5", @"6", @"7", @"8"];
    item.img = @"BootsImages_14.png";
    item.price = @"$452.75";
    [self.productImages addObject:item];
    
    item = [[InventoryItem alloc] init];
    item.name = @"Cross-Country Ski Boots";
    item.description = @"Cross-Country Ski Boots";
    item.inStock = @"In Stock";
    item.category = @"Boots";
    item.sizes = @[@"5", @"6", @"7", @"8"];
    item.img = @"BootsImages_03.png";
    item.price = @"$649.95";
    [self.productImages addObject:item];
    
    item = [[InventoryItem alloc] init];
    item.name = @"Ski Boot Bindings";
    item.description = @"Ski Boot Bindings";
    item.inStock = @"In Stock";
    item.category = @"Boots";
    item.sizes = @[@"5", @"6", @"7", @"8"];
    item.img = @"BootsImages_24.png";
    item.price = @"$229.00";
    [self.productImages addObject:item];
    
    item = [[InventoryItem alloc] init];
    item.name = @"Blizzard Ski Boots";
    item.description = @"Blizzard Ski Boots";
    item.inStock = @"In Stock";
    item.category = @"Boots";
    item.sizes = @[@"5", @"6", @"7", @"8"];
    item.img = @"BootsImages_22.png";
    item.price = @"$269.83";
    [self.productImages addObject:item];
    
    item = [[InventoryItem alloc] init];
    item.name = @"Hiker's Ski Boots";
    item.description = @"Hiker's Ski Boots";
    item.inStock = @"In Stock";
    item.category = @"Boots";
    item.sizes = @[@"5", @"6", @"7", @"8"];
    item.img = @"BootsImages_23.png";
    item.price = @"$249.00";
    [self.productImages addObject:item];
    
    item = [[InventoryItem alloc] init];
    item.name = @"Captain Ski Boots";
    item.description = @"Captain Ski Boots";
    item.inStock = @"In Stock";
    item.category = @"Boots";
    item.sizes = @[@"5", @"6", @"7", @"8"];
    item.img = @"BootsImages_26.png";
    item.price = @"$269.99";
    [self.productImages addObject:item];
    
    item = [[InventoryItem alloc] init];
    item.name = @"Boot Cut Ski Pants";
    item.description = @"Boot Cut Ski Pants";
    item.inStock = @"In Stock";
    item.category = @"Boots";
    item.sizes = @[@"5", @"6", @"7", @"8"];
    item.img = @"BootsImages_21.png";
    item.price = @"$34.99";
    [self.productImages addObject:item];
    
    item = [[InventoryItem alloc] init];
    item.name = @"Captain Ski Boots";
    item.description = @"Captain Ski Boots";
    item.inStock = @"In Stock";
    item.category = @"Boots";
    item.sizes = @[@"5", @"6", @"7", @"8"];
    item.img = @"BootsImages_26.png";
    item.price = @"$269.99";
    [self.productImages addObject:item];
    
    item = [[InventoryItem alloc] init];
    item.name = @"Dynamite Ski Boots";
    item.description = @"Dynamite Ski Boots";
    item.inStock = @"New Colors!";
    item.category = @"Boots";
    item.sizes = @[@"5", @"6", @"7", @"8"];
    item.img = @"BootsImages_29.png";
    item.price = @"$499.99";
    [self.productImages addObject:item];
    
    item = [[InventoryItem alloc] init];
    item.name = @"Kids' Ski Boots";
    item.description = @"Kids' Ski Boots";
    item.inStock = @"Out of Stock!";
    item.category = @"Boots";
    item.sizes = @[@"5", @"6", @"7", @"8"];
    item.img = @"BootsImages_06.png";
    item.price = @"$199.95";
    [self.productImages addObject:item];
    
    item = [[InventoryItem alloc] init];
    item.name = @"Arctic Alltrack Ski Boots";
    item.description = @"Arctic Alltrack Ski Boots";
    item.inStock = @"Only 2 left!";
    item.category = @"Boots";
    item.sizes = @[@"5", @"6", @"7", @"8"];
    item.img = @"BootsImages_14.png";
    item.price = @"$452.75";
    [self.productImages addObject:item];
    
    item = [[InventoryItem alloc] init];
    item.name = @"Cross-Country Ski Boots";
    item.description = @"Cross-Country Ski Boots";
    item.inStock = @"In Stock";
    item.category = @"Boots";
    item.sizes = @[@"5", @"6", @"7", @"8"];
    item.img = @"BootsImages_03.png";
    item.price = @"$649.95";
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
    return (id)animator;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    MILTransitionAnimator *animator = [MILTransitionAnimator new];
    return (id)animator;
}

-(void)showDetailViewForCustomer:(NSObject *)customer
{
    NSLog(@"Showing Detail View for customer");
    [self performSegueWithIdentifier: @"ProductDetailSegue" sender: self];
}

@end
