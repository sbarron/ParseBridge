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

	[ParseFacebookUtils registerStaticMethod:@"initialize"
								selector:@selector(initializeFacebook:)
							 returnValue:nil
							   arguments:[NSString className], NULL];
				
	[ParseFacebookUtils registerStaticMethod:@"isLinked"
									selector:@selector(isLinkedWithUser:)
								 returnValue:[JavaClass boolPrimitive]
								   arguments:[ParseUser className], NULL];
	
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

/*
 
 PFFacebookUtils
 //*- public static void initialize(String appId)
 + initializeFacebook

 + isLinkedWithUser:(PFUser*)
 
 //*- public static void link(ParseUser user, Collection<String> permissions, Activity activity, SaveCallback callback)
 + linkUser:(PFUser*) permissions:(NSSArray*) block:(BOOL succeeded, NSError *error)
 */


+ (NSString *)className
{
    return @"com.parse.ParseFacebookUtils";
}


@end
