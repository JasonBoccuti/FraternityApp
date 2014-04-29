//
//  ViewController.m
//  SinfoniaApp
//
//  Created by Jason Boccuti on 4/28/14.
//  Copyright (c) 2014 Jason Boccuti. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [_usernameField setDelegate:self];
    [_emailField setDelegate:self];
    [_passwordField setDelegate:self];
    [_reEnterPasswordField setDelegate:self];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"dark_linen-640x960.png"]];

    
    
}

- (void) viewDidAppear:(BOOL)animated {
    
    // Create an instance of a parse user
    PFUser *user = [PFUser currentUser];
    // If the current user's username exists, login
    if (user.username != nil) {
        [self performSegueWithIdentifier:@"login" sender:self];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// User clicked Register
- (IBAction)registerAction:(id)sender {
    
    // Dismiss the Keyboard
    [_usernameField resignFirstResponder];
    [_emailField resignFirstResponder];
    [_passwordField resignFirstResponder];
    [_reEnterPasswordField resignFirstResponder];
    
    // Make sure the fields are complete
    [self checkFieldsComplete];
    
}

// Goes through list of fields to double check they're all complete
- (void) checkFieldsComplete {
    
    // If one or more fields are blank...
    if ([_usernameField.text isEqualToString:@""] || [_emailField.text isEqualToString:@""] || [_passwordField.text isEqualToString:@""] || [_reEnterPasswordField.text isEqualToString:@""]) {
        
        // Alert the user to say they're not complete
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"You must complete all fields." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        
    }
    // If all the fields are completed...
    else {
        // Check to see if the passwords match
        [self checkPasswordsMatch];
    }
}


- (void) checkPasswordsMatch {
    
    // If the passwords don't match..
    if (![_passwordField.text isEqualToString:_reEnterPasswordField.text]) {
        
        // Alert the user saying they don't match
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Passwords don't match." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
    // If they match...
    else {
        // Register the user
        [self registerNewUser];
    }
}


// Create a new user
- (void) registerNewUser {
    
    // Create a parse user
    PFUser *newUser = [PFUser user];
    // Assign the parse user all the registered info
    newUser.username = _usernameField.text;
    newUser.email = _emailField.text;
    newUser.password = _passwordField.text;
    
    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        // If the registration succeeds
        if (!error) {
            NSLog(@"Registration Success.");
            // Transition to the next view
            [self performSegueWithIdentifier:@"login" sender:self];
            
            // Clear all fields
            _usernameField.text = nil;
            _emailField.text = nil;
            _passwordField.text = nil;
            _reEnterPasswordField.text = nil;
            _loginUsernameField.text = nil;
            _loginPasswordField.text = nil;
        }
        // If it fails
        else {
            NSLog(@"There was an error in registration.");
        }
    }];
}

// If a user is already registered
- (IBAction)alreadyRegisteredButton:(id)sender {
    // Transition to the login Screen
    [UIView animateWithDuration:0.3 animations:^ {
        _loginOverlayView.frame = self.view.frame;
    }];
    
    self.loginOverlayView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"dark_linen-640x960.png"]];

    // Dismiss the Keyboard
    [_usernameField resignFirstResponder];
    [_emailField resignFirstResponder];
    [_passwordField resignFirstResponder];
    [_reEnterPasswordField resignFirstResponder];
    
}


- (IBAction)logInButton:(id)sender {
    // Log in with the credentials entered
    [PFUser logInWithUsernameInBackground:_loginUsernameField.text password:_loginPasswordField.text block:^(PFUser *user, NSError *error) {
        // If login was successful, segue into app
        if (!error) {
            NSLog(@"Log in User");
            [self performSegueWithIdentifier:@"login" sender:self];
            
            // Clear all fields
            _usernameField.text = nil;
            _emailField.text = nil;
            _passwordField.text = nil;
            _reEnterPasswordField.text = nil;
            _loginUsernameField.text = nil;
            _loginPasswordField.text = nil;
        }
        // If login unsuccessful, display error message
        else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Sorry, there was a problem logging in." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
        }
    }];
}

- (IBAction)loginCancelButton:(id)sender {
    [UIView animateWithDuration:0.3 animations:^ {
        _loginOverlayView.frame = CGRectMake(320, 0, 320, 568);
    }];
}


// Dismiss the Keyboard
- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

// White Status Bar
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


- (BOOL) textFieldShouldBeginEditing:(UITextField *)textField {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.35f];
    
    CGRect frame = self.view.frame;
    frame.origin.y = - 216;
    [self.view setFrame:frame];
    
    [UIView commitAnimations];
    return YES;
}

- (BOOL) textFieldShouldEndEditing:(UITextField *)textField{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.35f];
    
    CGRect frame = self.view.frame;
    frame.origin.y = + 0;
    [self.view setFrame:frame];
    
    [UIView commitAnimations];
    return YES;
}


@end
