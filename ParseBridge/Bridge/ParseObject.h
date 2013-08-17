/*
 * ParseBridge: https://github.com/sbarron/ParseBridge
 *
 * Copyright (c) 2013 Spencer Barron
 *
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 */

#import <BridgeKit/JavaObject.h>

@class JavaClass;

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

//*- Java: public final void save()
-(void)save;

//*- public static ParseObject create(String className)
+ (ParseObject*)objectWithClassName:(NSString*)className;

//*- public static void saveAll(List<ParseObject> objects) throws ParseException
+ (void)saveAll:(NSArray*)objects;

//*- public static ParseObject createWithoutData(String className, String objectId)
//+ (ParseObject*)objectWithoutDataWithClassName:(NSString*)className objectId:(NSString*)objectId;

//*- Java: public static <T extends ParseObject> T create(Class<T> subclass)
//+ (ParseObject*)create:(JavaClass*)object;
@end
