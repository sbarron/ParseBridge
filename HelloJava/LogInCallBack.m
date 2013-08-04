//
//  ParseBridge.m
//  Created by Spencer Barron on 7/6/13.


#import "LogInCallBack.h"
#import "ParseUser.h"
#import "ParseException.h"

@implementation LogInCallBack

+ (void)initializeJava
{
    // Note: this must be called for any class that registers custom
    // java apis, without this call the inheritance may not work as expected
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
