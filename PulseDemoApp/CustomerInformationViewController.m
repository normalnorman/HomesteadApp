//
//  CustomerInformationViewController.m
//  PulseDemoApp
//
//  Created by crnorman on 2/12/14.
//  Copyright (c) 2014 IBM MIL. All rights reserved.
//

#import "CustomerInformationViewController.h"
#import "CustomerObject.h"

@interface CustomerInformationViewController ()
@property (nonatomic, strong)CustomerObject *customerObject;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UIButton *callButton;
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
    self.customerObject = [[CustomerObject alloc] init];
    [self setCallButtonEnabled:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismiss:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)saveInfo:(id)sender {
    //[self dismiss:sender];
    /*UIButton *callButton = [[UIButton alloc] initWithFrame:CGRectMake(50, 400, 100, 50)];*/
    [self changedPhoneNumber:sender];
    [self changedName:sender];
    [self changedEmail:sender];
    
    [self hideKeyboard];
}

- (IBAction)changedPhoneNumber:(id)sender {
    NSLog(@"Changed phone number");
    self.customerObject.phoneNumber = self.phoneField.text;
    
    [self setCallButtonEnabled:YES];
}

- (IBAction)changedName:(id)sender {
    self.customerObject.name = self.nameField.text;
}

- (IBAction)changedEmail:(id)sender {
    NSLog(@"Changed phone number");
    self.customerObject.email = self.emailField.text;
}

- (IBAction)saveCustomer:(id)sender {
    [self saveInfo:sender];
    
    [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(showAlert:) userInfo:nil repeats:NO];
}

- (void)showAlert:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Signature Jeans (Evolution Cotton) Available"
                                                    message:@"Would you like to notify Ana Blank?"
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"OK",
                          nil];
    [alert show];
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
    /*[self.callButton setHidden:enabled];

    if(enabled)
        [self.callButton setAlpha:1.0];
    else
        [self.callButton setAlpha:0];*/
    //[self.callButton]
    //[self.callButtonBackground setEnabled:enabled];
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

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    
    if([title isEqualToString:@"OK"])
    {
        [self setCallButtonEnabled:YES];
    }
}

@end
