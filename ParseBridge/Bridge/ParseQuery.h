//
//  ParseQuery.h
//  ParseBridge
//
//  Created by Spencer Barron on 7/21/13.
//  Copyright (c) 2013 Spencer Barron. All rights reserved.
//

#import <BridgeKit/JavaObject.h>

@class ParseObject;

@interface ParseQuery : JavaObject

//*- Java:  public ParseQuery(Class<T> subclass)
-(ParseQuery*)initWithParseObject:(ParseObject*)object;

//*- Java:  public ParseQuery(String theClassName)
-(ParseQuery*)initWithClassName:(NSString*)theClassName;

//*- Java:  public static <T extends ParseObject> ParseQuery<T> getQuery(String className)
-(ParseQuery*)queryWithClassName:(NSString*)theClassName;

//*- Java:  public static <T extends ParseObject> ParseQuery<T> getQuery(Class<T> subclass)
-(ParseQuery*)queryWithObject:(ParseObject*)object;

@end
