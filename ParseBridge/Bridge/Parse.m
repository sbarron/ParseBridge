//
//  Parse.m
//  ParseBridge
//
//  Created by Spencer Barron on 7/6/13.
//  Copyright (c) 2013 Spencer Barron. All rights reserved.
//

#import "Parse.h"
#import <BridgeKit/AndroidContext.h>

@implementation Parse

+ (void)initializeJava
{
	NSLog(@"InitializeJava Parse.h bridge");
	[super initializeJava];

    //*- Java: public static void initialize(Context context, String applicationId, String clientKey)
    //*- Objective-C: +(void)init:(AndroidContext*)context applicationId:(NSString *)applicationId clientKey:(NSString *)clientKey;
	[Parse registerStaticMethod:@"initialize"
					   selector:@selector(init:applicationId:clientKey:)
					returnValue:nil
					  arguments:[AndroidContext className],[NSString className],[NSString className], nil];
				
				
	//*- Java: public static void setLogLevel(int logLevel)
	//*- Objective-C:
	
	//*- Java: public static int getLogLevel()
	//*- Objective-C:
					  				   
	NSLog(@"Parse.h associated with %@", [[Parse javaClass] className]);
}


+ (NSString *)className
{
    return @"com.parse.Parse";
}

@end
