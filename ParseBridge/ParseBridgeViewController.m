//
//  ParseBridgeViewController.m
//  ParseBridge
//
//  Created by Spencer Barron on 8/28/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import "ParseBridgeViewController.h"
//#import <FacebookSDK/FacebookSDK.h>

#ifdef ANDROID
#import "ParseHeaders.h"
#import "ParseManager.h"
#else
#import <Parse/Parse.h>
#endif

@interface ParseBridgeViewController ()

@end

@implementation ParseBridgeViewController

//@synthesize statusLabel,logoutButton,loginButton;


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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
	
#ifdef ANDROID
	if ([ParseUser currentUser] != nil) {
        self.statusLabel.text = (@"Welcome %@!", [[ParseUser currentUser] getUsername]);
    } else {
        self.statusLabel.text = @"Not logged in";
    }
#else
    if ([PFUser currentUser]) {
        self.statusLabel.text = [NSString stringWithFormat:NSLocalizedString(@"Welcome %@!", nil), [[PFUser currentUser] username]];
    } else {
        self.statusLabel.text = NSLocalizedString(@"Not logged in", nil);
    }
#endif
}*/
/*
- (IBAction)logOutParse:(id)sender{
#ifdef ANDROID
	NSLog(@"Logout User");
    [ParseUser logOut];
	statusLabel.text = @"Logged out";
#else
	NSLog(@"Logout User");
    [PFUser logOut];
	statusLabel.text = @"Logged out";
#endif
}
*/
/*
- (IBAction)submitRandomScore:(id)sender{
	int scoreToSubmit = (arc4random()%(100-0))+0;
	NSString* myScore = (@"%i",scoreToSubmit);
#ifdef ANDROID
    DLog(@"Parse Android - Create Score");
    ParseObject *score = [[ParseObject alloc] initParseObject:@"GameScore"];
    [score forKey:@"score" setObject:myScore]];
	[score forKey:@"]
    [score saveInBackground];
#else
    DLog(@"Parse Android - Running Parse Object Test iOS");
    
    PFObject *score = [PFObject objectWithClassName:@"TestObject"];
    [score setObject:myScore forKey:@"score"];
    [score saveInBackground];
#endif
}*/



@end
