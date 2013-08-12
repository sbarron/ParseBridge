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


//*- Java: public static <T extends ParseObject> T create(Class<T> subclass)
//Creates a new ParseObject based upon a subclass type. Note that the object will be created based upon the ParseClassName of the given subclass type. For example, calling create(ParseUser.class) may create an instance of a custom subclass of ParseUser.


//*- Java: public static ParseObject createWithoutData(String className,String objectId)
//Creates a reference to an existing ParseObject for use in creating associations between ParseObjects. Calling ParseObject.isDataAvailable() on this object will return false until ParseObject.fetchIfNeeded() or ParseObject.refresh() has been called. No network request will be made.
 

//*- Java: public static <T extends ParseObject> T createWithoutData(Class<T> subclass,String objectId)
//Creates a reference to an existing ParseObject for use in creating associations between ParseObjects. Calling ParseObject.isDataAvailable() on this object will return false until ParseObject.fetchIfNeeded() or ParseObject.refresh() has been called. No network request will be made.
 

//*- Java: public static void registerSubclass(Class<? extends ParseObject> subclass)
//Registers a custom subclass type with the Parse SDK, enabling strong-typing of those ParseObjects whenever they appear. Subclasses must specify the ParseClassName annotation and have a default constructor.


//*- Java: public String getClassName()
//Accessor to the class name.
 

//*- Java: public Set<String> keySet()
//Returns a set view of the keys contained in this object. This does not include createdAt, updatedAt, authData, or objectId. It does include things like username and ACL.


//*- Java: public Date getUpdatedAt()
//This reports time as the server sees it, so that if you make changes to a ParseObject, then wait a while, and then call save(), the updated time will be the time of the save() call rather than the time the object was changed locally.
 

//*- Java: public Date getCreatedAt()
//This reports time as the server sees it, so that if you create a ParseObject, then wait a while, and then call save(), the creation time will be the time of the first save() call rather than the time the object was created locally.
 

//*- Java: public String getObjectId()
//Accessor to the object id. An object id is assigned as soon as an object is saved to the server. The combination of a className and an objectId uniquely identifies an object in your application.
 

//*- Java: public void setObjectId(String newObjectId)
//Setter for the object id. In general you do not need to use this. However, in some cases this can be convenient. For example, if you are serializing a ParseObject yourself and wish to recreate it, you can use this to recreate the ParseObject exactly.
 

//*- Java: public final void save()
//Saves this object to the server. Typically, you should use ParseObject.saveInBackground(com.parse.SaveCallback) instead of this, unless you are managing your own threading.

//*- Java: public final void saveInBackground(SaveCallback callback)
//Saves this object to the server in a background thread. This is preferable to using save(), unless your code is already running from a background thread.
 
//*- Java: public final void saveInBackground()
//Saves this object to the server in a background thread. Use this when you do not have code to run on completion of the push.
 

//*- Java: public final void saveEventually()
	//Saves this object to the server at some unspecified time in the future, even if Parse is currently inaccessible. Use this when you may not have a solid network connection, and don't need to know when the save completes. If there is some problem with the object such that it can't be saved, it will be silently discarded. Objects saved with this method will be stored locally in an on-disk cache until they can be delivered to Parse. They will be sent immediately if possible. Otherwise, they will be sent the next time a network connection is available. Objects saved this way will persist even after the app is closed, in which case they will be sent the next time the app is opened. If more than 10MB of data is waiting to be sent, subsequent calls to saveEventually or deleteEventually will cause old saves to be silently discarded until the connection can be re-established, and the queued objects can be saved.
 

//*- Java: public void saveEventually(SaveCallback callback)
//Saves this object to the server at some unspecified time in the future, even if Parse is currently inaccessible. Use this when you may not have a solid network connection, and don't need to know when the save completes. If there is some problem with the object such that it can't be saved, it will be silently discarded. Objects saved with this method will be stored locally in an on-disk cache until they can be delivered to Parse. They will be sent immediately if possible. Otherwise, they will be sent the next time a network connection is available. Objects saved this way will persist even after the app is closed, in which case they will be sent the next time the app is opened. If more than 10MB of data is waiting to be sent, subsequent calls to saveEventually or deleteEventually will cause old saves to be silently discarded until the connection can be re-established, and the queued objects can be saved.
 

//*- Java: public final void deleteEventually()
//Deletes this object from the server at some unspecified time in the future, even if Parse is currently inaccessible. Use this when you may not have a solid network connection, and don't need to know when the delete completes. If there is some problem with the object such that it can't be deleted, the request will be silently discarded. Delete requests made with this method will be stored locally in an on-disk cache until they can be transmitted to Parse. They will be sent immediately if possible. Otherwise, they will be sent the next time a network connection is available. Delete instructions saved this way will persist even after the app is closed, in which case they will be sent the next time the app is opened. If more than 10MB of commands are waiting to be sent, subsequent calls to deleteEventually or saveEventually will cause old instructions to be silently discarded until the connection can be re-established, and the queued objects can be saved.
 

//*- Java: public final void deleteEventually(DeleteCallback callback)
//Deletes this object from the server at some unspecified time in the future, even if Parse is currently inaccessible. Use this when you may not have a solid network connection, and don't need to know when the delete completes. If there is some problem with the object such that it can't be deleted, the request will be silently discarded. Delete requests made with this method will be stored locally in an on-disk cache until they can be transmitted to Parse. They will be sent immediately if possible. Otherwise, they will be sent the next time a network connection is available. Delete instructions saved this way will persist even after the app is closed, in which case they will be sent the next time the app is opened. If more than 10MB of commands are waiting to be sent, subsequent calls to deleteEventually or saveEventually will cause old instructions to be silently discarded until the connection can be re-established, and the queued objects can be saved.
 

//*- Java: public final void refresh()

//*- Java: public final void refreshInBackground(RefreshCallback callback)
//Refreshes this object with the data from the server in a background thread. This is preferable to using refresh(), unless your code is already running from a background thread.


//*- Java: public <T extends ParseObject> T fetch()
//Fetches this object with the data from the server. Call this whenever you want the state of the object to reflect exactly what is on the server.
 

//*- Java: public final <T extends ParseObject> void fetchInBackground(GetCallback<T> callback)
//Fetches this object with the data from the server in a background thread. This is preferable to using fetch(), unless your code is already running from a background thread.
 

//*- Java: public ParseObject fetchIfNeeded()
                    

//*- Java: public final void fetchIfNeededInBackground(GetCallback<ParseObject> callback)
//If this ParseObject has not been fetched (i.e. ParseObject.isDataAvailable() returns false), fetches this object with the data from the server in a background thread. This is preferable to using ParseObject.fetchIfNeeded(), unless your code is already running from a background thread.
 
//*- Java: public final void delete()
         

//*- Java: public final void deleteInBackground(DeleteCallback callback)
//Deletes this object on the server in a background thread. This is preferable to using delete(), unless your code is already running from a background thread.
 
//*- Java: public final void deleteInBackground()
//Deletes this object on the server in a background thread. Does nothing in particular when the save completes. Use this when you don't care if the delete works.
 

//*- Java: public static void deleteAll(List<ParseObject> objects)
//Deletes each object in the provided list. This is faster than deleting each object individually because it batches the requests.
 

//*- Java: public static void deleteAllInBackground(List<ParseObject> objects,DeleteCallback callback)
//Deletes each object in the provided list. This is faster than deleting each object individually because it batches the requests.
 

//*- Java: public static void saveAll(List<ParseObject> objects)
//Saves each object in the provided list. This is faster than saving each object individually because it batches the requests.

//*- Java:  public static <T extends ParseObject> List<T> fetchAllIfNeeded(List<T> objects)
  
//*- Java: public static <T extends ParseObject> void fetchAllIfNeededInBackground(List<T> objects,FindCallback<T> callback)
//Fetches all the objects that don't have data in the provided list in the background

//*- Java: public static List<ParseObject> fetchAll(List<ParseObject> objects)
 

//*- Java: public static <T extends ParseObject> void fetchAllInBackground(List<T> objects,FindCallback<T> callback)
//Fetches all the objects in the provided list in the background

//*- Java: public static void saveAllInBackground(List<ParseObject> objects,SaveCallback callback)
//Saves each object in the provided list to the server in a background thread. This is preferable to using saveAll, unless your code is already running from a background thread.

//*- Java: public static void saveAllInBackground(List<ParseObject> objects)
//Saves each object to the server in a background thread. Does nothing in particular when the save completes. Use this when you don't care if the save works.


//*- Java: public void remove(String key)
//Removes a key from this object's data if it exists.
 
//public boolean has(String key)
//Whether this object has a particular key. Same as containsKey.
 

//*- Java: public void put(String key,Object value)
//Add a key-value pair to this object. It is recommended to name keys in partialCamelCaseLikeThis.


//public void increment(String key)
//Atomically increments the given key by 1.
 
//public void increment(String key,Number amount)
//Atomically increments the given key by the given number.
 

//*- Java:  public void add(String key,Object value)
 
//*- Java: public void addAll(String key,Collection<?> values)
 
//*- Java: public void addUnique(String key,Object value)
//Atomically adds an object to the array associated with a given key, only if it is not already present in the array. The position of the insert is not guaranteed.
 

//*- Java: public void addAllUnique(String key,Collection<?> values)
//Atomically adds the objects contained in a Collection to the array associated with a given key, only adding elements which are not already present in the array. The position of the insert is not guaranteed.
 
//*- Java: public void removeAll(String key,Collection<?> values)
//Atomically removes all instances of the objects contained in a Collection from the array associated with a given key. To maintain consistency with the Java Collection API, there is no method removing all instances of a single object. Instead, you can call parseObject.removeAll(key, Arrays.asList(value)).
 
//*- Java: public boolean containsKey(String key)
//Whether this object has a particular key. Same as 'has'.
 

//*- Java:  public String getString(String key)

//*- Java: public byte[] getBytes(String key)


//*- Java: public Number getNumber(String key)
 

//*- Java: public JSONArray getJSONArray(String key)
 
//*- Java: public <T> List<T> getList(String key)
 

//*- Java: public <V> Map<String,V> getMap(String key)
 

//*- Java: public JSONObject getJSONObject(String key)
 

//*- Java: public int getInt(String key)
 

//*- Java: public double getDouble(String key)
 

//*- Java: public long getLong(String key)
 
//*- Java: public boolean getBoolean(String key)
 

//*- Java: public Date getDate(String key)
 

//*- Java: public ParseObject getParseObject(String key)
//Access a ParseObject value. This function will not perform a network request. Unless the ParseObject has been downloaded (e.g. by a ParseQuery.include(String) or by calling ParseObject.fetchIfNeeded() or ParseObject.refresh()), ParseObject.isDataAvailable() will return false.
 

//*- Java: public ParseUser getParseUser(String key)
//Access a ParseUser value. This function will not perform a network request. Unless the ParseObject has been downloaded (e.g. by a ParseQuery.include(String) or by calling ParseObject.fetchIfNeeded() or ParseObject.refresh()), ParseObject.isDataAvailable() will return false.
 

//*- Java: public ParseFile getParseFile(String key)
//Access a ParseFile value. This function will not perform a network request. Unless the ParseFile has been downloaded (e.g. by calling ParseFile.getData()), ParseFile.isDataAvailable() will return false.
 
//*- Java: public ParseGeoPoint getParseGeoPoint(String key)
 

//*- Java: public ParseACL getACL()
 
//*- Java: public void setACL(ParseACL acl)
 

//*- Java: public boolean isDataAvailable()
//Gets whether the ParseObject has been fetched.
 
//*- Java: public <T extends ParseObject> ParseRelation<T> getRelation(String key)
 

//*- Java: public Object get(String key)
 

//*- Java: public boolean hasSameId(ParseObject other)
 

+ (NSString *)className
{
    return @"com.parse.ParseObject";
}

@end
