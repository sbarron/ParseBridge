//
//  ParseException.m
//  FishBalls
//
//  Created by Spencer Barron on 7/9/13.
//  Copyright (c) 2013 Spencer Barron. All rights reserved.
//

#import "ParseException.h"
#import <BridgeKit/JavaNumbers.h>

@implementation ParseException


//ParseException(int theCode, String theMessage)
//Construct a new ParseException with a particular error code.

+(void)initializeJava
{
    // Note: this must be called for any class that registers custom
    // java apis, without this call the inheritance may not work as expected
    [super initializeJava];
	
	[ParseException registerConstructorWithSelector:@selector(initParseException:message:)
										 arguments:[JavaClass intPrimitive], [NSString className], nil];
	
	//-(void)initParseException:(int)errorcode:(NSString*)message;
	//-(int)getCode;

//+ (BOOL)registerInstanceMethod:(NSString *)javaMethodName selector:(SEL)selector returnValue:(NSString *)returnValue
//	[ParseException registerInstanceMethod:@"getCode"
	//							 selector:@selector(getCode)
	//							returnValue:[JavaInteger classname], NULL];
	
}

+(NSString *)className
{
    return @"com.parse.ParseException";
}


@end
