//
//  ParseException.h
//  ParseBridge
//
//  Created by Spencer Barron on 7/9/13.
//  Copyright (c) 2013 Spencer Barron. All rights reserved.
//

#import <BridgeKit/JavaObject.h>

@class JavaThrowable;

@interface ParseException : JavaObject{
}

-(id)initParseExceptionWithCode:(int)errorcode message:(NSString*)message;
-(id)initParseExceptionWithMessageandCause:(NSString*)message throwable:(JavaThrowable*)throwable;
-(id)initParseExceptionWithCause:(JavaThrowable*)throwable;

-(int)getCode;

@end
