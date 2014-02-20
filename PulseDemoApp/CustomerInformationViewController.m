//
//  CustomerInformationViewController.m
//  PulseDemoApp
//
//  Created by crnorman on 2/12/14.
//  Copyright (c) 2014 IBM MIL. All rights reserved.
//

#import "CustomerInformationViewController.h"
#import "ProductDetailViewController.h"
#import "CustomerObject.h"

@interface CustomerInformationViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UIButton *callButton;
@property (weak, nonatomic) IBOutlet UITextField *addressField;
@property (weak, nonatomic) IBOutlet UIButton *callButtonBackground;
- (IBAction)dismiss:(id)sender;
- (IBAction)saveInfo:(id)sender;
- (IBAction)changedPhoneNumber:(id)sender;
- (IBAction)changedName:(id)sender;
- (IBAction)changedEmail:(id)sender;
- (IBAction)saveCustomer:(id)sender;
@end

@implementation CustomerInformationViewController

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
    self.customerObj = [[CustomerObject alloc] init];
    [self setCallButtonEnabled:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismiss:(id)sender {
    [self.view removeFromSuperview];
}

- (IBAction)saveInfo:(id)sender {
    [self changedPhoneNumber:sender];
    [self changedName:sender];
    [self changedEmail:sender];
    [self changedAddress:sender];
    CustomerObject *obj = self.customerObj;
    
    [obj saveInBackgroundWithCallback:^(NSError *error, id obj) {
        if(error){
            // Error handing code here
            NSLog(@"createItem failed with error: %@", error);
        }
    }];
    
    [self hideKeyboard];
}

- (IBAction)changedPhoneNumber:(id)sender {
    self.customerObj.phoneNumber = self.phoneField.text;
    
    [self setCallButtonEnabled:YES];
}

- (IBAction)changedName:(id)sender {
    self.customerObj.fullName = self.nameField.text;
}

- (IBAction)changedEmail:(id)sender {
    self.customerObj.email = self.emailField.text;
}

- (IBAction)changedAddress:(id)sender {
    self.customerObj.address = self.addressField.text;
}

- (IBAction)saveCustomer:(id)sender {
    [self saveInfo:sender];
    ProductDetailViewController *parent = (ProductDetailViewController*)self.parentViewController;
    parent.customerObj = self.customerObj;
    [parent invokeAlert];
    
    //close popup and detail dialog
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self hideKeyboard];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self saveInfo:nil];
    [self hideKeyboard];
    return YES;
}

-(void)hideKeyboard
{
    [self.view endEditing:YES];
}

-(void)setCallButtonEnabled:(BOOL)enabled
{
    self.callButton.hidden = !enabled;
}

-(IBAction)callUser:(id)sender
{
    NSString *numberToCall = self.phoneField.text;
    NSLog(@"Number to call is %@",numberToCall);
    //TODO: Insert Twilio code here
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@", numberToCall]]];
}

- (BOOL)disablesAutomaticKeyboardDismissal {
    return NO;
}

- (void)setCustomerData:(CustomerObject*)customerObj
{
    if(customerObj)
    {
        self.customerObj = customerObj;
        self.nameField.text = customerObj.fullName;
        self.emailField.text = customerObj.email;
        self.phoneField.text = customerObj.phoneNumber;
        self.addressField.text = customerObj.address;
        [self setCallButtonEnabled:YES];
    }
}

@end
