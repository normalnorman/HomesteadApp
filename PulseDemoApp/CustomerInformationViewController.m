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
- (IBAction)dismiss:(id)sender;
- (IBAction)saveInfo:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
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
	// Do any additional setup after loading the view.
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

- (BOOL)disablesAutomaticKeyboardDismissal {
    return NO;
}
@end
