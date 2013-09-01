//
//  ParseBridgeViewController.m
//  ParseBridge
//
//  Created by Spencer Barron on 8/28/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import "ParseBridgeViewController.h"
#ifdef ANDROID
#import "ParseHeaders.h"
#import "ParseManager.h"
#else
#import <Parse/Parse.h>
#endif

#import "SubclassConfigViewController.h"
#import <FacebookSDK/FacebookSDK.h>


@interface ParseBridgeViewController ()

@end

@implementation ParseBridgeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
	
		CGSize screenSize =  self.view.frame.size;
		NSLog(@"Width %f x Height %f", screenSize.width, screenSize.height);
		
		// Custom initialization

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)showLoginView{
 
	[self presentViewController:[[SubclassConfigViewController alloc] init]];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginToParse:(id)sender{
	
	NSLog(@"Login To Parse");
	[self showLoginView];
}

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


//Presenting Interfaces
-(UIViewController*) getRootViewController
{
		return [UIApplication sharedApplication].keyWindow.rootViewController;
}
	 
-(void) presentViewController:(UIViewController*)vc
{
		UIViewController* rootVC = [self getRootViewController];
		//[rootVC presentModalViewController:vc animated:YES];
		[rootVC presentViewController:vc animated:YES completion:^{
			NSLog(@"ViewController Presented");
		}];
		
}
	 
-(void) dismissModalViewController
{
		UIViewController* rootVC = [self getRootViewController];
		//[rootVC dismissModalViewControllerAnimated:YES];
		[rootVC dismissViewControllerAnimated:YES completion:^{
			NSLog(@"Viewcontroller dismissed");
		}];
		
}


@end
