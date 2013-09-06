//
//  ParseBridgeSignUpVC.h
//  ParseBridge
//
//  Created by Spencer Barron on 9/5/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import <UIKit/UIKit.h>

#ifdef ANDROID
#import "ParseHeaders.h"
#import "ParseManager.h"
#else
#import <Parse/Parse.h>
#endif

@protocol ParseBridgeSignUpDelegate <NSObject>
@required
- (void)registrationCompleted;
@end


@interface ParseBridgeSignUpVC : UIViewController{

	IBOutlet UIButton* facebookLogInButton;
	IBOutlet UIButton* twitterLoginButton;
	IBOutlet UIButton* parseRegisterButton;
	
	IBOutlet UITextField* userName;
	IBOutlet UITextField* password;
	IBOutlet UITextField* email;
	
	UIActivityIndicatorView* activityIndicator;
	
	NSArray* facebookPermissions;
	
	id <ParseBridgeSignUpDelegate> _delegate;
	
#ifdef ANDROID
	MySignUpCallback* signupCallback;
#endif

}

#ifdef ANDROID
@property (nonatomic, retain) MySignUpCallback* signupCallback;
#endif

@property (nonatomic, retain) id delegate;
@property (nonatomic, retain) NSArray* facebookPermissions;


- (IBAction)loginWithFacebook:(id)sender;
- (IBAction)loginWithTwitter:(id)sender;
- (IBAction)registerAccount:(id)sender;

@end
