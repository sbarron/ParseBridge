//
//  ParseObject.m
//

#import "ParseObject.h"

@implementation ParseObject


+ (void)initializeJava
{
    // Note: this must be called for any class that registers custom
    // java apis, without this call the inheritance may not work as expected
    [super initializeJava];
	
	[ParseObject registerConstructorWithSelector:@selector(initParseObject:)
                                       arguments:[NSString classname], nil];
	
	[ParseObject registerInstanceMethod:@"saveEventually"
                               selector:@selector(saveEventually)
                            returnValue:nil];
                            
    [ParseObject registerInstanceMethod:@"saveInBackground"
                               selector:@selector(saveInBackground)
                            returnValue:nil];
                 
    [ParseObject registerInstanceMethod:@"put"
						selector:@selector(put::)
					 returnValue:nil
					   arguments:[NSString classname],[JavaObject classname],nil];

	 NSLog(@"ParseObject.h associated with %@", [[ParseObject javaClass] className]);
}


+ (NSString *)className
{
	NSLog(@"ParseObject checking classname");
    return @"com.parse.ParseObject";
}

@end
