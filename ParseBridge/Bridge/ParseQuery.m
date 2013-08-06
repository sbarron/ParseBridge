//
//  ParseQuery.m
//  ParseBridge
//
//  Created by Spencer Barron on 7/21/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import "ParseQuery.h"

@implementation ParseQuery

+ (void)initializeJava
{
    [super initializeJava];

    [ParseQuery registerConstructorWithSelector:@selector(initQuery)
                                      arguments:[NSString className]];
	

    //*- Java: public static <T extends ParseObject> ParseQuery<T> getQuery(Class<T> subclass)
    //*- ObjC: + queryWithClassName:(NSString*)
    [ParseQuery registerStaticMethod:@"getQuery"
                            selector:@selector(queryWithClassName:)
                         returnValue:[ParseObject className]
                           arguments:[NSString className], nil];
	
    //*- Java: public T get(String theObjectId) throws ParseException
    //*- ObjC: + getObjectOfClass:(NSString*) objectId:(NSString*)
	[ParseQuery registerStaticMethod:@"get"
                            selector:@selector(getObjectOfClass:objectId:)
                         returnValue:[JavaObject className]
                           arguments:[NSString className], [NSString className], nil];
	
	NSLog(@"ParseUser.h associated with %@", [[ParseUser javaClass] className]);

	NSLog(@"ParseQuery bridge init");
}

+ (NSString *)className
{
    return @"com.parse.ParseQuery";
}

@end
