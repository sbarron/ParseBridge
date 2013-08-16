//
//  ParseException.m
//  ParseBridge
//
//  Created by Spencer Barron on 7/9/13.
//  Copyright (c) 2013 Spencer Barron. All rights reserved.
//

#import "ParseException.h"
#import <BridgeKit/JavaNumbers.h>
#import <BridgeKit/JavaClass.h>
#import <BridgeKit/JavaThrowable.h>

@implementation ParseException


+(void)initializeJava
{
    [super initializeJava];
	//Constructors
	//*- Java: ParseException(int theCode, String theMessage)
	//*- Objective C: 	-(id)initParseExceptionWithCode:(int)errorcode message:(NSString*)message;
	//Construct a new ParseException with a particular error code.
	BOOL results = FALSE;
	results = [ParseException registerConstructorWithSelector:@selector(initParseExceptionWithCode:message:)
													arguments:[JavaClass intPrimitive], [NSString className], nil];
	NSLog(@"ParseException Registered constructor for initParseExceptionWithCode =  %@", (results ? @"YES" : @"NO"));
	
	//*- Java:ParseException(String message, Throwable cause)
	//*- Objective C:  -(id)initParseExceptionWithMessageandCause:(NSString*)message throwable:(JavaThrowable*)throwable;

	results = [ParseException registerConstructorWithSelector:@selector(initParseExceptionWithMessageandCause:throwable:)
													arguments:[NSString className], [JavaThrowable className], nil];
	NSLog(@"ParseException Registered constructor for initParseExceptionWithMessageandCause =  %@", (results ? @"YES" : @"NO"));
	//*- Objective C:

	//Construct a new ParseException with an external cause.
	
	//*- Java:ParseException(Throwable cause)
	//*- Objective C:  -(id)initParseExceptionWithCause:(JavaThrowable*)throwable;
	results = [ParseException registerConstructorWithSelector:@selector(initParseExceptionWithCause:)
													arguments:[JavaThrowable className], nil];
	NSLog(@"ParseException Registered constructor for initParseExceptionWithCause =  %@", (results ? @"YES" : @"NO"));
	//Construct a new ParseException with an external cause.
	
	//Methods
	//*- Java:int getCode()
	//*- Objective C:  -(int)getCode;
	//Access the code for this error.
	results = [ParseException registerInstanceMethod:@"getCode"
							 selector:@selector(getCode)
						  returnValue:[JavaClass intPrimitive]
							arguments:nil];
	NSLog(@"ParseException Registered for getCode =  %@", (results ? @"YES" : @"NO"));
		
	
	
	

	
 
}

+(NSString *)className
{
    return @"com.parse.ParseException";
}


@end
