//
//  ParseObject.h
//

#import <BridgeKit/JavaObject.h>

@interface ParseObject : JavaObject

//constructor
//ParseObject(String theClassName) 
-(id)initParseObject:(NSString*)name;

//public void put(String key, Object value)
-(void)forKey:(NSString *)key setObject:(id)value;

// public final void saveEventually()
-(void)saveEventually;

//public final void saveInBackground()
-(void)saveInBackground;

@end
