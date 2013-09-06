//
//  ParseBridgeAppDelegate.m
//  ParseBridge
//
//  Created by Spencer Barron on 8/6/13.
//  Copyright (c) 2013 Spencer Barron. All rights reserved.
//

#import "ParseBridgeAppDelegate.h"
#import "ParseBridgeVC.h"
#ifdef ANDROID
#import "ParseHeaders.h"
#import "ParseManager.h"
#import <BridgeKit/AndroidActivity.h>
#import <BridgeKit/AndroidIntent.h>
//#import <BridgeKit/AndroidContext.h>
#else
#import <Parse/Parse.h>
#endif

#import <FacebookSDK/FacebookSDK.h>

#define PARSE_APPLICATION_ID     @"mANv6XA4LjD2mCEWqCI57Y1EiMUhwTZ2ljohI1oj"
#define PARSE_CLIENT_KEY		 @"9k2ANcaIUf5m9lgzwNzvQdGdqnLid8b5P7RYOXKd"


@implementation ParseBridgeAppDelegate

@synthesize window = _window;

- (void)dealloc
{
	[_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
#ifdef APPORTABLE
	[UIScreen mainScreen].currentMode =
	[UIScreenMode emulatedMode:UIScreenBestEmulatedMode];
	
    NSString *result = @"Hello Android!!";
	[self initializeParse:launchOptions];
#else
    NSString *result = @"Hello iOS!";
	[self initializeParse:launchOptions];
#endif
	
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor clearColor];
	
	ParseBridgeVC* myViewController = [[ParseBridgeVC alloc]initWithNibName:@"ParseBridgeVC" bundle:nil];
	//ParseBridgeViewController* myViewController = [[ParseBridgeViewController alloc]initWithNibName:@"ParseBridgeViewController" bundle:nil];
	
	//UIViewController* myViewController = [[UIViewController alloc]init];
	
	self.navController = [[UINavigationController alloc] initWithRootViewController:myViewController];
	self.navController.title = @"ParseBridge";
	
	self.window.rootViewController = self.navController;
	
    [self.window makeKeyAndVisible];
	
	
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"BridgeKitDemo"
                                                    message:result
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    [alert release];
	
	
    return YES;
}

-(void)initializeParse:(NSDictionary *)launchOptions{
#ifdef ANDROID
    DLog(@"Parse Android - Starting Parse init from ParseBridgeAppDelegate");
    AndroidActivity *activity = [[AndroidActivity currentActivity] autorelease];
    
    [Parse init:activity applicationId:PARSE_APPLICATION_ID clientKey:PARSE_CLIENT_KEY];
	
	//[self registerMethodsTest];
	[self runParseTest];
	
	//ParseACL defaultACL = new ParseACL();
	// Optionally enable public read access while disabling public write access.
	// defaultACL.setPublicReadAccess(true);
	//ParseACL.setDefaultACL(defaultACL, true);
	
	[self startPushNotifications:activity];
	//[self startAnalytics:launchOptions];
	
#else
	
    [Parse setApplicationId:PARSE_APPLICATION_ID
                  clientKey:PARSE_CLIENT_KEY];
				
	//[PFFacebookUtils initializeFacebook];
	//[PFTwitterUtils initializeWithConsumerKey:@"your_twitter_consumer_key" consumerSecret:@"your_twitter_consumer_secret"];
	
	// Set default ACLs
    PFACL *defaultACL = [PFACL ACL];
    [defaultACL setPublicReadAccess:YES];
    [PFACL setDefaultACL:defaultACL withAccessForCurrentUser:YES];
    
	//[self runParseTest];
	[self startPushNotifications];
	[self startAnalytics:launchOptions];
    
#endif
 
}

-(void)runParseTest{
#ifdef ANDROID
    DLog(@"Parse Android - Create Test Object");
	
    ParseObject *testObject = [[ParseObject alloc] initParseObject:@"TestObject"];
	
    DLog(@"Test Object: %@", testObject);
    
    [testObject forKey:@"foo" setObject:@"Androidbar"];
    [testObject saveInBackground];
	
    DLog(@"Parse Android - TestObject Saved %@", testObject);
#else
    DLog(@"Parse Android - Running Parse Object Test iOS");
    
    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    [testObject setObject:@"foo" forKey:@"iOSbar"];
    [testObject saveInBackground];
#endif
}



-(void)startAnalytics:(NSDictionary*)launchOptions{
#ifdef ANDROID
    DLog(@"ParseAnalytics");

	[ParseAnalytics trackAppOpened:nil]; //NOT WORKING
  
#else
	[PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
#endif
}


#ifdef ANDROID
-(void)startPushNotifications:(AndroidActivity*)activity{
	DLog(@"Push Notifications initialized - Activity = %@", activity);
	
	//PushService.subscribe(context, "the_channel_name", YourActivity.class);
	[PushService subscribe:activity channel:@"DEFAULT" activitySubClass:[activity javaClass]];

	//ParseInstallation.getCurrentInstallation().saveInBackground();
	[[ParseInstallation getCurrentInstallation] saveInBackground];
	DLog(@"Installation subscriptions = %@", [PushService getSubscriptions:activity]);

#else
-(void)startPushNotifications{
	 //Requires setup in iTunesConnect
#endif
}

-(void)registerMethodsTest{
#ifdef ANDROID

	[Parse initializeJava];
	[ParseACL initializeJava];
	[ParseQuery initializeJava];
	[ParseObject initializeJava];
	[ParseUser initializeJava];
	[ParseRole initializeJava];
	[ParseAnalytics initializeJava];
	[ParseFacebookUtils initializeJava];
	[ParseException initializeJava];
	[ParseGeoPoint initializeJava];
	[ParseTwitterUtils initializeJava];
	[ParseFile initializeJava];
	[ParseInstallation initializeJava];
	[ParsePush initializeJava];
	[PushService initializeJava];
	[ParseRelation initializeJava];
	[ParseAnonymousUtils initializeJava];
	[ParseCloud initializeJava];
	[ParseImageView initializeJava];
	[SaveCallback initializeJava];
	[MyLogInCallback initializeJava];
	[DeleteCallback initializeJava];
	[StandardPushCallback initializeJava];
	[SignUpCallback initializeJava];
	[SendCallback initializeJava];
	[RequestPasswordResetCallback initializeJava];
	[RefreshCallback initializeJava];
	[PushCallback initializeJava];
	[ProgressCallback initializeJava];
	[LocationCallback initializeJava];
	[GetDataCallback initializeJava];
	[FunctionCallback initializeJava];
	[FindCallback initializeJava];
	[CountCallback initializeJava];
	
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
	//[FBSession.activeSession handleDidBecomeActive];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#ifdef ANDROID
#else
	// Facebook oauth callback
	- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
		return [PFFacebookUtils handleOpenURL:url];
	}
	
	- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url
sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [PFFacebookUtils handleOpenURL:url];
}
#endif	

@end