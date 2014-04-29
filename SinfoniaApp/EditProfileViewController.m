//
//  EditProfileViewController.m
//  SinfoniaApp
//
//  Created by Jason Boccuti on 4/28/14.
//  Copyright (c) 2014 Jason Boccuti. All rights reserved.
//

#import "EditProfileViewController.h"

@interface EditProfileViewController ()

@end

@implementation EditProfileViewController

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
    [_currentUsernameField setDelegate:self];
    [_currentEmailField setDelegate:self];
    [_currentPasswordField setDelegate:self];
    [_theNewPasswordField setDelegate:self];
    [_reEnterPasswordField setDelegate:self];
    
    // Populate both fields with current user's info
    _currentUsernameField.text = [PFUser currentUser].username;
    _currentEmailField.text = [PFUser currentUser].email;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)logoutButton:(id)sender {
    // Log out the user when the logout button is clicked
    [PFUser logOut];
    // Dismiss the current view to go back to the registering page
    [self dismissViewControllerAnimated:YES completion:nil];
    _currentUsernameField.text = nil;
    _currentEmailField.text = nil;
    _currentPasswordField.text = nil;
    _theNewPasswordField.text = nil;
    _reEnterPasswordField.text = nil;
}


- (IBAction)savePassword:(id)sender {
    
    if ([_currentPasswordField.text isEqualToString:@""] || [_theNewPasswordField.text isEqualToString:@""] || [_reEnterPasswordField.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"You must complete all fields." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else {
        // Check to see if the passwords match
        [self checkPasswordsMatch];
        _currentPasswordField.text = nil;
        _theNewPasswordField.text = nil;
        _reEnterPasswordField.text = nil;
    }
}

- (void) checkPasswordsMatch {
    
    // If the passwords match..
    if ([_theNewPasswordField.text isEqualToString:_reEnterPasswordField.text] && [_currentPasswordField.text isEqualToString:[PFUser currentUser].password]) {
        
        // Alert the user saying they don't match
        [self changePassword];
    }
    // If they don't match match...
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Passwords don't match." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];;
    }
}

- (void) changePassword {
    [PFUser currentUser].password = _theNewPasswordField.text;
    [[PFUser currentUser] saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if(!error) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success!" message:@"Your password has been successfully changed." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
            
            _currentPasswordField.text = nil;
            _theNewPasswordField.text = nil;
            _reEnterPasswordField.text = nil;
            
        }
        else {
            NSLog(@"There was an error in changing the password.");

        }
    }];
}

// Raise view when keyboard appears
- (BOOL) textFieldShouldBeginEditing:(UITextField *)textField {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.35f];
    
    CGRect frame = self.view.frame;
    frame.origin.y = - 216;
    [self.view setFrame:frame];
    
    [UIView commitAnimations];
    
    return YES;
}


// Lower view when keyboard appears
- (BOOL) textFieldShouldEndEditing:(UITextField *)textField{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.35f];
    
    CGRect frame = self.view.frame;
    frame.origin.y = + 0;
    [self.view setFrame:frame];
    
    [UIView commitAnimations];
    return YES;
}


// Dismiss the Keyboard
- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end
