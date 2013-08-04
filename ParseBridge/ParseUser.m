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
	//*- ObjC: + currentUser
    [ParseUser registerStaticMethod:@"getCurrentUser"
						selector:@selector(currentUser)
					 returnValue:[ParseUser className]
					   arguments:nil];

	[ParseUser registerStaticMethod:@"logOut"
								 selector:@selector(logOut)
								 returnValue:nil
					   arguments:nil];
					   
    //*- Java: public void put(String key, Object value)
    //*- ObjC: - setObject:(id) forKey:(NSString*)
    [ParseUser registerInstanceMethod:@"put"
                               selector:@selector(forKey:setObject:)
                            returnValue:nil
                              arguments:[NSString className],[JavaObject className],nil];

    //*- Java: public boolean isAuthenticated()
    //*- ObjC: - (BOOL)isAuthenticated
    [ParseUser registerInstanceMethod:@"isAuthenticated"
                               selector:@selector(isAuthenticated)
                            returnValue:[JavaClass boolPrimitive]
                              arguments:nil];

    //*- Java: public final void saveInBackground()
    //*- ObjC: - saveInBackground
    [ParseUser registerInstanceMethod:@"saveInBackground"
                               selector:@selector(saveInBackground)
                            returnValue:nil];

    //*- Java: public static void enableAutomaticUser()
    //*- ObjC: + enableAutomaticUser
    [ParseUser registerStaticMethod:@"enableAutomaticUser"
                           selector:@selector(enableAutomaticUser)
                        returnValue:nil
                          arguments:nil];

    NSLog(@"ParseUser.h associated with %@", [[ParseUser javaClass] className]);
}

+ (NSString *)className
{
    return @"com.parse.ParseUser";
}

@end
