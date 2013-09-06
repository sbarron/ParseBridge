//
//  MyBasicLoginViewController.m
//  ParseBridge
//
//  Created by Spencer Barron on 8/30/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import "MyBasicLoginViewController.h"

@interface MyBasicLoginViewController()

@end

@implementation MyBasicLoginViewController

@synthesize facebookPermissions;
#ifdef ANDROID
@synthesize loginCallback;
#endif

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(void)dealloc{

#ifdef ANDROID
	if(loginCallback != nil){
		[loginCallback release];
	}
#endif
	[super dealloc];
	
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
	facebookPermissions = @[@"friends_about_me"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
- (IBAction)loginWithFacebook:(id)sender{
	NSLog(@"Login Facebook");
}
- (IBAction)loginWithTwitter:(id)sender{
	NSLog(@"Login Twitter");
}
- (IBAction)registerAccount:(id)sender{
	NSLog(@"Show registration view controller");
}

- (IBAction)loginParse:(id)sender{
	NSLog(@"Login user with Parse");
	BOOL valid = [self validateLoginInfo];
	if(valid){
	#ifdef ANDROID
		MyLogInCallback* loginCallback = [[MyLogInCallback callbackWithHandler:^(ParseUser* user, ParseException* ex){
				if(user != NULL){
					NSLog(@"User is %@", user);
					NSLog(@"Hooray! %@ is logged in.", [user getUsername]);
				}
				else{
					NSLog(@"Signup failed with error. %@", ex);
				}
		}] retain];
		[ParseUser logInInBackground:userName.text password:password.text callback:loginCallback];
	}
	#else
		[PFUser logInWithUsernameInBackground:userName.text password:password.text  block:^(PFUser *user, NSError *error) {
					if (user) {
							// Do stuff after successful login.
					} else {
							// The login failed. Check error to see why.
					}
			}];
	#endif
}

-(BOOL)validateLoginInfo{

	if(userName.text && password.text && userName.text.length > 0 && password.text.length > 0){
		return YES;
	}
	
	[[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Missing Information", nil) message:NSLocalizedString(@"Make sure you fill out all of the information!", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil] show];
		return NO;
		
}
*/
@end
