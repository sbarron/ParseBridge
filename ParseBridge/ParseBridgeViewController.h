//
//  ParseBridgeViewController.h
//  ParseBridge
//
//  Created by Spencer Barron on 8/28/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ParseBridgeViewController : UIViewController{

		IBOutlet UIButton* loginButton;
		
		UIButton* loginButton2;
		UIButton* loginButton3;
		
		IBOutlet UILabel* resultsLabel;

}

@property (nonatomic, retain) IBOutlet UIButton* loginButton;
@property (nonatomic, retain) IBOutlet UILabel* resultsLabel;

- (IBAction)loginToParse:(id)sender;

@end
