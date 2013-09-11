//
//  ParseBridgeLoginVC.m
//  ParseBridge
//
//  Created by Spencer Barron on 9/5/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import "ParseBridgeLoginVC.h"
#import "ParseBridgeSignUpVC.h"

@interface ParseBridgeLoginVC ()

@end

@implementation ParseBridgeLoginVC

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

- (IBAction)showRegisterParse:(id)sender{
	NSLog(@"Show Register");
	ParseBridgeSignUpVC* registerVC = [[ParseBridgeSignUpVC alloc]initWithNibName:@"ParseBridgeSignUpVC" bundle:nil];
	
	registerVC.delegate = self.delegate;
	[self.navigationController pushViewController:registerVC animated:YES];
}

- (IBAction)loginWithFacebook:(id)sender{
	
	/*
	 ParseFacebookUtils.logIn(this, new LogInCallback() {
	 @Override
	 public void done(ParseUser user, ParseException err) {
	 if (user == null) {
	 Log.d("MyApp", "Uh oh. The user cancelled the Facebook login.");
	 } else if (user.isNew()) {
	 Log.d("MyApp", "User signed up and logged in through Facebook!");
	 } else {
	 Log.d("MyApp", "User logged in through Facebook!");
	 }
	 }
	 });

	*/
#ifdef ANDROID

		AndroidActivity *activity = [[AndroidActivity currentActivity] autorelease];
		MyLogInCallback* loginCallback = [[MyLogInCallback callbackWithHandler:^(ParseUser* user, ParseException* ex){
			if(user != nil && ex == nil){
				NSLog(@"User is %@", user);
				NSLog(@"Hooray! %@ is logged in.", [user getUsername]);
				[self logInSuccessful];
			}
			else{
				NSLog(@"Facebook Login failed with error. %@", ex);
				
				UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Login Failed"
																message:[ex getMessage]
															   delegate:nil
													  cancelButtonTitle:@"OK"
													  otherButtonTitles:nil];
				[alert show];
				[alert release];
				
			}	
		}] retain];
		NSLog(@"Login Facebook");
		[ParseFacebookUtils logIn:activity:loginCallback];
	
#else

#endif
}

- (IBAction)loginWithTwitter:(id)sender{
	NSLog(@"Login Twitter");
}

- (IBAction)loginParse:(id)sender{
	NSLog(@"Login user with Parse");
	BOOL valid = [self validateLoginInfo];

	#ifdef ANDROID
	if(valid){
		MyLogInCallback* loginCallback = [[MyLogInCallback callbackWithHandler:^(ParseUser* user, ParseException* ex){
			if(user != nil && ex == nil){
				NSLog(@"User is %@", user);
				NSLog(@"Hooray! %@ is logged in.", [user getUsername]);
				[self logInSuccessful];
			}
			else{
				NSLog(@"Login failed with error. %@", ex);
				
				password.text = @"";
				
				UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Login Failed"
																message:[ex getMessage]
															   delegate:nil
													  cancelButtonTitle:@"OK"
													  otherButtonTitles:nil];
				[alert show];
				[alert release];

			}
			
			
		}] retain];
		[ParseUser logInInBackground:userName.text password:password.text callback:loginCallback];
	}
	#else
	if(valid){
	[PFUser logInWithUsernameInBackground:userName.text password:password.text  block:^(PFUser *user, NSError *error){
		if (user) {
			// Do stuff after successful login.
			[self logInSuccessful];
		} else {
			// The login failed. Check error to see why.
			NSLog(@"Error! %@", error);
			[self logInFailed:error];
		
		}
	}];
	}
	#endif
}

-(BOOL)validateLoginInfo{
	
	if(userName.text && password.text && userName.text.length > 0 && password.text.length > 0){
		return YES;
	}
	
	[[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Missing Information", nil) message:NSLocalizedString(@"Make sure you fill out all of the information!", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil] show];
	return NO;
	
}

-(void)logInSuccessful{
	//stop animating
	if(activityIndicator){
		[activityIndicator stopAnimating];
	}
	UINavigationController* viewController = (UINavigationController*)[self getRootViewController];
	[viewController popToRootViewControllerAnimated:YES];
	
	if ([self.delegate respondsToSelector:@selector(loginCompleted)]){
		[self.delegate loginCompleted];
	}
}

-(void)logInFailed:(NSError*)error{
	//Show alert
	userName.text = @"";
	password.text = @"";
	
	if(error.code == 101){
		[[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Login Failed!", nil) message:NSLocalizedString(@"Login Failed. Please Verify your user name and password and try again!", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil] show];
	}
	else{
		[[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Login Failed!", nil) message:NSLocalizedString(@"Error!", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil] show];
	}

}

-(UIViewController*) getRootViewController
{
	return [UIApplication sharedApplication].keyWindow.rootViewController;
}

@end
