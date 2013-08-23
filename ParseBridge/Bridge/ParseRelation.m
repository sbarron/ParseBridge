//
//  ParseRelation.m
//  ParseBridge
//
//  Created by Spencer Barron on 8/17/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import "ParseRelation.h"
#import "ParseObject.h"
#import "ParseQuery.h"

@implementation ParseRelation



+ (void)initializeJava
{
    [super initializeJava];
	
	//*- Java:  public void add(T object)
	//*- ObjC:  -(void)add:(ParseObject*)object;
	BOOL result = [ParseRelation registerInstanceMethod:@"add"
													selector:@selector(add:)
												 returnValue:nil
												   arguments:[ParseObject className],nil];
	DLog(@"Registered isDataAvailable = %@", (result ? @"YES" : @"NO"));
		
	//*- Java:  public void remove(T object)
	//*- ObjC:  -(void)remove:(ParseObject*)object;
	result = [ParseRelation registerInstanceMethod:@"remove"
											   selector:@selector(remove:)
											returnValue:nil
											  arguments:[ParseObject className],nil];
	DLog(@"Registered isDataAvailable = %@", (result ? @"YES" : @"NO"));
		
	//*- Java:  public ParseQuery<T> getQuery()
	//*- ObjC:  -(ParseQuery*)getQuery;
	result = [ParseRelation registerInstanceMethod:@"getQuery"
										  selector:@selector(remove:)
									   returnValue:[ParseQuery className]
										 arguments:nil];
	DLog(@"Registered isDataAvailable = %@", (result ? @"YES" : @"NO"));

	
}


+ (NSString *)className
{
    return @"com.parse.ParseRelation";
}

@end
