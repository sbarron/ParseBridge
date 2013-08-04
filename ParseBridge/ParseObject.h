//
//  ParseObject.h
//

#import <BridgeKit/JavaObject.h>

@interface ParseObject : JavaObject

/*
 PFObject
 + objectWithClassName:(NSString*)
 + saveAll:(NSArray*) error:(NSError*)
 + objectWithoutDataWithClassName:(NSString*) objectId:(NSString*)
 */

//*- ParseObject(String theClassName) - Constructor
-(id)initParseObject:(NSString*)name;

//*- public void put(String key, Object value)
-(void)forKey:(NSString *)key setObject:(id)value;

//*- public final void saveEventually()
-(void)saveEventually;

//*- public final void saveInBackground()
-(void)saveInBackground;

//*- public static ParseObject create(String className)
+ (ParseObject*)objectWithClassName:(NSString*)className;

//*- public static void saveAll(List<ParseObject> objects) throws ParseException
+ (void)saveAll:(NSArray*)objects;

//*- public static ParseObject createWithoutData(String className, String objectId)
+ (ParseObject*)objectWithoutDataWithClassName:(NSString*)className objectId:(NSString*)objectId;

@end
