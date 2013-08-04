//
//  ParseException.m
//  ParseBridge
//
//  Created by Spencer Barron on 7/9/13.
//  Copyright (c) 2013 Spencer Barron. All rights reserved.
//

#import "ParseException.h"
#import <BridgeKit/JavaNumbers.h>

@implementation ParseException


+(void)initializeJava
{
    [super initializeJava];
	
	[ParseException registerConstructorWithSelector:@selector(initParseException:message:)
										 arguments:[JavaClass intPrimitive], [NSString className], nil];
}

+(NSString *)className
{
    return @"com.parse.ParseException";
}


@end
