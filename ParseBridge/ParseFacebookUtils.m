//
//  ParseFacebookUtils.m
//  ParseBridge
//
//  Created by Spencer Barron on 7/7/13.
//  Copyright (c) 2013 Spencer Barron. All rights reserved.
//

#import "ParseFacebookUtils.h"
#import <BridgeKit/AndroidActivity.h>
#import <BridgeKit/JavaList.h>
#import "LogInCallBack.h"

@implementation ParseFacebookUtils

+ (void)initializeJava
{
    [super initializeJava];

    //*- Java; public static void initialize(String appId)
    //*- Objc: + initializeFacebook
	[ParseFacebookUtils registerStaticMethod:@"initialize"
								selector:@selector(initializeFacebook:)
							 returnValue:nil
							   arguments:[NSString className], NULL];

    //*- ObjC: + isLinkedWithUser:(PFUser*)
	[ParseFacebookUtils registerStaticMethod:@"isLinked"
									selector:@selector(isLinkedWithUser:)
								 returnValue:[JavaClass boolPrimitive]
								   arguments:[ParseUser className], NULL];
	
    //*- Java: public static void link(ParseUser user, Collection<String> permissions, Activity activity, SaveCallback callback)
    //*- ObjC: + linkUser:(PFUser*) permissions:(NSSArray*) block:(BOOL succeeded, NSError *error)
    [ParseFacebookUtils registerStaticMethod:@"link"
                                    selector:@selector(linkUser:permissions:block:)
                                 returnValue:nil
                                   arguments:[ParseUser className], [JavaList className], [AndroidActivity className], nil];
    
	[ParseFacebookUtils registerStaticMethod:@"login"
									selector:@selector(logInWithPermissions:)
								 returnValue:nil
								   arguments:[JavaList className], [AndroidActivity className],[LogInCallBack className], NULL];
				
	[ParseFacebookUtils registerCallback:@"bridgeCallback"
						 selector:@selector(logInWithPermissions)
					  returnValue:nil
						arguments:[JavaClass intPrimitive], [JavaClass doublePrimitive], nil];

    NSLog(@"ParseFacebookUtils.h associated with %@", [[ParseFacebookUtils javaClass] className]);
	
}

+ (NSString *)className
{
    return @"com.parse.ParseFacebookUtils";
}


@end
