//
//  ProductDetailViewController.m
//  PulseDemoApp
//
//  Created by Blake Ball on 2/11/14.
//  Copyright (c) 2014 IBM MIL. All rights reserved.
//

#import "ProductDetailViewController.h"
#import "MCRotatingCarousel.h"

@interface ProductDetailViewController ()<MCRotatingCarouselDataSource, MCRotatingCarouselDelegate>

@property (strong) NSArray *items;

@end

@implementation ProductDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.items = @[
                       
                       [UIImage imageNamed:@"gcl018_1805.jpg"],
                       [UIImage imageNamed:@"gcl018_1806.jpg"],
                       [UIImage imageNamed:@"gcl018_1808.jpg"],
                       [UIImage imageNamed:@"gcl018_1809.jpg"]
                       ];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
    
    MCRotatingCarousel *carousel = [[MCRotatingCarousel alloc]initWithFrame:self.view.bounds];
    carousel.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    carousel.delegate = self;
    carousel.dataSource = self;
    //carousel.pageControl.currentPageIndicatorTintColor = [UIColor blueColor];
    //carousel.pageControl.pageIndicatorTintColor = [UIColor cyanColor];
    [self.view addSubview:carousel];
    
    [carousel reloadData];

}
#pragma mark - MCRotatingCarouselDataSource
-(UIView *)rotatingCarousel:(MCRotatingCarousel *)carousel viewForItemAtIndex:(NSUInteger)index
{
    //Create your view here - it could be any kind of view, eg. a UIImageView.
    //UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 150, 150)];
    //view.backgroundColor = self.items[index];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:self.items[index]];
    /*view.layer.borderColor = [[UIColor darkGrayColor] CGColor];
     view.layer.borderWidth = 2;*/
    imageView.frame = CGRectMake(0, 0, 150, 150);
    imageView.center = imageView.superview.center;
    
    return (UIView*)imageView;
}

-(NSUInteger)numberOfItemsInRotatingCarousel:(MCRotatingCarousel *)carousel
{
    return self.items.count;
}

#pragma mark - MCRotatingCarouselDelegate
-(void)rotatingCarousel:(MCRotatingCarousel *)carousel didSelectView:(UIView *)view atIndex:(NSUInteger)index
{
    NSLog(@"did select item at index: %i",index);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
