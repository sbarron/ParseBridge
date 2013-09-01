//
//  MyBasicLoginViewController.h
//  ParseBridge
//
//  Created by Spencer Barron on 8/30/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import <UIKit/UIKit.h>

#ifdef ANDROID
#import "ParseHeaders.h"
#import "ParseManager.h"
#else
#import <Parse/Parse.h>
#endif

@interface MyBasicLoginViewController : UIViewController{

IBOutlet UIButton* signUpButton;
IBOutlet UIButton* facebookLogInButton;
IBOutlet UIButton* twitterLoginButton;
IBOutlet UIButton* parseLoginButton;
IBOutlet UIButton* exitLoginButton;

IBOutlet UITextField* userName;
IBOutlet UITextField* password;
IBOutlet UITextField* email;

UIActivityIndicatorView* activityIndicator;

NSArray* facebookPermissions;

#ifdef ANDROID
MyLogInCallback* loginCallback;
#endif

}

- (IBAction)loginWithFacebook:(id)sender;
- (IBAction)loginWithTwitter:(id)sender;
- (IBAction)registerAccount:(id)sender;
- (IBAction)loginParse:(id)sender;
- (IBAction)exitLogin:(id)sender;
 
@property (nonatomic, retain) NSArray* facebookPermissions;

#ifdef ANDROID
@property (nonatomic, retain) MyLogInCallback* loginCallback;
#endif

@end
