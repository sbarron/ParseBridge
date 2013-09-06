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

//IBOutlet UIButton* signUpButton;
//IBOutlet UIButton* facebookLogInButton;
//IBOutlet UIButton* twitterLoginButton;
//IBOutlet UIButton* parseLoginButton;

//IBOutlet UITextField* userName;
//IBOutlet UITextField* password;

//UIActivityIndicatorView* activityIndicator;

NSArray* facebookPermissions;

}

//- (IBAction)loginWithFacebook:(id)sender;
//- (IBAction)loginWithTwitter:(id)sender;
//- (IBAction)loginParse:(id)sender;
 
@property (nonatomic, retain) NSArray* facebookPermissions;

#ifdef ANDROID
@property (nonatomic, retain) MyLogInCallback* loginCallback;
#endif





@end
