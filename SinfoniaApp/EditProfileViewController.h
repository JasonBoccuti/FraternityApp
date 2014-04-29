//
//  EditProfileViewController.h
//  SinfoniaApp
//
//  Created by Jason Boccuti on 4/28/14.
//  Copyright (c) 2014 Jason Boccuti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface EditProfileViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *currentUsernameField;
@property (weak, nonatomic) IBOutlet UITextField *currentEmailField;
@property (weak, nonatomic) IBOutlet UITextField *currentPasswordField;
@property (weak, nonatomic) IBOutlet UITextField *theNewPasswordField;
@property (weak, nonatomic) IBOutlet UITextField *reEnterPasswordField;

- (IBAction)logoutButton:(id)sender;
- (IBAction)savePassword:(id)sender;

@end
