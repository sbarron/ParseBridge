//
//  ParseBridgeViewController.h
//  ParseBridge
//
//  Created by Spencer Barron on 8/28/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import <UIKit/UIKit.h>
#ifdef ANDROID
#import "ParseHeaders.h"
#import "ParseManager.h"
#else
#import <Parse/Parse.h>
#endif

@interface ParseBridgeViewController : UIViewController{

	//	IBOutlet UIButton* loginButton;
	//	IBOutlet UIButton* logOutButton;
		
	//	IBOutlet UILabel* statusLabel;

}

//@property (nonatomic, retain) IBOutlet UIButton* loginButton;
//@property (nonatomic, retain) IBOutlet UIButton* logoutButton;
//@property (nonatomic, retain) IBOutlet UILabel* statusLabel;

//- (IBAction)logOutParse:(id)sender;

@end
