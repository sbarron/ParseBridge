//
//  ParseObject.m
//  ParseBridge
//

#import "ParseObject.h"
#import <BridgeKit/JavaList.h>

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
    
    
    [ParseObject registerStaticMethod:@"create"
					   selector:@selector(objectWithClassName:)
					returnValue:[ParseObject className]
					  arguments:[NSString className], nil];

	
    [ParseObject registerStaticMethod:@"saveAll"
					   selector:@selector(saveAll:)
					returnValue:nil
					  arguments:[JavaList className], nil];

    [ParseObject registerStaticMethod:@"createWithoutData"
					   selector:@selector(objectWithoutDataWithClassName:objectId:)
					returnValue:[ParseObject className]
					  arguments:[NSString className], [NSString className], nil];

	 NSLog(@"Parse Android - ParseObject.h associated with %@", [[ParseObject javaClass] className]);
}

/*
 *- ParseObject(String theClassName) - Constructor
 -(id)initParseObject:(NSString*)name;
 
 *- public void put(String key, Object value)
 -(void)forKey:(NSString *)key setObject:(id)value;
 
 *- public final void saveEventually()
 -(void)saveEventually;
 
 *- public final void saveInBackground()
 -(void)saveInBackground;
 
 *- public static ParseObject create(String className)
 + (PFObject*)objectWithClassName:(NSString*)className;
 
 *- public static void saveAll(List<ParseObject> objects) throws ParseException
 + (void)saveAll:(NSArray*)objects error:(NSError*)error;
 
 *- public static ParseObject createWithoutData(String className, String objectId)
 + (PFObject*)objectWithoutDataWithClassName:(NSString*)className objectId:(NSString*)objectId;
*/

+ (NSString *)className
{
    return @"com.parse.ParseObject";
}

@end
