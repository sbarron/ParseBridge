//
//  CountCallBack.m
//  ParseBridge
//
//  Created by Spencer Barron on 8/17/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import "CountCallback.h"

@implementation CountCallback



+ (void)initializeJava
{
    [super initializeJava];
	BOOL results;
	//*- Java:  public CountCallback()
	results = [CountCallback registerConstructor];
	DLog(@"Registered constructor = %@", (results ? @"YES" : @"NO"));
	
	//*- Java:  public abstract void done(int count,ParseException e)
	//*- iOS Bridge Method:  -(void)done:(int)count error:(ParseException*)error;
	//Override this function with the code you want to run after the save is complete.
	results = [CountCallback registerCallback:@"done"
									selector:@selector(done:error:)
								 returnValue:nil
								   arguments:[JavaClass intPrimitive],[ParseException className], nil];
	DLog(@"Registered done = %@", (results ? @"YES" : @"NO"));
	
}



-(void)done:(int)count error:(ParseException*)error{
	//[self _done:error];
	if(!error){
		//No error
		NSLog(@"Find Successful - %i found", count);

	}
	else{
		NSLog(@"Find failed", [error getCode]);
	}
}


+ (NSString *)className
{
    return @"com.parse.CountCallback";
}

@end
