//
//  ParseBridgeVC.m
//  ParseBridge
//
//  Created by Spencer Barron on 9/5/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import "ParseBridgeVC.h"

@interface ParseBridgeVC ()

@end

@implementation ParseBridgeVC

@synthesize loginButton,logoutButton,statusLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

#ifdef ANDROID
	if([ParseUser currentUser]){
		[self statusLabelUpdate];
	}
#else
	if([PFUser currentUser]){
		[self statusLabelUpdate];
	}
#endif
 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)showLoginParse:(id)sender{
	NSLog(@"Show login");
	ParseBridgeLoginVC* loginVC = [[ParseBridgeLoginVC alloc]initWithNibName:@"ParseBridgeLoginVC" bundle:nil];
	loginVC.delegate = self;
	[self.navigationController pushViewController:loginVC animated:YES];
}

- (IBAction)logOutParse:(id)sender{
	NSLog(@"Logout Parse");
#ifdef ANDROID
	[ParseUser logOut];
#else
	[PFUser logOut];
#endif
	logoutButton.enabled = NO;
	loginButton.enabled = YES;
	statusLabel.text = @"Not logged in";
}

- (void)loginCompleted{
	NSLog(@"Login Completed!");
	[self statusLabelUpdate];
}

- (void)registrationCompleted{
	NSLog(@"Registration Completed!");
	[self statusLabelUpdate];
}

-(void)statusLabelUpdate{
#ifdef ANDROID
	NSString* name = [[ParseUser currentUser] getUsername];
#else
	NSString* name = [PFUser currentUser].username;
#endif
	statusLabel.text = [NSString stringWithFormat:@"Logged in as %@", name ]; 
	
	logoutButton.enabled = YES;
	loginButton.enabled = NO;
}
@end
