//
//  ParseBridgeSignUpVC.m
//  ParseBridge
//
//  Created by Spencer Barron on 9/5/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import "ParseBridgeSignUpVC.h"

@interface ParseBridgeSignUpVC ()

@end

@implementation ParseBridgeSignUpVC

@synthesize facebookPermissions;
#ifdef ANDROID
@synthesize signupCallback;
#endif

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		activityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    }
    return self;
}

-(void)dealloc{
	
#ifdef ANDROID
	if(signupCallback != nil){
		[signupCallback release];
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


- (IBAction)loginWithFacebook:(id)sender{
	NSLog(@"Login Facebook");
}
- (IBAction)loginWithTwitter:(id)sender{
	NSLog(@"Login Twitter");
}

- (IBAction)registerAccount:(id)sender{
 NSLog(@"Show registration view controller");
 NSLog(@"Register user with Parse");
 BOOL valid = [self validateRegisterInfo];
 if(valid){
 //Java Example
 /*
 ParseUser user = new ParseUser();
 user.setUsername("my name");
 user.setPassword("my pass");
 user.setEmail("email@example.com");
 
 // other fields can be set just like with ParseObject
 user.put("phone", "650-253-0000");
 
 user.signUpInBackground(new SignUpCallback() {
 public void done(ParseException e) {
 if (e == null) {
 // Hooray! Let them use the app now.
 } else {
 // Sign up didn't succeed. Look at the ParseException
 // to figure out what went wrong
 }
 }
 });*/
  //callbackWithHandler:(void (^)(ParseUser *, ParseException *)handler
#ifdef ANDROID
		ParseUser* user = [[[ParseUser alloc]initUser] autorelease];
		[user setEmail:email.text];
		[user setPassword:password.text];
		[user setUsername:userName.text];
		[activityIndicator startAnimating];
		MySignUpCallback* signUpCallback = [[MySignUpCallback callbackWithHandler:^(ParseException* ex){
			if(ex){
				NSLog(@"Signup error. %@", ex);
			}
			else{
				NSLog(@"User signed in");
				[self logInSuccessful];
			}
		}] retain];
		
		[user signUpInBackground:signUpCallback];
#else
	 PFUser *user = [PFUser user];
	 user.username = userName.text;
	 user.password = password.text;
	 user.email = email.text;
	 [activityIndicator startAnimating];
	 [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
		 if (!error) {
			 // Hooray! Let them use the app now.
			 NSLog(@"Registered new user & signed in");
			 [self registerSuccessful];
		 } else {
			 NSString *errorString = [[error userInfo] objectForKey:@"error"];
			 // Show the errorString somewhere and let the user try again.
			 NSLog(@"Error - %@", errorString);
		 }
	 }];
#endif
 }
}

-(UIViewController*) getRootViewController
{
	return [UIApplication sharedApplication].keyWindow.rootViewController;
}

-(BOOL)validateRegisterInfo{
	if(userName.text && password.text && email.text &&
			userName.text.length > 0 &&
			password.text.length > 0 &&
				email.text.length > 0){
					return YES;
	}
						 
	[[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Missing Information", nil) message:NSLocalizedString(@"Make sure you fill out all of the information!", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil] show];
						 return NO;
						 
}

-(void)registerSuccessful{
	//stop animating
	if(activityIndicator){
		[activityIndicator stopAnimating];
	}
	UINavigationController* viewController = (UINavigationController*)[self getRootViewController];
	[viewController popToRootViewControllerAnimated:YES];
	
	if ([self.delegate respondsToSelector:@selector(registrationCompleted)]){
		[self.delegate registrationCompleted];
	}
	else{
		NSLog(@"delegate not responding");
	}
}

-(void)registerFailed:(NSError*)error{
	//Show alert
	userName.text = @"";
	password.text = @"";
	email.text = @"";
	
	if(error.code == 101){
		[[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Registration Failed!", nil) message:NSLocalizedString(@"Registration Failed.", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil] show];
	}
	else{
		[[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Registration Failed!", nil) message:NSLocalizedString(@"Error!", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil] show];
	}
	
}

@end
