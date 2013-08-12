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
	//Constructors
	//*- Java: ParseException(int theCode, String theMessage)
	//*- Objective C:
	//Construct a new ParseException with a particular error code.
	[ParseException registerConstructorWithSelector:@selector(initParseException:message:)
										  arguments:[JavaClass intPrimitive], [NSString className], nil];
	
	//*- Java:ParseException(String message, Throwable cause)
	//*- Objective C:
	//Construct a new ParseException with an external cause.
	
	//*- Java:ParseException(Throwable cause)
	//*- Objective C:
	//Construct a new ParseException with an external cause.
	
	
	
	//Methods
	//*- Java:int getCode()
	//*- Objective C:
	//Access the code for this error.
	
 
}

+(NSString *)className
{
    return @"com.parse.ParseException";
}


@end
