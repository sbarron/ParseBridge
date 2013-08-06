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
	
    //*- Java: ParseObject(String theClassName) - Constructor
    //*- ObjC: -(id)initParseObject:(NSString*)name;
	[ParseObject registerConstructorWithSelector:@selector(initParseObject:)
                                       arguments:[NSString className], nil];
    //*- Java: public final void saveEventually()
    //*- ObjC: -(void)saveEventually;
	[ParseObject registerInstanceMethod:@"saveEventually"
                               selector:@selector(saveEventually)
                            returnValue:nil];
                            
    //*- Java: public final void saveInBackground()
    //*- ObjC: -(void)saveInBackground;
    [ParseObject registerInstanceMethod:@"saveInBackground"
                               selector:@selector(saveInBackground)
                            returnValue:nil];
    
    //*- Java: public void put(String key, Object value)
    //*- ObjC: -(void)forKey:(NSString *)key setObject:(id)value;
    [ParseObject registerInstanceMethod:@"put"
						selector:@selector(forKey:setObject:)
					 returnValue:nil
					   arguments:[NSString className],[JavaObject className],nil];
    
    
    //*- Java: public static ParseObject create(String className)
    //*- ObjC: + (PFObject*)objectWithClassName:(NSString*)className;
    [ParseObject registerStaticMethod:@"create"
					   selector:@selector(objectWithClassName:)
					returnValue:[ParseObject className]
					  arguments:[NSString className], nil];

	
    //*- Java: public static void saveAll(List<ParseObject> objects) throws ParseException
    //*- ObjC: + (void)saveAll:(NSArray*)objects error:(NSError*)error;
    [ParseObject registerStaticMethod:@"saveAll"
					   selector:@selector(saveAll:)
					returnValue:nil
					  arguments:[JavaList className], nil];

    //*- Java: public static ParseObject createWithoutData(String className, String objectId)
    //*- ObjC: + (PFObject*)objectWithoutDataWithClassName:(NSString*)className objectId:(NSString*)objectId;
    [ParseObject registerStaticMethod:@"createWithoutData"
					   selector:@selector(objectWithoutDataWithClassName:objectId:)
					returnValue:[ParseObject className]
					  arguments:[NSString className], [NSString className], nil];

	 NSLog(@"Parse Android - ParseObject.h associated with %@", [[ParseObject javaClass] className]);
}

+ (NSString *)className
{
    return @"com.parse.ParseObject";
}

@end
