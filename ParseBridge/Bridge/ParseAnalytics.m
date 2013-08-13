//
//  ParseAnalytics.m
//  Created by Spencer Barron on 7/7/13.

#import "ParseAnalytics.h"
#import <BridgeKit/AndroidIntent.h>

@implementation ParseAnalytics

+ (void)initializeJava
{
    [super initializeJava];

	//Constructor
	//*- Java:  public ParseAnalytics()
	[ParseAnalytics registerConstructor];
	
	//*- Java:  public static void trackAppOpened(Intent intent)
	//*- Objective C:  +(void)trackAppOpenedWithLaunchOptions:(NSDictionary *)launchOptions
	/*-- Tracks this application being launched (and if this happened as the result of the user opening a push notification, this method sends along information to correlate this open with that push).  Parameters: intent - The Intent that started an Activity, if any. Can be null.*/
	[ParseAnalytics registerStaticMethod:@"trackAppOpened"
				   selector:@selector(trackAppOpened:)
				returnValue:nil
				  arguments:[AndroidIntent className], nil];

	 NSLog(@"ParseAnalytics.h associated with %@", [[ParseAnalytics javaClass] className]);
}

+ (NSString *)className
{
    return @"com.parse.ParseAnalytics";
}


@end
