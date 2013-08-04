//
//  ParseBridge.m
//  ParseBridge
//
//  Created by Spencer Barron on 7/6/13.


#import "ParseUser.h"

@implementation ParseUser

+ (void)initializeJava
{
    [super initializeJava];
	
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
