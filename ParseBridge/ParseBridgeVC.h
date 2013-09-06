//
//  ParseBridgeVC.h
//  ParseBridge
//
//  Created by Spencer Barron on 9/5/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParseBridgeLoginVC.h"
#import "ParseBridgeSignUpVC.h"
#ifdef ANDROID
#import "ParseHeaders.h"
#import "ParseManager.h"
#else
#import <Parse/Parse.h>
#endif

@interface ParseBridgeVC : UIViewController <ParseBridgeLoginDelegate, ParseBridgeSignUpDelegate>{
	
	IBOutlet UIButton* loginButton;
	IBOutlet UIButton* logoutButton;
	IBOutlet UILabel* statusLabel;
	
}

@property (nonatomic, retain) IBOutlet UIButton* loginButton;
@property (nonatomic, retain) IBOutlet UIButton* logoutButton;
@property (nonatomic, retain) IBOutlet UILabel* statusLabel;

- (IBAction)showLoginParse:(id)sender;
- (IBAction)logOutParse:(id)sender;

- (void)loginCompleted;
- (void)registrationCompleted;

@end
