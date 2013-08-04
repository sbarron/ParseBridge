//
//  HelloJavaAppDelegate.m
//  HelloJava
//
//  Created by Collin Jackson on 5/27/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import "HelloJavaAppDelegate.h"
#ifdef ANDROID
#import "HelloBridge.h"
#import "Parse.h"
#import "ParseUser.h"
#import "ParseAnalytics.h"
#import "ParseFacebookUtils.h"
//#import "ParseException.h"
//#import "LogInCallBack.h"
#import "ParseObject.h"
#import "ParseManager.h"
#import <BridgeKit/AndroidActivity.h>
#import <BridgeKit/AndroidIntent.h>
#else 
	#import <Parse/Parse.h>
#endif
#import <FacebookSDK/FacebookSDK.h>

@implementation HelloJavaAppDelegate

- (void)dealloc
{
  [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	[self initializeParse:launchOptions];
#ifdef APPORTABLE
    HelloBridge *bridgeObject = [[HelloBridge alloc] initWithIntValue:42 doubleValue:55.4];
    [bridgeObject setIntValue:99];
    [bridgeObject setDoubleValue:11.44];
    NSString *result = [NSString stringWithFormat:@"Hello Android: %d, %f",
                                                  bridgeObject.intValue, [bridgeObject doubleValue]];

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



    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)runParseTest{
#ifdef ANDROID
	dispatch_async( dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
		// Add code here to do background processing
		NSLog(@"Parse - Running Parse Object Test Android");
		
		//Attempt to initialize Facebook - This should fail
		[ParseFacebookUtils initializeFacebook:@"11111111111111"];


		ParseObject* testObject = [[ParseObject alloc] initParseObject:@"TestObject"];
		[testObject put:@"foo" :@"Androidbar"];
		[testObject saveInBackground];
		NSLog(@"Parse - TestObject %@", testObject);
		dispatch_async( dispatch_get_main_queue(), ^{
			// Add code here to update the UI/send notifications based on the
			// results of the background processing
			NSLog(@"Parse test ran");
		});
	});
#else
	dispatch_async( dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
		// Add code here to do background processing
		NSLog(@"Parse - Running Parse Object Test iOS");
		
		PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
		[testObject setObject:@"foo" forKey:@"iOSbar"];
		[testObject saveInBackground];
		
		dispatch_async( dispatch_get_main_queue(), ^{
			// Add code here to update the UI/send notifications based on the
			// results of the background processing
			NSLog(@"Parse test ran");
		});
	});

#endif
}

-(void)initializeParse:(NSDictionary *)launchOptions{
#ifdef ANDROID
	
	dispatch_async( dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
		// Add code here to do background processing
		NSLog(@"Starting Parse init from appdelegate");
		AndroidActivity *activity = [[AndroidActivity currentActivity] autorelease];
		
		[Parse init:activity applicationId:@"mANv6XA4LjD2mCEWqCI57Y1EiMUhwTZ2ljohI1oj" clientKey:@"9k2ANcaIUf5m9lgzwNzvQdGdqnLid8b5P7RYOXKd"];
	
		 
		AndroidIntent *intent = [AndroidIntent new];
		[ParseAnalytics trackAppOpened:intent];
		
		dispatch_async( dispatch_get_main_queue(), ^{
			NSLog(@"Parse init attempt completed");
				[self runParseTest];
		});
	});
	
#else

	dispatch_async( dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
		// Add code here to do background processing
		[Parse setApplicationId:@"mANv6XA4LjD2mCEWqCI57Y1EiMUhwTZ2ljohI1oj"
					  clientKey:@"9k2ANcaIUf5m9lgzwNzvQdGdqnLid8b5P7RYOXKd"];
					  
		[PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
		//[PFFacebookUtils initializeFacebook];
		dispatch_async( dispatch_get_main_queue(), ^{

			[self runParseTest];
			
		});
	});
	
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
