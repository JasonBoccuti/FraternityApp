//
//  ViewController.h
//  SinfoniaApp
//
//  Created by Jason Boccuti on 4/28/14.
//  Copyright (c) 2014 Jason Boccuti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface LoginViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *reEnterPasswordField;
@property (weak, nonatomic) IBOutlet UIView *loginOverlayView;

- (IBAction)registerAction:(id)sender;
- (IBAction)alreadyRegisteredButton:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *loginUsernameField;
@property (weak, nonatomic) IBOutlet UITextField *loginPasswordField;

- (IBAction)logInButton:(id)sender;
- (IBAction)loginCancelButton:(id)sender;

@end
