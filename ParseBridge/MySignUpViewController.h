//
//  MySignUpViewController.h
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

@interface MySignUpViewController : PFSignUpViewController

@end
