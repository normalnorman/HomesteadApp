//
//  ProductDetailViewController.m
//  PulseDemoApp
//
//  Created by Blake Ball on 2/11/14.
//  Copyright (c) 2014 IBM MIL. All rights reserved.
//

#import "ProductDetailViewController.h"
#import "MCRotatingCarousel.h"
#import "CustomerInformationViewController.h"
#import "MILTransitionAnimator.h"
#import "CustomerObject.h"
#import "DetailViewNavigationController.h"

@interface ProductDetailViewController ()<MCRotatingCarouselDataSource, MCRotatingCarouselDelegate>{
    NSMutableArray *_images;
    __weak IBOutlet UIButton *sizeButton2;
    __weak IBOutlet UIButton *sizeButton4;
    __weak IBOutlet UILabel *sizeLabel2;
    __weak IBOutlet UILabel *sizeLabel4;
}

- (IBAction)dismiss:(id)sender;
- (IBAction)showCustomerForm:(id)sender;
- (IBAction)requestClicked:(id)sender;
@property (strong)CustomerInformationViewController *customerInfoVC;
@property (strong)UIColor *customGreenColor;
@property (strong)UIColor *customPurpleColor;
@end

@implementation ProductDetailViewController{
    
}

-(void)viewDidLoad
{
    //self.view.bounds = CGRectMake(150, 0, 768, 768);
    [super viewDidLoad];
    
    self.customGreenColor = [UIColor colorWithRed:0 green:216 blue:144 alpha:1];
    self.customGreenColor = [UIColor colorWithRed:126 green:60 blue:245 alpha:1];
    
    _images = [[NSMutableArray alloc] init];
    
    [_images addObject:@"angle1" ];
    [_images addObject:@"angle2"];
    [_images addObject:@"angle3"];
    
    
    MCRotatingCarousel *carousel = [[MCRotatingCarousel alloc]initWithFrame:CGRectMake(0, 60, 768, 550)];
    carousel.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    carousel.delegate = self;
    carousel.dataSource = self;
    //carousel.pageControl.currentPageIndicatorTintColor = [UIColor blueColor];
    //carousel.pageControl.pageIndicatorTintColor = [UIColor cyanColor];
    carousel.pageControl.pageIndicatorTintColor = [UIColor clearColor];
    carousel.pageControl.currentPageIndicatorTintColor = [UIColor clearColor];
    [self.view addSubview:carousel];
    
    [carousel reloadData];
    
    if(self.customerObj)
    {
        [self showCustomerForm];
        [self updateAvailability:YES];
    }

}

#pragma mark - MCRotatingCarouselDataSource
-(UIView *)rotatingCarousel:(MCRotatingCarousel *)carousel viewForItemAtIndex:(NSUInteger)index
{
    UIView *imageView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 185, 250)];
    
    [imageView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:_images[index]]]];
    imageView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    imageView.layer.borderWidth = 1;
    
    return imageView;
}

-(NSUInteger)numberOfItemsInRotatingCarousel:(MCRotatingCarousel *)carousel
{
    return _images.count;
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

- (void)handleTapBehind:(UITapGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateEnded)
    {
        CGPoint flocation = [sender locationInView:nil]; //Passing nil gives us coordinates in the window
        
        //Then we convert the tap's location into the local view's coordinate system, and test to see if it's in or outside. If outside, dismiss the view.
        
        CGPoint tap = [self.view convertPoint:flocation fromView:self.view.window];
        CGPoint tapBar = [self.navigationController.navigationBar convertPoint:flocation fromView:self.view.window];
        if (![self.view pointInside:tap withEvent:nil] && ![self.navigationController.navigationBar pointInside:tapBar withEvent:nil])
        {
            // Remove the recognizer first so it's view.window is valid.
            [self.view.window removeGestureRecognizer:sender];
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }
}

- (IBAction)dismiss:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)showCustomerForm
{
    self.customerForm = [self.storyboard instantiateViewControllerWithIdentifier:@"CustomerForm"];
    self.customerForm.transitioningDelegate = self;
    self.customerForm.modalPresentationStyle = UIModalPresentationCustom;
    self.customerForm.view.frame = CGRectMake(368, 0, 400, 768);
    [self addChildViewController:self.customerForm];
    [self.view addSubview:self.customerForm.view];

    [self.customerForm setCustomerData:self.customerObj];
}

- (void)hideCustomerForm
{
    
}


- (IBAction)requestClicked:(id)sender {
    [self showCustomerForm];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [super prepareForSegue:segue sender:sender];
    /*self.customerInfoVC = segue.destinationViewController;
    self.customerInfoVC.transitioningDelegate = self;
    self.customerInfoVC.modalTransitionStyle = UIModalPresentationCustom;*/
}

-(void)invokeAlert
{
    if(self.customerObj)
    {
        [self.viewNav setCustomerObject:self.customerObj];
        [self.viewNav fakePush];
    }
}

-(void)updateAvailability:(BOOL)available
{
    UIImage *btnBackground;
    UIColor *labelColor;

    if(available)
    {
        btnBackground = [UIImage imageNamed:@"instock"];
        labelColor = [UIColor whiteColor];
    }else{
        btnBackground = [UIImage imageNamed:@"outofstock"];
        labelColor = [UIColor grayColor];
    }
    
    [sizeButton2 setImage:btnBackground forState:UIControlStateNormal];
    [sizeButton4 setImage:btnBackground forState:UIControlStateNormal];
    [sizeLabel2 setTextColor:labelColor];
    [sizeLabel4 setTextColor:labelColor];
}

-(void)showCustomerForm:(id)sender
{
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

#pragma mark UIAnimation code
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source {
    
    MILTransitionAnimator *animator = [MILTransitionAnimator new];
    [animator setBounds:CGRectMake(630, 0, 400, 768)];
    animator.presenting = YES;
    return (id)animator;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    MILTransitionAnimator *animator = [MILTransitionAnimator new];
    return (id)animator;
}

@end
