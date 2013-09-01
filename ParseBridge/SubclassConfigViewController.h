//
//  SubclassConfigViewController.h
//  LogInAndSignUpDemo
//
//  Created by Mattieu Gamache-Asselin on 6/15/12.
//
#ifdef ANDROID
#import "ParseHeaders.h"
#import "ParseManager.h"
#else
#import <Parse/Parse.h>
#endif

#ifdef ANDROID
@interface SubclassConfigViewController : UIViewController
#else
@interface SubclassConfigViewController : UIViewController <PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate>
#endif
@property (nonatomic, retain) IBOutlet UILabel *welcomeLabel;

- (IBAction)logOutButtonTapAction:(id)sender;
- (IBAction)exitLoginScreen:(id)sender;

@end
