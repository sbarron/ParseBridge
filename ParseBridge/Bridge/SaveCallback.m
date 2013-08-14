//
//  SaveCallback.m
//  ParseBridge
//
//  Created by Spencer Barron on 8/14/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import "SaveCallback.h"
#import "ParseException.h"

@implementation SaveCallback
+ (void)initializeJava
{
    [super initializeJava];
	
	//*- Java:  public SaveCallback()
    [SaveCallback registerConstructor];
	
	//*- Java:  public abstract void done(ParseException e)
	//*- iOS Bridge Method:  -(void)done:(ParseException*)error;
	//Override this function with the code you want to run after the save is complete.
    [SaveCallback registerInstanceMethod:@"done"
                                 selector:@selector(done:)
                                arguments:[ParseException className], nil];
	
}

+ (NSString *)className
{
    return @"com.parse.SaveCallback";
}

@end
