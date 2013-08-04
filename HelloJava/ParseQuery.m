//
//  ParseQuery.m
//  HelloJava
//
//  Created by Spencer Barron on 7/21/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import "ParseQuery.h"

@implementation ParseQuery

+ (void)initializeJava
{
    // Note: this must be called for any class that registers custom
    // java apis, without this call the inheritance may not work as expected
    [super initializeJava];
	NSLog(@"ParseQuery bridge init");
	
	[ParseQuery registerConstructorWithSelector:@selector(initUser)
									 arguments:nil];
	
    [ParseQuery registerStaticMethod:@"getCurrentUser"
						   selector:@selector(currentUser)
						returnValue:[ParseUser className]
						  arguments:nil];
	
	[ParseQuery registerStaticMethod:@"logOut"
						   selector:@selector(logOut)
						returnValue:nil
						  arguments:nil];
	
	
	NSLog(@"ParseUser.h associated with %@", [[ParseUser javaClass] className]);
}

+ (NSString *)className
{
    return @"com.parse.ParseQuery";
}




@end
