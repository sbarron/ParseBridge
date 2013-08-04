//
//  ParseAnalytics.m
//  Created by Spencer Barron on 7/7/13.

#import "ParseAnalytics.h"
//#import <BridgeKit/AndroidIntent.h>

@implementation ParseAnalytics


+ (void)initializeJava
{
    // Note: this must be called for any class that registers custom
    // java apis, without this call the inheritance may not work as expected
    [super initializeJava];

	[ParseAnalytics registerStaticMethod:@"trackAppOpened"
				   selector:@selector(trackAppOpened:)
				returnValue:nil
				  arguments:[AndroidIntent className], NULL];

	 NSLog(@"ParseAnalytics.h associated with %@", [[ParseAnalytics javaClass] className]);
}

+ (NSString *)className
{
    return @"com.parse.ParseAnalytics";
}


@end
