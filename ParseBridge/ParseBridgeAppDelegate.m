//
//  ParseBridgeAppDelegate.m
//  ParseBridge
//
//  Created by Spencer Barron on 8/6/13.
//  Copyright (c) 2013 Spencer Barron. All rights reserved.
//

#import "ParseBridgeAppDelegate.h"
#ifdef ANDROID
#import "Parse.h"
#import "ParseUser.h"
#import "ParseAnalytics.h"
#import "ParseFacebookUtils.h"
#import "ParseObject.h"
#import "ParseManager.h"
#import <BridgeKit/AndroidActivity.h>
#import <BridgeKit/AndroidIntent.h>
#else
#import <Parse/Parse.h>
#endif
#import <FacebookSDK/FacebookSDK.h>

#define PARSE_APPLICATION_ID     @"mANv6XA4LjD2mCEWqCI57Y1EiMUhwTZ2ljohI1oj"
#define PARSE_CLIENT_KEY		 @"9k2ANcaIUf5m9lgzwNzvQdGdqnLid8b5P7RYOXKd"


@implementation ParseBridgeAppDelegate

- (void)dealloc
{
	[_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
#ifdef APPORTABLE
    NSString *result = @"Hello Android!!";
	
#else
    NSString *result = @"Hello iOS!";
#endif
	
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"BridgeKitDemo"
                                                    message:result
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    [alert release];
	
	[self initializeParse:launchOptions];
	
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)runParseTest{
#ifdef ANDROID
    NSLog(@"Parse Android - Create Test Object");
	
    ParseObject *testObject = [[ParseObject alloc] initParseObject:@"TestObject"];
	
    NSLog(@"Test Object: %@", testObject);
    
    [testObject forKey:@"foo" setObject:@"Androidbar"];
    [testObject saveInBackground];
	
    NSLog(@"Parse Android - TestObject Saved %@", testObject);
#else
    NSLog(@"Parse Android - Running Parse Object Test iOS");
    
    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    [testObject setObject:@"foo" forKey:@"iOSbar"];
    [testObject saveInBackground];
#endif
}

-(void)initializeParse:(NSDictionary *)launchOptions{
#ifdef ANDROID
    NSLog(@"Parse Android - Starting Parse init from ParseBridgeAppDelegate");
    AndroidActivity *activity = [[AndroidActivity currentActivity] autorelease];
    
    [Parse init:activity applicationId:PARSE_APPLICATION_ID clientKey:PARSE_CLIENT_KEY];
	
    NSLog(@"Parse Android - Finished Android Init");
	
    [self runParseTest];
	
#else
	
    [Parse setApplicationId:PARSE_APPLICATION_ID
                  clientKey:PARSE_CLIENT_KEY];
    
    [self runParseTest];
#endif

	[self startAnalytics:launchOptions];
}

-(void)startAnalytics:(NSDictionary*)launchOptions{
#ifdef ANDROID
    NSLog(@"ParseAnalytics");
	//AndroidIntent *intent = [AndroidIntent intentWithClassName:@"SpencerBarron.ParseBridge"];
	
	[ParseAnalytics trackAppOpened:nil]; //NOT WORKING
  
#else
	[PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
#endif
}

#ifdef ANDROID
- (BOOL) canBecomeFirstResponder
{
	return YES;
}

- (void)buttonUpWithEvent:(UIEvent *)event
{
    switch (event.buttonCode)
    {
        case UIEventButtonCodeBack:
            // handle back button if possible, otherwise exit(0)
            exit(0);
            break;
        case UIEventButtonCodeMenu:
            // show menu if possible.
            break;
        default:
            break;
    }
}
#endif


- (void)applicationWillResignActive:(UIApplication *)application
{
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end