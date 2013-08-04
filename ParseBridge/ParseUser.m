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
					   
    [ParseUser registerInstanceMethod:@"put"
                               selector:@selector(forKey:setObject:)
                            returnValue:nil
                              arguments:[NSString className],[JavaObject className],nil];

    [ParseUser registerInstanceMethod:@"isAuthenticated"
                               selector:@selector(isAuthenticated)
                            returnValue:[JavaClass boolPrimitive]
                              arguments:nil];

    [ParseUser registerInstanceMethod:@"saveInBackground"
                               selector:@selector(saveInBackground)
                            returnValue:nil];

    [ParseUser registerStaticMethod:@"enableAutomaticUser"
                           selector:@selector(enableAutomaticUser)
                        returnValue:nil
                          arguments:nil];

    NSLog(@"ParseUser.h associated with %@", [[ParseUser javaClass] className]);
}


/*
 PFUser
 + currentUser

 //public boolean isAuthenticated()
 - (BOOL)isAuthenticated

 //public static void enableAutomaticUser()
 + enableAutomaticUser
 
 //public final void saveInBackground()
 - saveInBackground
 
 //public void put(String key, Object value)
 - setObject:(id) forKey:(NSString*)
 */

+ (NSString *)className
{
    return @"com.parse.ParseUser";
}

@end
