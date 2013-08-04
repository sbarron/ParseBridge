//
//  ParseObject.m
//  ParseBridge
//

#import "ParseObject.h"

@implementation ParseObject

+ (void)initializeJava
{
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
						selector:@selector(putKey:value:)
					 returnValue:nil
					   arguments:[NSString classname],[JavaObject classname],nil];
    

	 NSLog(@"ParseObject.h associated with %@", [[ParseObject javaClass] className]);
}


+ (NSString *)className
{
    return @"com.parse.ParseObject";
}

@end
