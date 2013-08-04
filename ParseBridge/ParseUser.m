//
//  ParseBridge.m
//  Created by Spencer Barron on 7/6/13.


#import "ParseUser.h"

@implementation ParseUser

// Any objc properties that are declared should declare dynamic,
// else automatic property sythesis will override the bridge registrations
//@dynamic intValue;

+ (void)initializeJava
{
    // Note: this must be called for any class that registers custom
    // java apis, without this call the inheritance may not work as expected
    [super initializeJava];
	NSLog(@"ParseUser bridge init");
	
	[ParseUser registerConstructorWithSelector:@selector(initUser)
                                       arguments:nil];
	
    [ParseUser registerStaticMethod:@"getCurrentUser"
						selector:@selector(currentUser)
					 returnValue:[ParseUser className]
					   arguments:nil];

	[ParseUser registerStaticMethod:@"logOut"
								 selector:@selector(logOut)
								 returnValue:nil
					   arguments:nil];
					   
					   
	 NSLog(@"ParseUser.h associated with %@", [[ParseUser javaClass] className]);
}

+ (NSString *)className
{
    return @"com.parse.ParseUser";
}



@end
