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

#import "ParseObject.h"
#import "ParseUser.h"
#import "ParseGeoPoint.h"
#import "ParseFile.h"
#import "ParseACL.h"
#import "ParseRelation.h"
#import "SaveCallback.h"
#import "DeleteCallback.h"
#import "FindCallback.h"
#import "GetCallback.h"
#import "RefreshCallback.h"
#import <BridgeKit/JavaList.h>
#import <BridgeKit/JavaClass.h>
#import <BridgeKit/JavaSet.h>

@implementation ParseObject

+ (void)initializeJava
{
    [super initializeJava];
	
    //*- Java: ParseObject(String theClassName) - Constructor
    //*- ObjC: -(id)initParseObject:(NSString*)name;
	BOOL result = NO;
	result = [ParseObject registerConstructor];
	DLog(@"ParseObject Registered constructor  =  %@", (result ? @"YES" : @"NO"));
	
	//*- Java: ParseObject(String theClassName) - Constructor
	//*- ObjC: -(id)initParseObject:(NSString*)name;
	result = [ParseObject registerConstructorWithSelector:@selector(initParseObject:)
                                       arguments:[NSString className], nil];
	DLog(@"ParseObject Registered constructor2  =  %@", (result ? @"YES" : @"NO"));
    
	//*- Java: public final void saveEventually()
	//*- ObjC: -(void)saveEventually;
	result = [ParseObject registerInstanceMethod:@"saveEventually"
                               selector:@selector(saveEventually)
                            returnValue:nil];
	DLog(@"ParseObject Registered saveEventually  =  %@", (result ? @"YES" : @"NO"));
                            
    //*- Java: public final void saveInBackground()
    //*- ObjC: -(void)saveInBackground;
    result = [ParseObject registerInstanceMethod:@"saveInBackground"
                               selector:@selector(saveInBackground)
							   returnValue:nil];
	DLog(@"ParseObject Registered saveInBackground  =  %@", (result ? @"YES" : @"NO"));
	
	
	//*- Java: public final void save()
	//*- ObjC: -(void)save;
	result = [ParseObject registerInstanceMethod:@"save"
											  selector:@selector(save)
										   returnValue:nil];
	DLog(@"ParseObject Registered save  =  %@", (result ? @"YES" : @"NO"));
	//Saves this object to the server. Typically, you should use ParseObject.saveInBackground(com.parse.SaveCallback) instead of this, unless you are managing your own threading.
 
 
    //*- Java: public void put(String key, Object value)
    //*- ObjC: -(void)forKey:(NSString *)key setObject:(id)value;
    result = [ParseObject registerInstanceMethod:@"put"
						selector:@selector(forKey:setObject:)
					 returnValue:nil
					   arguments:[NSString className],[JavaObject className],nil];
	DLog(@"ParseObject Registered put  =  %@", (result ? @"YES" : @"NO"));
    
    //*- Java: public static ParseObject create(String className)
    //*- ObjC: + (ParseObject*)objectWithClassName:(NSString*)className;
	//Creates a new ParseObject based upon a class name. If the class name is a special type (e.g. for ParseUser), then the appropriate type of ParseObject is returned.
    result = [ParseObject registerStaticMethod:@"create"
					   selector:@selector(objectWithClassName:)
					returnValue:[ParseObject className]
					  arguments:[NSString className], nil];
	DLog(@"ParseObject Registered create  =  %@", (result ? @"YES" : @"NO"));
	
	
	//*- Java: public static <T extends ParseObject> T create(Class<T> subclass)
	//*- ObjC: + (ParseObject*)objectWithClass:(JavaClass*)subclass;
	//Creates a new ParseObject based upon a subclass type. Note that the object will be created based upon the ParseClassName of the given subclass type. For example, calling create(ParseUser.class) may create an instance of a custom subclass of ParseUser.
	result = [ParseObject registerStaticMethod:@"create"
									  selector:@selector(objectWithClass:)
								   returnValue:[ParseObject className]
									 arguments:[JavaClass className], nil];
	DLog(@"ParseObject Registered create2  =  %@", (result ? @"YES" : @"NO"));

	
    //*- Java: public static void saveAll(List<ParseObject> objects) throws ParseException
    //*- ObjC: + (void)saveAll:(NSArray*)objects;
    result = [ParseObject registerStaticMethod:@"saveAll"
					   selector:@selector(saveAll:)
					returnValue:nil
					  arguments:[JavaList className], nil];
	DLog(@"ParseObject Registered saveAll  =  %@", (result ? @"YES" : @"NO"));
	

    //*- Java: public static ParseObject createWithoutData(String className, String objectId)
    //*- ObjC: + (ParseObject*)objectWithoutDataWithClassName:(NSString*)className objectId:(NSString*)objectId;
	//Creates a reference to an existing ParseObject for use in creating associations between ParseObjects. Calling ParseObject.isDataAvailable() on this object will return false until ParseObject.fetchIfNeeded() or ParseObject.refresh() has been called. No network request will be made.
    result = [ParseObject registerStaticMethod:@"createWithoutData"
					   selector:@selector(objectWithoutDataWithClassName:objectId:)
					returnValue:[ParseObject className]
					  arguments:[NSString className], [NSString className], nil];
	DLog(@"ParseObject Registered createWithoutData  =  %@", (result ? @"YES" : @"NO"));


	//*- Java: public static <T extends ParseObject> T createWithoutData(Class<T> subclass,String objectId)
	//*- ObjC: +(ParseObject*)objectWithoutDataWithClass:(JavaClass*)subclass objectId:(NSString*)objectId;
	//Creates a reference to an existing ParseObject for use in creating associations between ParseObjects. Calling ParseObject.isDataAvailable() on this object will return false until ParseObject.fetchIfNeeded() or ParseObject.refresh() has been called. No network request will be made.
	result = [ParseObject registerStaticMethod:@"createWithoutData"
									  selector:@selector(objectWithoutDataWithClass:objectId:)
								   returnValue:[ParseObject className]
									 arguments:[JavaClass className], [NSString className], nil];
	DLog(@"ParseObject Registered createWithoutData  =  %@", (result ? @"YES" : @"NO"));


	//*- Java: public static void registerSubclass(Class<? extends ParseObject> subclass)
	//*- ObjC: +(void)registerSubclass:(JavaClass*)subclass;
	//Registers a custom subclass type with the Parse SDK, enabling strong-typing of those ParseObjects whenever they appear. Subclasses must specify the ParseClassName annotation and have a default constructor.
	result = [ParseObject registerStaticMethod:@"registerSubclass"
									  selector:@selector(registerSubclass:)
								   returnValue:nil
									 arguments:[JavaClass className], nil];
	DLog(@"ParseObject Registered registerSubclass  =  %@", (result ? @"YES" : @"NO"));


	//*- Java: public String getClassName()
	//*- ObjC: -(NSString*)getClassName;
	//Accessor to the class name.
	result = [ParseObject registerInstanceMethod:@"getClassName"
										selector:@selector(getClassName)
									 returnValue:[NSString className]
									   arguments:nil];
	DLog(@"ParseObject Registered getClassName  =  %@", (result ? @"YES" : @"NO"));
 

	//*- Java: public Set<String> keySet()
	//*- ObjC: -(JavaSet*)keySet;
	//Returns a set view of the keys contained in this object. This does not include createdAt, updatedAt, authData, or objectId. It does include things like username and ACL.
	result = [ParseObject registerInstanceMethod:@"keySet"
										selector:@selector(keySet:)
									 returnValue:[JavaSet className]
									   arguments:nil];
	DLog(@"ParseObject Registered keySet  =  %@", (result ? @"YES" : @"NO"));

	//*- Java: public Date getUpdatedAt()
	//*- ObjC: -(JavaObject*)getUpdatedAt;
	//This reports time as the server sees it, so that if you make changes to a ParseObject, then wait a while, and then call save(), the updated time will be the time of the save() call rather than the time the object was changed locally.
	//result = [ParseObject registerInstanceMethod:@"getUpdatedAt"
	//									selector:@selector(getUpdatedAt)
	//								 returnValue:[JavaClass className]
	//								   arguments:nil];
	//DLog(@"ParseObject Registered getUpdatedAt  =  %@", (result ? @"YES" : @"NO"));

	//*- Java: public Date getCreatedAt()
	//*- ObjC: -(JavaObject*)getCreatedAt;
	//This reports time as the server sees it, so that if you create a ParseObject, then wait a while, and then call save(), the creation time will be the time of the first save() call rather than the time the object was created locally.
	//result = [ParseObject registerInstanceMethod:@"getCreatedAt"
	//									selector:@selector(getCreatedAt)
	//								 returnValue:[JavaClass className]
	//								   arguments:nil];
	//DLog(@"ParseObject Registered getCreatedAt  =  %@", (result ? @"YES" : @"NO"));
 

	//*- Java: public String getObjectId()
	//*- ObjC: -(NSString*)getObjectId;
	//Accessor to the object id. An object id is assigned as soon as an object is saved to the server. The combination of a className and an objectId uniquely identifies an object in your application.
	result = [ParseObject registerInstanceMethod:@"getObjectId"
										selector:@selector(getObjectId)
									 returnValue:[NSString className]
									   arguments:nil];
	DLog(@"ParseObject Registered getObjectId  =  %@", (result ? @"YES" : @"NO"));
 

	//*- Java: public void setObjectId(String newObjectId)
	//*- ObjC: -(void)setObjectId:(NSString*)newObjectId;
	//Setter for the object id. In general you do not need to use this. However, in some cases this can be convenient. For example, if you are serializing a ParseObject yourself and wish to recreate it, you can use this to recreate the ParseObject exactly.
	result = [ParseObject registerInstanceMethod:@"setObjectId"
										selector:@selector(setObjectId:)
									 returnValue:nil
									   arguments:[NSString className],nil];
	DLog(@"ParseObject Registered setObjectId  =  %@", (result ? @"YES" : @"NO"));


	//*- Java: public final void saveInBackground(SaveCallback callback)
	//*- ObjC: -(void)saveInBackgroundWithCallback:(SaveCallback*)callback;
	//Saves this object to the server in a background thread. This is preferable to using save(), unless your code is already running from a background thread.
	result = [ParseObject registerInstanceMethod:@"saveInBackground"
										selector:@selector(saveInBackgroundWithCallback:)
									 returnValue:nil
									   arguments:[SaveCallback className],nil];
	DLog(@"ParseObject Registered saveInBackground  =  %@", (result ? @"YES" : @"NO"));
	
 
	//*- Java: public final void saveInBackground()
	//*- ObjC: -(void)saveInBackground;
	//Saves this object to the server in a background thread. Use this when you do not have code to run on completion of the push.
	result = [ParseObject registerInstanceMethod:@"saveInBackground"
										selector:@selector(saveInBackground)
									 returnValue:nil
									   arguments:nil];
	DLog(@"ParseObject Registered saveInBackground2  =  %@", (result ? @"YES" : @"NO"));
	

 

	//*- Java: public final void saveEventually()
	//*- ObjC: -(void)saveEventually;
	//Saves this object to the server at some unspecified time in the future, even if Parse is currently inaccessible. Use this when you may not have a solid network connection, and don't need to know when the save completes. If there is some problem with the object such that it can't be saved, it will be silently discarded. Objects saved with this method will be stored locally in an on-disk cache until they can be delivered to Parse. They will be sent immediately if possible. Otherwise, they will be sent the next time a network connection is available. Objects saved this way will persist even after the app is closed, in which case they will be sent the next time the app is opened. If more than 10MB of data is waiting to be sent, subsequent calls to saveEventually or deleteEventually will cause old saves to be silently discarded until the connection can be re-established, and the queued objects can be saved.
	result = [ParseObject registerInstanceMethod:@"saveEventually"
										selector:@selector(saveEventually)
									 returnValue:nil
									   arguments:nil];
	DLog(@"ParseObject Registered saveEventually  =  %@", (result ? @"YES" : @"NO"));
	

 

	//*- Java: public void saveEventually(SaveCallback callback)
	//*- ObjC: -(void)saveEventuallyWithCallback:(SaveCallback*)callback;
	//Saves this object to the server at some unspecified time in the future, even if Parse is currently inaccessible. Use this when you may not have a solid network connection, and don't need to know when the save completes. If there is some problem with the object such that it can't be saved, it will be silently discarded. Objects saved with this method will be stored locally in an on-disk cache until they can be delivered to Parse. They will be sent immediately if possible. Otherwise, they will be sent the next time a network connection is available. Objects saved this way will persist even after the app is closed, in which case they will be sent the next time the app is opened. If more than 10MB of data is waiting to be sent, subsequent calls to saveEventually or deleteEventually will cause old saves to be silently discarded until the connection can be re-established, and the queued objects can be saved.
	result = [ParseObject registerInstanceMethod:@"saveEventually"
										selector:@selector(saveEventuallyWithCallback:)
									 returnValue:nil
									   arguments:[SaveCallback className],nil];
	DLog(@"ParseObject Registered saveEventually2  =  %@", (result ? @"YES" : @"NO"));
 

	//*- Java: public final void deleteEventually()
	//*- ObjC: -(void)deleteEventually;
	//Deletes this object from the server at some unspecified time in the future, even if Parse is currently inaccessible. Use this when you may not have a solid network connection, and don't need to know when the delete completes. If there is some problem with the object such that it can't be deleted, the request will be silently discarded. Delete requests made with this method will be stored locally in an on-disk cache until they can be transmitted to Parse. They will be sent immediately if possible. Otherwise, they will be sent the next time a network connection is available. Delete instructions saved this way will persist even after the app is closed, in which case they will be sent the next time the app is opened. If more than 10MB of commands are waiting to be sent, subsequent calls to deleteEventually or saveEventually will cause old instructions to be silently discarded until the connection can be re-established, and the queued objects can be saved.
	result = [ParseObject registerInstanceMethod:@"deleteEventually"
										selector:@selector(deleteEventually)
									 returnValue:nil
									   arguments:nil];
	DLog(@"ParseObject Registered deleteEventually  =  %@", (result ? @"YES" : @"NO"));
 

	//*- Java: public final void deleteEventually(DeleteCallback callback)
	//*- ObjC: -(void)deleteEventuallyWithCallback:(DeleteCallback*)callback;
	//Deletes this object from the server at some unspecified time in the future, even if Parse is currently inaccessible. Use this when you may not have a solid network connection, and don't need to know when the delete completes. If there is some problem with the object such that it can't be deleted, the request will be silently discarded. Delete requests made with this method will be stored locally in an on-disk cache until they can be transmitted to Parse. They will be sent immediately if possible. Otherwise, they will be sent the next time a network connection is available. Delete instructions saved this way will persist even after the app is closed, in which case they will be sent the next time the app is opened. If more than 10MB of commands are waiting to be sent, subsequent calls to deleteEventually or saveEventually will cause old instructions to be silently discarded until the connection can be re-established, and the queued objects can be saved.
	result = [ParseObject registerInstanceMethod:@"deleteEventually"
										selector:@selector(deleteEventuallyWithCallback:)
									 returnValue:nil
									   arguments:[DeleteCallback className],nil];
	DLog(@"ParseObject Registered deleteEventually  =  %@", (result ? @"YES" : @"NO"));



	//*- Java: public final void refresh()
	//*- ObjC: -(void)refresh;
	result = [ParseObject registerInstanceMethod:@"refresh"
										selector:@selector(refresh)
									 returnValue:nil
									   arguments:nil];
	DLog(@"ParseObject Registered refresh  =  %@", (result ? @"YES" : @"NO"));


	//*- Java: public final void refreshInBackground(RefreshCallback callback)
	//*- ObjC: -(void)refreshInBackground:(RefreshCallback*)callback;
	//Refreshes this object with the data from the server in a background thread. This is preferable to using refresh(), unless your code is already running from a background thread.
	result = [ParseObject registerInstanceMethod:@"refreshInBackground"
										selector:@selector(refreshInBackground:)
									 returnValue:nil
									   arguments:[RefreshCallback className],nil];
	DLog(@"ParseObject Registered refreshInBackground  =  %@", (result ? @"YES" : @"NO"));


	//*- Java: public <T extends ParseObject> T fetch()
	//*- ObjC: -(ParseObject*)fetch;
	//Fetches this object with the data from the server. Call this whenever you want the state of the object to reflect exactly what is on the server.
	result = [ParseObject registerInstanceMethod:@"fetch"
										selector:@selector(fetch)
									 returnValue:[ParseObject className]
									   arguments:nil];
	DLog(@"ParseObject Registered fetch = %@", (result ? @"YES" : @"NO"));

	//*- Java: public final <T extends ParseObject> void fetchInBackground(GetCallback<T> callback)
	//*- ObjC: -(void)fetchInBackground:(GetCallback*)callback;
	//Fetches this object with the data from the server in a background thread. This is preferable to using fetch(), unless your code is already running from a background thread.
	result = [ParseObject registerInstanceMethod:@"fetchInBackground"
										selector:@selector(fetchInBackground:)
									 returnValue:nil
									   arguments:[GetCallback className],nil];
	DLog(@"ParseObject Registered fetchInBackground = %@", (result ? @"YES" : @"NO"));
	
 

	//*- Java: public ParseObject fetchIfNeeded()
	//*- ObjC: -(ParseObject*)fetchIfNeeded;
	result = [ParseObject registerInstanceMethod:@"fetchIfNeeded"
										selector:@selector(fetchIfNeeded)
									 returnValue:[ParseObject className]
									   arguments:nil];
	DLog(@"ParseObject Registered fetchIfNeeded = %@", (result ? @"YES" : @"NO"));
	
                    

	//*- Java: public final void fetchIfNeededInBackground(GetCallback<ParseObject> callback)
	//*- ObjC: -(void)fetchIfNeededInBackground:(GetCallBack*)callback;
	//If this ParseObject has not been fetched (i.e. ParseObject.isDataAvailable() returns false), fetches this object with the data from the server in a background thread. This is preferable to using ParseObject.fetchIfNeeded(), unless your code is already running from a background thread.
	result = [ParseObject registerInstanceMethod:@"fetchIfNeededInBackground"
										selector:@selector(fetchIfNeededInBackground:)
									 returnValue:nil
									   arguments:[GetCallback className],nil];
	DLog(@"ParseObject Registered fetchIfNeededInBackground = %@", (result ? @"YES" : @"NO"));
 
	//*- Java: public final void delete()
	//*- ObjC: -(void)delete;
	result = [ParseObject registerInstanceMethod:@"delete"
										selector:@selector(delete)
									 returnValue:nil
									   arguments:nil];
	DLog(@"ParseObject Registered delete = %@", (result ? @"YES" : @"NO"));
         

	//*- Java: public final void deleteInBackground(DeleteCallback callback)
	//*- ObjC: -(void)deleteInBackgroundWithCallback:(DeleteCallback*)callback;
	//Deletes this object on the server in a background thread. This is preferable to using delete(), unless your code is already running from a background thread.
	result = [ParseObject registerInstanceMethod:@"deleteInBackground"
										selector:@selector(deleteInBackgroundWithCallback:)
									 returnValue:nil
									   arguments:[DeleteCallback className],nil];
	DLog(@"ParseObject Registered deleteInBackground = %@", (result ? @"YES" : @"NO"));
 
	//*- Java: public final void deleteInBackground()
	//*- ObjC: -(void)deleteInBackground;
	//Deletes this object on the server in a background thread. Does nothing in particular when the save completes. Use this when you don't care if the delete works.
	result = [ParseObject registerInstanceMethod:@"deleteInBackground"
										selector:@selector(deleteInBackground)
									 returnValue:nil
									   arguments:nil];
	DLog(@"ParseObject Registered deleteInBackground = %@", (result ? @"YES" : @"NO"));


	//*- Java: public static void deleteAll(List<ParseObject> objects)
	//*- ObjC: -(void)deleteAll:(JavaList*)objects;
	//Deletes each object in the provided list. This is faster than deleting each object individually because it batches the requests.
	//result = [ParseObject registerStaticMethod:@"deleteAll"
	//									selector:@selector(deleteAll:)
	//								 returnValue:nil
	//								   arguments:[JavaList className],nil];
	//DLog(@"ParseObject Registered deleteAll = %@", (result ? @"YES" : @"NO"));
 

	//*- Java: public static void deleteAllInBackground(List<ParseObject> objects,DeleteCallback callback)
	//*- ObjC: +(void)deleteAllInBackground:(JavaList*)objects callback:(DeleteCallback*)callback
	//Deletes each object in the provided list. This is faster than deleting each object individually because it batches the requests.
	//result = [ParseObject registerStaticMethod:@"deleteAllInBackground"
	//								  selector:@selector(deleteAllInBackground:callback:)
	//							   returnValue:nil
	//								 arguments:[JavaList className],[DeleteCallback className],nil];
	//DLog(@"ParseObject Registered deleteAllInBackground = %@", (result ? @"YES" : @"NO"));
 


	//*- Java: public static void saveAll(List<ParseObject> objects)
	//*- ObjC: +(void)saveAll:(JavaList*)objects;
	//Saves each object in the provided list. This is faster than saving each object individually because it batches the requests.
	result = [ParseObject registerStaticMethod:@"saveAll"
									  selector:@selector(saveAll:)
								   returnValue:nil
									 arguments:[JavaList className],nil];
	DLog(@"ParseObject Registered saveAll = %@", (result ? @"YES" : @"NO"));


	//*- Java:  public static <T extends ParseObject> List<T> fetchAllIfNeeded(List<T> objects)
	//*- ObjC: +(JavaList*)fetchAllIfNeeded:(JavaList*)objects;
	//result = [ParseObject registerStaticMethod:@"fetchAllIfNeeded"
	//								  selector:@selector(fetchAllIfNeeded:)
	//							   returnValue:nil
	//								 arguments:[JavaList className],nil];
	//DLog(@"ParseObject Registered fetchAllIfNeeded = %@", (result ? @"YES" : @"NO"));
  
	
	//*- Java: public static <T extends ParseObject> void fetchAllIfNeededInBackground(List<T> objects,FindCallback<T> callback)
	//*- ObjC: +(void)fetchAllIfNeededInBackground:(JavaList*)objects callback:(FindCallback*)callback
	//Fetches all the objects that don't have data in the provided list in the background
	result = [ParseObject registerStaticMethod:@"fetchAllIfNeededInBackground"
									  selector:@selector(fetchAllIfNeededInBackground:className:)
								   returnValue:nil
									 arguments:[JavaList className],[FindCallback className],nil];
	DLog(@"ParseObject Registered fetchAllIfNeededInBackground = %@", (result ? @"YES" : @"NO"));
	
	

	//*- Java: public static List<ParseObject> fetchAll(List<ParseObject> objects)
	//*- ObjC: +(JavaList*)fetchAll:(JavaList*)objects;
	//result = [ParseObject registerStaticMethod:@"fetchAll"
	//								  selector:@selector(fetchAll:)
	//							   returnValue:nil
	//								 arguments:[JavaList className],nil];
	//DLog(@"ParseObject Registered fetchAll = %@", (result ? @"YES" : @"NO"));
 

	//*- Java: public static <T extends ParseObject> void fetchAllInBackground(List<T> objects,FindCallback<T> callback)
	//*- ObjC: +(void)fetchAllInBackground:(JavaList*)objects callback:(FindCallback*)callback;
	//Fetches all the objects in the provided list in the background
	result = [ParseObject registerStaticMethod:@"fetchAllInBackground"
									  selector:@selector(fetchAllInBackground:callback:)
								   returnValue:nil
									 arguments:[JavaList className],[FindCallback className],nil];
	DLog(@"ParseObject Registered fetchAllInBackground = %@", (result ? @"YES" : @"NO"));

	//*- Java: public static void saveAllInBackground(List<ParseObject> objects,SaveCallback callback)
	//*- ObjC: -(void)saveAllInBackgroundWithCallback:(JavaList*)objects callback:(SaveCallback*)callback;
	//Saves each object in the provided list to the server in a background thread. This is preferable to using saveAll, unless your code is already running from a background thread.
	result = [ParseObject registerStaticMethod:@"saveAllInBackground"
									  selector:@selector(saveAllInBackgroundWithCallback:callback:)
								   returnValue:nil
									 arguments:[JavaList className],[SaveCallback className],nil];
	DLog(@"ParseObject Registered saveAllInBackground = %@", (result ? @"YES" : @"NO"));


	//*- Java: public static void saveAllInBackground(List<ParseObject> objects)
	//*- ObjC: -(void)saveAllInBackground:(JavaList*)objects;
	//Saves each object to the server in a background thread. Does nothing in particular when the save completes. Use this when you don't care if the save works.
	result = [ParseObject registerStaticMethod:@"saveAllInBackground"
									  selector:@selector(saveAllInBackground:)
								   returnValue:nil
									 arguments:[JavaList className],nil];
	DLog(@"ParseObject Registered saveAllInBackground = %@", (result ? @"YES" : @"NO"));


	//*- Java: public void remove(String key)
	//*- ObjC: -(void)remove:(NSString*)key;
	//Removes a key from this object's data if it exists.
	result = [ParseObject registerInstanceMethod:@"remove"
										selector:@selector(remove:)
									 returnValue:nil
									   arguments:[NSString className],nil];
	DLog(@"ParseObject Registered remove = %@", (result ? @"YES" : @"NO"));
 
	//*- Java: public boolean has(String key)
	//*- ObjC: -(bool)has:(NSString*)key;
	//Whether this object has a particular key. Same as containsKey.
	result = [ParseObject registerInstanceMethod:@"has"
										selector:@selector(has:)
									 returnValue:[JavaClass boolPrimitive]
									   arguments:[NSString className],nil];
	DLog(@"ParseObject Registered has = %@", (result ? @"YES" : @"NO"));

	//*- Java: public void put(String key,Object value)
	//*- ObjC: -(void)put:(NSString*)key value:(JavaObject*)value;
	//Add a key-value pair to this object. It is recommended to name keys in partialCamelCaseLikeThis.
	result = [ParseObject registerInstanceMethod:@"put"
										selector:@selector(put:)
									 returnValue:nil
									   arguments:[NSString className],[JavaObject className],nil];
	DLog(@"ParseObject Registered put = %@", (result ? @"YES" : @"NO"));


	//*- Java: public void increment(String key)
	//*- ObjC: -(void)increment:(NSString*)key;
	//Atomically increments the given key by 1.
	result = [ParseObject registerInstanceMethod:@"increment"
										selector:@selector(increment:)
									 returnValue:nil
									   arguments:[NSString className],nil];
	DLog(@"ParseObject Registered increment = %@", (result ? @"YES" : @"NO"));
 
	//*- Java: public void increment(String key,Number amount)
	//*- ObjC: -(void)incrementWithKeyandAmount:(NSString*)key amount:(NSNumber*)amount;
	//Atomically increments the given key by the given number.
	//result = [ParseObject registerInstanceMethod:@"increment"
	//									selector:@selector(incrementWithKeyandAmount:amount:)
	//								 returnValue:nil
	//								   arguments:[NSString className],[JavaObject className], nil];
	//DLog(@"ParseObject Registered increment2 = %@", (result ? @"YES" : @"NO"));
	
	
	//*- Java:  public void add(String key,Object value)
	//*- ObjC: -(void)add:(NSString*)key value:(JavaObject*)value;
	result = [ParseObject registerInstanceMethod:@"add"
										selector:@selector(add:value:)
									 returnValue:nil
									   arguments:[NSString className],[JavaObject className], nil];
	DLog(@"ParseObject Registered add = %@", (result ? @"YES" : @"NO"));
 
	
	//*- Java: public void addAll(String key,Collection<?> values)
	//*- ObjC: -(void)addAll:(NSString*)key values:(JavaObject*)values;
	//result = [ParseObject registerInstanceMethod:@"addAll"
	//									selector:@selector(addAll:values:)
	//								 returnValue:nil
	//								   arguments:[NSString className],[JavaObject className], nil];
	//DLog(@"ParseObject Registered addAll = %@", (result ? @"YES" : @"NO"));
 
	
	//*- Java: public void addUnique(String key,Object value)
	//*- ObjC: -(void)addUnique:(NSString*)key value:(JavaObject*)value;
	//Atomically adds an object to the array associated with a given key, only if it is not already present in the array. The position of the insert is not guaranteed.
	result = [ParseObject registerInstanceMethod:@"addUnique"
										selector:@selector(addUnique:value:)
									 returnValue:nil
									   arguments:[NSString className],[JavaObject className], nil];
	DLog(@"ParseObject Registered addUnique = %@", (result ? @"YES" : @"NO"));
 

	//*- Java: public void addAllUnique(String key,Collection<?> values)
	//*- ObjC: -(void)addAllUnique:(NSString*)key values:(JavaObject*)values;
	//Atomically adds the objects contained in a Collection to the array associated with a given key, only adding elements which are not already present in the array. The position of the insert is not guaranteed.
	//result = [ParseObject registerInstanceMethod:@"addAllUnique"
	//									selector:@selector(addAllUnique:values:)
	//								 returnValue:nil
	//								   arguments:[NSString className],[JavaObject className], nil];
	//DLog(@"ParseObject Registered addAllUnique = %@", (result ? @"YES" : @"NO"));
 

	//*- Java: public void removeAll(String key,Collection<?> values)
	//*- ObjC: -(void)removeAll:(NSString*)key values:(JavaObject*)values;
	//Atomically removes all instances of the objects contained in a Collection from the array associated with a given key. To maintain consistency with the Java Collection API, there is no method removing all instances of a single object. Instead, you can call parseObject.removeAll(key, Arrays.asList(value)).
	//result = [ParseObject registerInstanceMethod:@"removeAll"
	//									selector:@selector(removeAll:values:)
	//								 returnValue:nil
	//								   arguments:[NSString className],[JavaClass className], nil];
	//DLog(@"ParseObject Registered removeAll = %@", (result ? @"YES" : @"NO"));
 
	//*- Java: public boolean containsKey(String key)
	//*- ObjC: -(bool)containsKey:(NSString*)key;
	//Whether this object has a particular key. Same as 'has'.
	result = [ParseObject registerInstanceMethod:@"containsKey"
										selector:@selector(containsKey:)
									 returnValue:[JavaClass boolPrimitive]
									   arguments:[NSString className],nil];
	DLog(@"ParseObject Registered containsKey = %@", (result ? @"YES" : @"NO"));
 

	//*- Java:  public String getString(String key)
	//*- ObjC: -(NSString*)getString:(NSString*)key;
	result = [ParseObject registerInstanceMethod:@"getString"
										selector:@selector(getString:)
									 returnValue:[NSString className]
									   arguments:[NSString className],nil];
	DLog(@"ParseObject Registered getString = %@", (result ? @"YES" : @"NO"));

	//*- Java: public byte[] getBytes(String key)
	//*- ObjC: -(JavaByte*)getBytes:(NSString*)key;


	//*- Java: public Number getNumber(String key)
	//*- ObjC: -(NSNumber*)getNumber:(NSString*)key;

	//*- Java: public JSONArray getJSONArray(String key)
	//*- ObjC: -(JSONArray*) getJSONArray:(NSString*)key;
	
 
	//*- Java: public <T> List<T> getList(String key)
	//*- ObjC: -(JavaList*)getList:(NSString*)key;
	result = [ParseObject registerInstanceMethod:@"getList"
										selector:@selector(getString:)
									 returnValue:[JavaList className]
									   arguments:[NSString className],nil];
	DLog(@"ParseObject Registered getList = %@", (result ? @"YES" : @"NO"));
	
	//*- Java: public <V> Map<String,V> getMap(String key)
	//*- ObjC: -(JavaObject*)getMap:(NSString*)key;
 
	//*- Java: public JSONObject getJSONObject(String key)
	//*- ObjC: -(JSONObject*)getJSONObject:(NSString*)key;

	//*- Java: public int getInt(String key)
	//*- ObjC: -(int)getInt:(NSString*)key;
	result = [ParseObject registerInstanceMethod:@"getInt"
										selector:@selector(getInt:)
									 returnValue:[JavaClass intPrimitive]
									   arguments:[NSString className],nil];
	DLog(@"ParseObject Registered getInt = %@", (result ? @"YES" : @"NO"));
	
	//*- Java: public double getDouble(String key)
	//*- ObjC: -(double)getDouble:(NSString*)key;
	result = [ParseObject registerInstanceMethod:@"getDouble"
										selector:@selector(getDouble:)
									 returnValue:[JavaClass doublePrimitive]
									   arguments:[NSString className],nil];
	DLog(@"ParseObject Registered getDouble = %@", (result ? @"YES" : @"NO"));

	//*- Java: public long getLong(String key)
	//*- ObjC: -(long)getLong:(NSString*)key;
	result = [ParseObject registerInstanceMethod:@"getLong"
										selector:@selector(getLong:)
									 returnValue:[JavaClass longPrimitive]
									   arguments:[NSString className],nil];
	DLog(@"ParseObject Registered getLong = %@", (result ? @"YES" : @"NO"));
	
	//*- Java: public boolean getBoolean(String key)
	//*- ObjC: -(bool)getBoolean:(NSString*)key;
	result = [ParseObject registerInstanceMethod:@"getBoolean"
										selector:@selector(getBoolean:)
									 returnValue:[JavaClass boolPrimitive]
									   arguments:[NSString className],nil];
	DLog(@"ParseObject Registered getBoolean = %@", (result ? @"YES" : @"NO"));
	
	//*- Java: public Date getDate(String key)
	//*- ObjC: -(Date)getDate:(NSString*)key;

	//*- Java: public ParseObject getParseObject(String key)
	//*- ObjC: -(ParseObject*)getParseObject:(NSString*)key;
	//Access a ParseObject value. This function will not perform a network request. Unless the ParseObject has been downloaded (e.g. by a ParseQuery.include(String) or by calling ParseObject.fetchIfNeeded() or ParseObject.refresh()), ParseObject.isDataAvailable() will return false.
	result = [ParseObject registerInstanceMethod:@"getParseObject"
										selector:@selector(getParseObject:)
									 returnValue:[ParseObject className]
									   arguments:[NSString className],nil];
	DLog(@"ParseObject Registered getParseObject = %@", (result ? @"YES" : @"NO"));
 

	//*- Java: public ParseUser getParseUser(String key)
	//*- ObjC: -(ParseUser*)getParseUser:(NSString*)key;
	//Access a ParseUser value. This function will not perform a network request. Unless the ParseObject has been downloaded (e.g. by a ParseQuery.include(String) or by calling ParseObject.fetchIfNeeded() or ParseObject.refresh()), ParseObject.isDataAvailable() will return false.
	result = [ParseObject registerInstanceMethod:@"getParseUser"
										selector:@selector(getParseUser:)
									 returnValue:[ParseUser className]
									   arguments:[NSString className],nil];
	DLog(@"ParseObject Registered getParseUser = %@", (result ? @"YES" : @"NO"));
 

	//*- Java: public ParseFile getParseFile(String key)
	//*- ObjC: -(ParseFile*)getParseFile:(NSString*)key;
	//Access a ParseFile value. This function will not perform a network request. Unless the ParseFile has been downloaded (e.g. by calling ParseFile.getData()), ParseFile.isDataAvailable() will return false.
	result = [ParseObject registerInstanceMethod:@"getParseFile"
										selector:@selector(getParseFile:)
									 returnValue:[ParseFile className]
									   arguments:[NSString className],nil];
	DLog(@"ParseObject Registered getParseFile = %@", (result ? @"YES" : @"NO"));
 
	//*- Java: public ParseGeoPoint getParseGeoPoint(String key)
	//*- ObjC: -(ParseGeoPoint*)getParseGeoPoint:(NSString*)key;
	result = [ParseObject registerInstanceMethod:@"getParseGeoPoint"
										selector:@selector(getParseGeoPoint:)
									 returnValue:[ParseGeoPoint className]
									   arguments:[NSString className],nil];
	DLog(@"ParseObject Registered getParseGeoPoint = %@", (result ? @"YES" : @"NO"));
 

	//*- Java: public ParseACL getACL()
	//*- ObjC: -(ParseACL*)getACL;
	result = [ParseObject registerInstanceMethod:@"getACL"
										selector:@selector(getACL:)
									 returnValue:[ParseACL className]
									   arguments:nil];
	DLog(@"ParseObject Registered getACL = %@", (result ? @"YES" : @"NO"));
 
	//*- Java: public void setACL(ParseACL acl)
	//*- ObjC: -(void)setACL:(ParseACL*)acl;
	result = [ParseObject registerInstanceMethod:@"setACL"
										selector:@selector(setACL:)
									 returnValue:nil
									   arguments:[ParseACL className],nil];
	DLog(@"ParseObject Registered setACL = %@", (result ? @"YES" : @"NO"));
 
	//*- Java: public boolean isDataAvailable()
	//*- ObjC: -(bool)isDataAvailable;
	//Gets whether the ParseObject has been fetched.
	result = [ParseObject registerInstanceMethod:@"isDataAvailable"
										selector:@selector(isDataAvailable:)
									 returnValue:[JavaClass boolPrimitive]
									   arguments:nil];
	DLog(@"ParseObject Registered isDataAvailable = %@", (result ? @"YES" : @"NO"));
 
	//*- Java: public <T extends ParseObject> ParseRelation<T> getRelation(String key)
	//*- ObjC: -(ParseRelation*)getRelation:(NSString*)key;
	result = [ParseObject registerInstanceMethod:@"getRelation"
										selector:@selector(getRelation:)
									 returnValue:[ParseRelation className]
									   arguments:[NSString className],nil];
	DLog(@"ParseObject Registered getRelation = %@", (result ? @"YES" : @"NO"));

	//*- Java: public Object get(String key)
	//*- ObjC: -(JavaObject*)get:(NSString*)key;
	result = [ParseObject registerInstanceMethod:@"get"
										selector:@selector(get:)
									 returnValue:[JavaObject className]
									   arguments:[NSString className],nil];
	DLog(@"ParseObject Registered get = %@", (result ? @"YES" : @"NO"));
 

	//*- Java: public boolean hasSameId(ParseObject other)
	//*- ObjC: -(bool)hasSameId:(ParseObject*)other;
	result = [ParseObject registerInstanceMethod:@"hasSameId"
										selector:@selector(hasSameId:)
									 returnValue:[JavaClass boolPrimitive]
									   arguments:[ParseObject className],nil];
	DLog(@"ParseObject Registered hasSameId = %@", (result ? @"YES" : @"NO"));
	
}

+ (NSString *)className
{
    return @"com.parse.ParseObject";
}

@end
