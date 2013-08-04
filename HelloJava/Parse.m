//
//  Parse.m
//  FishBalls
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
    // Note: this must be called for any class that registers custom
    // java apis, without this call the inheritance may not work as expected
    
	[Parse registerStaticMethod:@"initialize"	
					   selector:@selector(init:applicationId:clientKey:)
					returnValue:nil
					  arguments:[AndroidContext className],[NSString className],[NSString className], nil];
					  				   
	NSLog(@"Parse.h associated with %@", [[Parse javaClass] className]);
}


+ (NSString *)className
{
    return @"com.parse.Parse";
}

@end
