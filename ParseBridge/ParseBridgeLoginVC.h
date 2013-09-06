//
//  ParseBridgeLoginVC.h
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
@protocol ParseBridgeLoginDelegate <NSObject>
@required
- (void)loginCompleted;
@end

@interface ParseBridgeLoginVC : UIViewController{
	
	NSArray* facebookPermissions;
	
	IBOutlet UIButton* facebookLogInButton;
	IBOutlet UIButton* twitterLoginButton;
	IBOutlet UIButton* parseRegisterButton;
	
	IBOutlet UITextField* userName;
	IBOutlet UITextField* password;
	
	UIActivityIndicatorView* activityIndicator;

	id <ParseBridgeLoginDelegate> _delegate;
#ifdef ANDROID
	MyLogInCallback* loginCallback;
#endif

}

@property (nonatomic, retain) id delegate;
@property (nonatomic, retain) NSArray* facebookPermissions;

#ifdef ANDROID
@property (nonatomic, retain) MyLogInCallback* loginCallback;
#endif

- (IBAction)loginWithFacebook:(id)sender;
- (IBAction)loginWithTwitter:(id)sender;
- (IBAction)showRegisterParse:(id)sender;


@end
