//
//  MyBasicSignUpViewController.h
//  ParseBridge
//
//  Created by Spencer Barron on 9/2/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import <UIKit/UIKit.h>

#ifdef ANDROID
#import "ParseHeaders.h"
#import "ParseManager.h"
#else
#import <Parse/Parse.h>
#endif

@interface MyBasicSignUpViewController : UIViewController{

IBOutlet UIButton* facebookLogInButton;
IBOutlet UIButton* twitterLoginButton;
IBOutlet UIButton* parseRegisterButton;
IBOutlet UIButton* exitRegisterButton;

IBOutlet UITextField* userName;
//IBOutlet UITextField* password;
//IBOutlet UITextField* email;

UIActivityIndicatorView* activityIndicator;

NSArray* facebookPermissions;

#ifdef ANDROID
MySignUpCallback* signupCallback;
#endif

}

//- (IBAction)loginWithFacebook:(id)sender;
//- (IBAction)loginWithTwitter:(id)sender;
//- (IBAction)registerAccount:(id)sender;
//- (IBAction)exitRegister:(id)sender;
//- (void)dismissPresentedView;

@property (nonatomic, retain) NSArray* facebookPermissions;

#ifdef ANDROID
@property (nonatomic, retain) MySignUpCallback* signupCallback;
#endif

@end
