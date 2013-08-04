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
                                       arguments:[NSString className], nil];

	[ParseObject registerInstanceMethod:@"saveEventually"
                               selector:@selector(saveEventually)
                            returnValue:nil];
                            
    [ParseObject registerInstanceMethod:@"saveInBackground"
                               selector:@selector(saveInBackground)
                            returnValue:nil];
                 
    [ParseObject registerInstanceMethod:@"put"
						selector:@selector(forKey:setObject:)
					 returnValue:nil
					   arguments:[NSString className],[JavaObject className],nil];
    

	 NSLog(@"Parse Android - ParseObject.h associated with %@", [[ParseObject javaClass] className]);
}

+ (NSString *)className
{
    return @"com.parse.ParseObject";
}

@end
