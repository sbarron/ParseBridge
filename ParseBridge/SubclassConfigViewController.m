//
//  SubclassConfigViewController.m
//  LogInAndSignUpDemo
//
//  Created by Mattieu Gamache-Asselin on 6/15/12.
//

#import "SubclassConfigViewController.h"

#ifdef ANDROID
#import "MyBasicLoginViewController.h"
#import "ParseHeaders.h"
#import "ParseManager.h"
#else
#import "MyLogInViewController.h"
#import "MySignUpViewController.h"
#endif


@implementation SubclassConfigViewController

@synthesize welcomeLabel;

#pragma mark - UIViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
	
#ifdef ANDROID
	NSLog(@"SubclassConfigViewController - viewWillAppear");
	if ([ParseUser currentUser] != nil) {
        self.welcomeLabel.text = (@"Welcome %@!", [[ParseUser currentUser] getUsername]);
    } else {
        self.welcomeLabel.text = @"Not logged in";
    }
#else
	NSLog(@"SubclassConfigViewController - viewWillAppear");
    if ([PFUser currentUser]) {
        self.welcomeLabel.text = [NSString stringWithFormat:NSLocalizedString(@"Welcome %@!", nil), [[PFUser currentUser] username]];
    } else {
        self.welcomeLabel.text = NSLocalizedString(@"Not logged in", nil);
    }
#endif
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // Check if user is logged in
#ifdef ANDROID
	NSLog(@"SubclassConfigViewController - viewDidAppear");
	NSLog(@"ParseUser currentUser = %@", [ParseUser currentUser]);
	if (![ParseUser currentUser]) {
        // Customize the Log In View Controller
        MyBasicLoginViewController *logInViewController =  [[MyBasicLoginViewController alloc] initWithNibName:@"MyBasicLoginViewController" bundle:nil];
        
        logInViewController.facebookPermissions = @[@"friends_about_me"];
        
        // Customize the Sign Up View Controller
		/*
        MySignUpViewController *signUpViewController = [[MySignUpViewController alloc] init];
        signUpViewController.delegate = self;
        signUpViewController.fields = PFSignUpFieldsDefault | PFSignUpFieldsAdditional;
        logInViewController.signUpController = signUpViewController;
        
        // Present Log In View Controller
        [self presentViewController:logInViewController animated:YES completion:NULL];
		*/
		[self presentViewController:logInViewController animated:YES completion:NULL];
    }
	
#else
	if (![PFUser currentUser]) {
        // Customize the Log In View Controller
        MyLogInViewController *logInViewController = [[MyLogInViewController alloc] init];
        logInViewController.delegate = self;
        logInViewController.facebookPermissions = @[@"friends_about_me"];
        logInViewController.fields = PFLogInFieldsUsernameAndPassword | PFLogInFieldsTwitter | PFLogInFieldsFacebook | PFLogInFieldsSignUpButton | PFLogInFieldsDismissButton;
        
        // Customize the Sign Up View Controller
        MySignUpViewController *signUpViewController = [[MySignUpViewController alloc] init];
        signUpViewController.delegate = self;
        signUpViewController.fields = PFSignUpFieldsDefault | PFSignUpFieldsAdditional;
        logInViewController.signUpController = signUpViewController;
        
        // Present Log In View Controller
        [self presentViewController:logInViewController animated:YES completion:NULL];
    }
#endif
}


#pragma mark - PFLogInViewControllerDelegate
#ifdef ANDROID
#else
// Sent to the delegate to determine whether the log in request should be submitted to the server.
- (BOOL)logInViewController:(PFLogInViewController *)logInController shouldBeginLogInWithUsername:(NSString *)username password:(NSString *)password {
    if (username && password && username.length && password.length) {
        return YES;
    }
    
    [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Missing Information", nil) message:NSLocalizedString(@"Make sure you fill out all of the information!", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil] show];
    return NO;
}

// Sent to the delegate when a PFUser is logged in.
- (void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

// Sent to the delegate when the log in attempt fails.
- (void)logInViewController:(PFLogInViewController *)logInController didFailToLogInWithError:(NSError *)error {
    NSLog(@"Failed to log in...");
}

// Sent to the delegate when the log in screen is dismissed.
- (void)logInViewControllerDidCancelLogIn:(PFLogInViewController *)logInController {
    [self.navigationController popViewControllerAnimated:YES];
}
#endif

#pragma mark - PFSignUpViewControllerDelegate
#ifdef ANDROID
#else
// Sent to the delegate to determine whether the sign up request should be submitted to the server.
- (BOOL)signUpViewController:(PFSignUpViewController *)signUpController shouldBeginSignUp:(NSDictionary *)info {
    BOOL informationComplete = YES;
    for (id key in info) {
        NSString *field = [info objectForKey:key];
        if (!field || field.length == 0) {
            informationComplete = NO;
            break;
        }
    }
    
    if (!informationComplete) {
        [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Missing Information", nil) message:NSLocalizedString(@"Make sure you fill out all of the information!", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil] show];
    }
    
    return informationComplete;
}

// Sent to the delegate when a PFUser is signed up.
- (void)signUpViewController:(PFSignUpViewController *)signUpController didSignUpUser:(PFUser *)user {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

// Sent to the delegate when the sign up attempt fails.
- (void)signUpViewController:(PFSignUpViewController *)signUpController didFailToSignUpWithError:(NSError *)error {
    NSLog(@"Failed to sign up...");
}

// Sent to the delegate when the sign up screen is dismissed.
- (void)signUpViewControllerDidCancelSignUp:(PFSignUpViewController *)signUpController {
    NSLog(@"User dismissed the signUpViewController");
}
#endif

#pragma mark - ()

- (IBAction)logOutButtonTapAction:(id)sender {
#ifdef ANDROID
	NSLog(@"Logout User");
    [ParseUser logOut];
	[self dismissModalViewController];
#else
	NSLog(@"Logout User");
    [PFUser logOut];
    //[self.navigationController popViewControllerAnimated:YES];
	[self dismissModalViewController];
#endif
}

- (IBAction)exitLoginScreen:(id)sender {
	NSLog(@"exit login screen");
	[self dismissModalViewController];
}

-(void) dismissModalViewController
{
	UIViewController* rootVC = [self getRootViewController];
	//[rootVC dismissModalViewControllerAnimated:YES];
	[rootVC dismissViewControllerAnimated:YES completion:^{
		NSLog(@"Viewcontroller dismissed");
	}];
	
}

-(UIViewController*) getRootViewController
{
	return [UIApplication sharedApplication].keyWindow.rootViewController;
}

- (void) dealloc
{
	[welcomeLabel release];
    [super dealloc];
}

@end
