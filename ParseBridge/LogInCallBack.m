//
//  ParseBridge.m
//  ParseBridge
//
//  Created by Spencer Barron on 7/6/13.


#import "LogInCallBack.h"
#import "ParseUser.h"
#import "ParseException.h"

@implementation LogInCallBack

+ (void)initializeJava
{
    [super initializeJava];
    
    [LogInCallBack registerConstructorWithSelector:@selector(initLoginCallBack)
                                         arguments:nil];
	
    [LogInCallBack registerInstanceMethod:@"done"
                                 selector:@selector(done:error:)
                                arguments:[ParseUser className], [ParseException className], nil];
	
}

+ (NSString *)className
{
    return @"com.parse.LogInCallback";
}



@end
