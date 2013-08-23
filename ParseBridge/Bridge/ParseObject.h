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
@class JavaList;
@class JavaSet;
@class ParseRelation;
@class ParseACL;
@class ParseGeoPoint;
@class ParseFile;
@class ParseUser;
@class SaveCallback;
@class RefreshCallback;
@class GetCallback;
@class DeleteCallback;
@class FindCallback;


@interface ParseObject : JavaObject

-(id)initParseObject:(NSString*)name;
-(void)saveEventually;

-(void)saveInBackground;

-(void)save;
-(void)forKey:(NSString *)key setObject:(id)value;
+ (ParseObject*)objectWithClassName:(NSString*)className;

+ (ParseObject*)objectWithClass:(JavaClass*)subclass;

+ (ParseObject*)objectWithoutDataWithClassName:(NSString*)className objectId:(NSString*)objectId;

+(ParseObject*)objectWithoutDataWithClass:(JavaClass*)subclass objectId:(NSString*)objectId;

+(void)registerSubclass:(JavaClass*)subclass;

-(NSString*)getClassName;

-(JavaSet*)keySet;

//-(NSDate*)getUpdatedAt;

//-(NSDate*)getCreatedAt;

-(NSString*)getObjectId;

-(void)setObjectId:(NSString*)newObjectId;

-(void)saveInBackgroundWithCallback:(SaveCallback*)callback;

-(void)saveInBackground;

-(void)saveEventually;

-(void)saveEventuallyWithCallback:(SaveCallback*)callback;

-(void)deleteEventually;

-(void)deleteEventuallyWithCallback:(DeleteCallback*)callback;

-(void)refresh;

-(void)refreshInBackground:(RefreshCallback*)callback;

-(ParseObject*)fetch;

-(void)fetchInBackground:(GetCallback*)callback;

-(ParseObject*)fetchIfNeeded;

-(void)fetchIfNeededInBackground:(GetCallback*)callback;

-(void)delete;

-(void)deleteInBackgroundWithCallback:(DeleteCallback*)callback;

-(void)deleteInBackground;

//-(void)deleteAll:(JavaList*)objects;

//+(void)deleteAllInBackground:(JavaList*)objects callback:(DeleteCallback*)callback;

+(void)saveAll:(JavaList*)objects;

//+(JavaList*)fetchAllIfNeeded:(JavaList*)objects;

+(void)fetchAllIfNeededInBackground:(JavaList*)objects callback:(FindCallback*)callback;

//+(JavaList*)fetchAll:(JavaList*)objects;

+(void)fetchAllInBackground:(JavaList*)objects callback:(FindCallback*)callback;

-(void)saveAllInBackgroundWithCallback:(JavaList*)objects callback:(SaveCallback*)callback;

-(void)saveAllInBackground:(JavaList*)objects;

-(void)remove:(NSString*)key;

-(bool)has:(NSString*)key;

-(void)put:(NSString*)key value:(JavaObject*)value;

-(void)increment:(NSString*)key;

//-(void)incrementWithKeyandAmount:(NSString*)key amount:(JavaObject*)amount;

-(void)add:(NSString*)key value:(JavaObject*)value;

//-(void)addAll:(NSString*)key values:(JavaObject*)values;

-(void)addUnique:(NSString*)key value:(JavaObject*)value;

//-(void)addAllUnique:(NSString*)key values:(JavaObject*)values;

//-(void)removeAll:(NSString*)key values:(JavaObject*)values;

-(bool)containsKey:(NSString*)key;

-(NSString*)getString:(NSString*)key;

-(JavaList*)getList:(NSString*)key;

-(int)getInt:(NSString*)key;

-(double)getDouble:(NSString*)key;

-(long)getLong:(NSString*)key;

-(bool)getBoolean:(NSString*)key;

-(ParseObject*)getParseObject:(NSString*)key;

-(ParseUser*)getParseUser:(NSString*)key;

-(ParseFile*)getParseFile:(NSString*)key;

-(ParseGeoPoint*)getParseGeoPoint:(NSString*)key;

-(ParseACL*)getACL;

-(void)setACL:(ParseACL*)acl;

-(bool)isDataAvailable;

-(ParseRelation*)getRelation:(NSString*)key;

-(JavaObject*)get:(NSString*)key;

-(bool)hasSameId:(ParseObject*)other;




@end
