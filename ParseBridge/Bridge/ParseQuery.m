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

#import "ParseQuery.h"
#import "ParseObject.h"
#import "ParseGeoPoint.h"
#import <BridgeKit/JavaClass.h>
#import <BridgeKit/JavaList.h>
#import "GetCallback.h"
#import "CountCallback.h"
#import  "FindCallback.h"



@implementation ParseQuery

+ (void)initializeJava
{
    [super initializeJava];

	BOOL results = FALSE;
	
	//*- Java:  public ParseQuery(Class<T> subclass)
	//*- iOS Bridge Method:  -(ParseQuery*)initWithParseObject:(ParseObject*)object;
	results = [ParseQuery registerConstructorWithSelector:@selector(initWithParseObject:)
                                      arguments:[JavaClass className], nil];
	DLog(@"Registered initWithParseObject =  %@", (results ? @"YES" : @"NO"));
				
	//*- Java:  public ParseQuery(String theClassName)
	//*- iOS Bridge Method:  -(ParseQuery*)initWithClassName:(NSString*)theClassName;
    results = [ParseQuery registerConstructorWithSelector:@selector(initWithClassName)
                                      arguments:[NSString className], nil];
	DLog(@"Registered initWithClassName =  %@", (results ? @"YES" : @"NO"));
	
	
	//*- Java:  public static <T extends ParseObject> ParseQuery<T> getQuery(String className)
	//*- iOS Bridge Method: -(ParseQuery*)queryWithClassName:(NSString*)theClassName;
     results = [ParseQuery registerStaticMethod:@"getQuery"
                            selector:@selector(queryWithClassName:)
                         returnValue:[ParseQuery className]
                           arguments:[NSString className], nil];
	DLog(@"Registered getQuery ->queryWithClassName =  %@", (results ? @"YES" : @"NO"));
				
	//*- Java:  public static <T extends ParseObject> ParseQuery<T> getQuery(Class<T> subclass)
	//*- iOS Bridge Method: -(ParseQuery*)queryWithObject:(ParseObject*)object;
     results = [ParseQuery registerStaticMethod:@"getQuery"
                            selector:@selector(queryWithObject:)
                         returnValue:[ParseQuery className]
                           arguments:[JavaClass className], nil];
	DLog(@"Registered getQuery ->queryWithObject =  %@", (results ? @"YES" : @"NO"));
	
	//*- Java:  public T get(String theObjectId)
	//*- iOS Bridge Method: -(ParseObject*)get:(NSString*)objectID;
	//Constructs a ParseObject whose id is already known by fetching data from the server.
	results = [ParseQuery registerInstanceMethod:@"get"
							selector:@selector(get:)
						 returnValue:[ParseObject className]
						   arguments:[NSString className], nil];
	DLog(@"Registered get  =  %@", (results ? @"YES" : @"NO"));
	
	//Constructs a ParseObject whose id is already known by fetching data from the server. This mutates the ParseQuery.
	
	//*- Java: public void getInBackground(String objectId,GetCallback<T> callback)
	//*- iOS Bridge Method: -(void)getInBackground:(NSString*)objectID callback:(GetCallback*)callback;
	results = [ParseQuery registerInstanceMethod:@"getInBackground"
										selector:@selector(getInBackground:callback:)
									 returnValue:nil
									   arguments:[NSString className], [GetCallback className], nil];
	DLog(@"Registered getInBackground  =  %@", (results ? @"YES" : @"NO"));
  

	//*- Java:  public static <T extends ParseObject> ParseQuery<T> or(List<ParseQuery<T>> queries)
	//*- ObjC:  +(ParseQuery*)orQuery:(JavaList*)queries
	results = [ParseQuery registerStaticMethod:@"or"
									  selector:@selector(orQuery:)
								   returnValue:[ParseQuery className]
									 arguments:[JavaList className], nil];
	DLog(@"Registered or  =  %@", (results ? @"YES" : @"NO"));
	
	//*- Java: public void cancel()
	//*- ObjC: -(void)cancel;
	results = [ParseQuery registerInstanceMethod:@"cancel"
										selector:@selector(cancel)
									 returnValue:nil
									   arguments:nil];
	DLog(@"Registered cancel  =  %@", (results ? @"YES" : @"NO"));
	//Cancels the current network request (if one is running).

	//*- Java: public List<T> find()
	//*- ObjC: -(NSArray*)find;
	results = [ParseQuery registerInstanceMethod:@"find"
										selector:@selector(find)
									 returnValue:[JavaList className]
									   arguments:nil];
	DLog(@"Registered find  =  %@", (results ? @"YES" : @"NO"));
	//Retrieves a list of ParseObjects that satisfy this query. Uses the network and/or the cache, depending on the cache policy.

	//*- Java: public T getFirst()
	//*- ObjC: -(ParseObject*)getFirst;
	results = [ParseQuery registerInstanceMethod:@"getFirst"
										selector:@selector(getFirst)
									 returnValue:[ParseObject className]
									   arguments:nil];
	DLog(@"Registered getFirst  =  %@", (results ? @"YES" : @"NO"));
	//Retrieves at most one ParseObject that satisfies this query. Uses the network and/or the cache, depending on the cache policy. This mutates the ParseQuery.


	//*- Java: public void setCachePolicy(ParseQuery.CachePolicy newCachePolicy)
	//*- ObjC: -(void)setCachePolicy;
	//Change the caching policy of this query.

	//*- Java: public ParseQuery.CachePolicy getCachePolicy()
	//Accessor for the caching policy.


	//*- Java: public void setMaxCacheAge(long maxAgeInMilliseconds)
	//Sets the maximum age of cached data that will be considered in this query.


	//*- Java: public long getMaxCacheAge()
	//Gets the maximum age of cached data that will be considered in this query. The returned value is in milliseconds


	//*- Java: public void findInBackground(FindCallback<T> callback)
	//*- ObjC: -(void)findInBackground:(FindCallback*)callback;
	results = [ParseQuery registerInstanceMethod:@"findInBackground"
										selector:@selector(findInBackground:)
									 returnValue:nil  
									   arguments:[FindCallback className], nil];
	DLog(@"Registered findInBackground  =  %@", (results ? @"YES" : @"NO"));
	//Retrieves a list of ParseObjects that satisfy this query from the server in a background thread. This is preferable to using find(), unless your code is already running in a background thread.


	//*- Java: public void getFirstInBackground(GetCallback<T> callback)
	//*- ObjC: -(void)getFirstInBackground:(GetCallback*)callback;
	results = [ParseQuery registerInstanceMethod:@"getFirstInBackground"
										selector:@selector(getFirstInBackground:)
									 returnValue:nil
									   arguments:[GetCallback className], nil];
	DLog(@"Registered getFirstInBackground  =  %@", (results ? @"YES" : @"NO"));
	//Retrieves at most one ParseObject that satisfies this query from the server in a background thread. This is preferable to using getFirst(), unless your code is already running in a background thread. This mutates the ParseQuery.


	//*- Java: public int count()throws ParseException
	//*- ObjC: -(int)count;
	//Counts the number of objects that match this query. This does not use caching.
	results = [ParseQuery registerInstanceMethod:@"count"
										selector:@selector(count)
									 returnValue:[JavaClass intPrimitive]
									   arguments:nil];
	DLog(@"Registered count  =  %@", (results ? @"YES" : @"NO"));

	//*- Java: protected int count(boolean needsLock)throws ParseException
	//*- ObjC: -(int)count:(bool)needsLock;
	results = [ParseQuery registerInstanceMethod:@"count"
										selector:@selector(count:)
									 returnValue:[JavaClass intPrimitive]
									   arguments:[JavaClass boolPrimitive],nil];
	DLog(@"Registered count  =  %@", (results ? @"YES" : @"NO"));

	//*- Java: public void countInBackground(CountCallback callback)
	//*- ObjC: -(void)countInBackground:(CountCallback*)callback;
	//Counts the number of objects that match this query in a background thread. This does not use caching.
	results = [ParseQuery registerInstanceMethod:@"countInBackground"
										selector:@selector(countInBackground:)
									 returnValue:nil
									   arguments:[CountCallback className],nil];
	DLog(@"Registered countInBackground  =  %@", (results ? @"YES" : @"NO"));




	//*- Java: public boolean hasCachedResult()
	//*- ObjC: -(bool)hasCachedResult;
	results = [ParseQuery registerInstanceMethod:@"hasCachedResult"
										selector:@selector(hasCachedResult)
									 returnValue:[JavaClass boolPrimitive]
									   arguments:nil];
	DLog(@"Registered hasCachedResult  =  %@", (results ? @"YES" : @"NO"));
	//Returns whether or not this query has a cached result.


	//*- Java: public void clearCachedResult()
	//*- ObjC: -(void)clearCachedResult;
	results = [ParseQuery registerInstanceMethod:@"clearCachedResult"
										selector:@selector(clearCachedResult)
									 returnValue:nil
									   arguments:nil];
	DLog(@"Registered clearCachedResult  =  %@", (results ? @"YES" : @"NO"));
	//Removes the previously cached result for this query, forcing the next find() to hit the network. If there is no cached result for this query, then this is a no-op.


	//*- Java: public static void clearAllCachedResults()
	//*- ObjC: -(void)clearAllCachedResults;
	results = [ParseQuery registerStaticMethod:@"clearAllCachedResults"
										selector:@selector(clearAllCachedResults)
									 returnValue:nil
									   arguments:nil];
	DLog(@"Registered clearAllCachedResults  =  %@", (results ? @"YES" : @"NO"));
	//Clears the cached result for all queries.
	

	//*- Java: public ParseQuery<T> whereEqualTo(String key,Object value)
	//*- ObjC: -(ParseQuery*)whereEqualTo:(NSString*)key value:(JavaObject*)value;
	//Add a constraint to the query that requires a particular key's value to be equal to the provided value.
	results = [ParseQuery registerInstanceMethod:@"whereEqualTo"
										selector:@selector(whereEqualTo:value:)
									 returnValue:[ParseQuery className]
									   arguments:[NSString className],[JavaObject className], nil];
	DLog(@"Registered whereEqualTo  =  %@", (results ? @"YES" : @"NO"));
	


	//*- Java: public ParseQuery<T> whereLessThan(String key,Object value)
	//*- ObjC: -(ParseQuery*)whereLessThan:(NSString*)key value:(JavaObject*)value;
	//Add a constraint to the query that requires a particular key's value to be less than the provided value.
	results = [ParseQuery registerInstanceMethod:@"whereLessThan"
										selector:@selector(whereLessThan:value:)
									 returnValue:[ParseQuery className]
									   arguments:[NSString className],[JavaObject className], nil];
	DLog(@"Registered whereLessThan  =  %@", (results ? @"YES" : @"NO"));


	//*- Java: public ParseQuery<T> whereNotEqualTo(String key,Object value)
	//*- ObjC: -(ParseQuery*)whereNotEqualTo:(NSString*)key value:(JavaObject*)value;
	//Add a constraint to the query that requires a particular key's value to be not equal to the provided value.
	results = [ParseQuery registerInstanceMethod:@"whereNotEqualTo"
										selector:@selector(whereNotEqualTo:value:)
									 returnValue:[ParseQuery className]
									   arguments:[NSString className],[JavaObject className], nil];
	DLog(@"Registered whereLessThan  =  %@", (results ? @"YES" : @"NO"));

	//*- Java: public ParseQuery<T> whereGreaterThan(String key,Object value)
	//*- ObjC: -(ParseQuery*)whereGreaterThan:(NSString*)key value:(JavaObject*)value;
	//Add a constraint to the query that requires a particular key's value to be greater than the provided value.
	results = [ParseQuery registerInstanceMethod:@"whereGreaterThan"
										selector:@selector(whereGreaterThan:value:)
									 returnValue:[ParseQuery className]
									   arguments:[NSString className],[JavaObject className], nil];
	DLog(@"Registered whereGreaterThan  =  %@", (results ? @"YES" : @"NO"));


	//*- Java: public ParseQuery<T> whereLessThanOrEqualTo(String key,Object value)
	//*- ObjC: -(ParseQuery*)whereLessThanOrEqualTo:(NSString*)key value:(JavaObject*)value;
	//Add a constraint to the query that requires a particular key's value to be less than or equal to the provided value.
	results = [ParseQuery registerInstanceMethod:@"whereLessThanOrEqualTo"
										selector:@selector(whereLessThanOrEqualTo:value:)
									 returnValue:[ParseQuery className]
									   arguments:[NSString className],[JavaObject className], nil];
	DLog(@"Registered whereLessThanOrEqualTo  =  %@", (results ? @"YES" : @"NO"));


	//*- Java: public ParseQuery<T> whereGreaterThanOrEqualTo(String key,Object value)
	//*- ObjC: -(ParseQuery*)whereGreaterThanOrEqualTo:(NSString*)key value:(JavaObject*)value;
	//Add a constraint to the query that requires a particular key's value to be greater than or equal to the provided value.
	results = [ParseQuery registerInstanceMethod:@"whereGreaterThanOrEqualTo"
										selector:@selector(whereGreaterThanOrEqualTo:value:)
									 returnValue:[ParseQuery className]
									   arguments:[NSString className],[JavaObject className], nil];
	DLog(@"Registered whereGreaterThanOrEqualTo  =  %@", (results ? @"YES" : @"NO"));


	//*- Java: public ParseQuery<T> whereContainedIn(String key,Collection<? extends Object> values)
	//*- ObjC: -(ParseQuery*)whereContainedIn:(NSString*)key values:(JavaArrayList*)values;
	//Add a constraint to the query that requires a particular key's value to be contained in the provided list of values.
	//results = [ParseQuery registerInstanceMethod:@"whereContainedIn"
	//									selector:@selector(whereContainedIn:values:)
	//								 returnValue:[ParseQuery className]
	//								   arguments:[NSString className],[JavaArrayList className], nil];
	//DLog(@"Registered whereContainedIn  =  %@", (results ? @"YES" : @"NO"));


	//*- Java: public ParseQuery<T> whereContainsAll(String key,Collection<?> values)
	//*- ObjC: -(ParseQuery*)whereContainsAll:(NSString*)key values:(JavaArrayList*)values;
	//Add a constraint to the query that requires a particular key's value match another ParseQuery. This only works on keys whose values are ParseObjects or lists of ParseObjects. Add a constraint to the query that requires a particular key's value to contain every one of the provided list of values.
	//results = [ParseQuery registerInstanceMethod:@"whereContainsAll"
	//									selector:@selector(whereContainsAll:values:)
	//								 returnValue:[ParseQuery className]
	//								   arguments:[NSString className],[JavaObject className], nil];
	//DLog(@"Registered whereContainsAll  =  %@", (results ? @"YES" : @"NO"));

	//*- Java: public ParseQuery<T> whereMatchesQuery(String key,ParseQuery<?> query)
	//*- ObjC: -(ParseQuery*)whereMatchesQuery:(NSString*)key query:(ParseQuery*)query;
	//Add a constraint to the query that requires a particular key's value match another ParseQuery. This only works on keys whose values are ParseObjects or lists of ParseObjects.
	results = [ParseQuery registerInstanceMethod:@"whereMatchesQuery"
										selector:@selector(whereMatchesQuery:query:)
									 returnValue:[ParseQuery className]
									   arguments:[NSString className],[ParseQuery className], nil];
	DLog(@"Registered whereMatchesQuery  =  %@", (results ? @"YES" : @"NO"));


	//*- Java: public ParseQuery<T> whereDoesNotMatchQuery(String key,ParseQuery<?> query)
	//*- ObjC: -(ParseQuery*)whereDoesNotMatchQuery:(NSString*)key query:(ParseQuery*)query;
	//Add a constraint to the query that requires a particular key's value does not match another ParseQuery. This only works on keys whose values are ParseObjects or lists of ParseObjects.
	results = [ParseQuery registerInstanceMethod:@"whereDoesNotMatchQuery"
										selector:@selector(whereDoesNotMatchQuery:query:)
									 returnValue:[ParseQuery className]
									   arguments:[NSString className],[ParseQuery className], nil];
	DLog(@"Registered whereDoesNotMatchQuery  =  %@", (results ? @"YES" : @"NO"));


	//*- Java: public ParseQuery<T> whereMatchesKeyInQuery(String key,String keyInQuery,ParseQuery<?> query)
	//*- ObjC: -(ParseQuery*)whereMatchesKeyInQuery:(NSString*)key keyInQuery:(NSString*)keyInQuery  query:(ParseQuery*)query;
	//Add a constraint to the query that requires a particular key's value matches a value for a key in the results of another ParseQuery
	results = [ParseQuery registerInstanceMethod:@"whereMatchesKeyInQuery"
										selector:@selector(whereMatchesKeyInQuery:keyInQuery:query:)
									 returnValue:[ParseQuery className]
									   arguments:[NSString className],[NSString className],[ParseQuery className], nil];
	DLog(@"Registered whereMatchesKeyInQuery  =  %@", (results ? @"YES" : @"NO"));


	//*- Java: public ParseQuery<T> whereDoesNotMatchKeyInQuery(String key,String keyInQuery,ParseQuery<?> query)
	//*- ObjC: -(ParseQuery*)whereDoesNotMatchKeyInQuery:(NSString*)key keyInQuery:(NSString*)keyInQuery  query:(ParseQuery*)query;
	//Add a constraint to the query that requires a particular key's value does not match any value for a key in the results of another ParseQuery.
	results = [ParseQuery registerInstanceMethod:@"whereDoesNotMatchKeyInQuery"
										selector:@selector(whereDoesNotMatchKeyInQuery:query:)
									 returnValue:[ParseQuery className]
									   arguments:[NSString className],[NSString className],[ParseQuery className], nil];
	DLog(@"Registered whereDoesNotMatchKeyInQuery  =  %@", (results ? @"YES" : @"NO"));


	//*- Java: public ParseQuery<T> whereNotContainedIn(String key,Collection<? extends Object> values)
	//*- ObjC: -(ParseQuery*)whereNotContainedIn:(NSString*)key values:(JavaArrayList*)values;
	//Add a constraint to the query that requires a particular key's value not be contained in the provided list of values.
	//results = [ParseQuery registerInstanceMethod:@"whereNotContainedIn"
	//									selector:@selector(whereNotContainedIn:values:)
	//								 returnValue:[ParseQuery className]
	//								   arguments:[NSString className],[JavaArrayList className], nil];
	//DLog(@"Registered whereNotContainedIn  =  %@", (results ? @"YES" : @"NO"));


	//*- Java: public ParseQuery<T> whereNear(String key,ParseGeoPoint point)
	//*- ObjC: -(ParseQuery*)whereNear:(NSString*)key point:(ParseGeoPoint*)point;
	//dd a proximity based constraint for finding objects with key point values near the point given.
	results = [ParseQuery registerInstanceMethod:@"whereNear"
										selector:@selector(whereNear:point:)
									 returnValue:[ParseQuery className]
									   arguments:[NSString className],[ParseGeoPoint className], nil];
	DLog(@"Registered whereNear = %@", (results ? @"YES" : @"NO"));

	//*- Java: public ParseQuery<T> whereWithinMiles(String key,ParseGeoPoint point,double maxDistance)
	//*- ObjC: -(ParseQuery*)whereWithinMiles:(NSString*)key point:(ParseGeoPoint*)point maxDistance:(double)maxDistance;
	//Add a proximity based constraint for finding objects with key point values near the point given and within the maximum distance given. Radius of earth used is 3958.8 miles.
	results = [ParseQuery registerInstanceMethod:@"whereWithinMiles"
										selector:@selector(whereWithinMiles:point:maxDistance:)
									 returnValue:[ParseQuery className]
									   arguments:[NSString className],[ParseGeoPoint className], [JavaClass doublePrimitive], nil];
	DLog(@"Registered whereWithinMiles = %@", (results ? @"YES" : @"NO"));

	//*- Java: public ParseQuery<T> whereWithinKilometers(String key,ParseGeoPoint point,double maxDistance)
	//*- ObjC: -(ParseQuery*)whereWithinKilometers:(NSString*)key point:(ParseGeoPoint*)point maxDistance:(double)maxDistance;
	//Add a proximity based constraint for finding objects with key point values near the point given and within the maximum distance given. Radius of earth used is 6371.0 kilometers.
	results = [ParseQuery registerInstanceMethod:@"whereWithinKilometers"
										selector:@selector(whereWithinKilometers:point:maxDistance:)
									 returnValue:[ParseQuery className]
									   arguments:[NSString className],[ParseGeoPoint className], [JavaClass doublePrimitive], nil];
	DLog(@"Registered whereWithinKilometers = %@", (results ? @"YES" : @"NO"));


	//*- Java: public ParseQuery<T> whereWithinRadians(String key,ParseGeoPoint point,double maxDistance)
	//*- ObjC: -(ParseQuery*)whereWithinRadians:(NSString*)key point:(ParseGeoPoint*)point maxDistance:(double)maxDistance;
	//Add a proximity based constraint for finding objects with key point values near the point given and within the maximum distance given.
	results = [ParseQuery registerInstanceMethod:@"whereWithinRadians"
										selector:@selector(whereWithinRadians:point:maxDistance:)
									 returnValue:[ParseQuery className]
									   arguments:[NSString className],[ParseGeoPoint className], [JavaClass doublePrimitive], nil];
	DLog(@"Registered whereWithinRadians = %@", (results ? @"YES" : @"NO"));


	//*- Java: public ParseQuery<T> whereWithinGeoBox(String key,ParseGeoPoint southwest,ParseGeoPoint northeast)
	//*- ObjC: -(ParseQuery*)whereWithinGeoBox:(NSString*)key southwest:(ParseGeoPoint*)southwest northeast:(ParseGeoPoint*)northeast;
	//Add a constraint to the query that requires a particular key's coordinates be contained within a given rectangular geographic bounding box.
	results = [ParseQuery registerInstanceMethod:@"whereWithinGeoBox"
										selector:@selector(whereWithinGeoBox:southwest:northeast:)
									 returnValue:[ParseQuery className]
									   arguments:[NSString className],[ParseGeoPoint className], [ParseGeoPoint className], nil];
	DLog(@"Registered whereWithinGeoBox = %@", (results ? @"YES" : @"NO"));

	//*- Java: public ParseQuery<T> whereMatches(String key,String regex)
	//*- ObjC: -(ParseQuery*)whereMatches:(NSString*)key regex:(NSString*)regex;
	//Add a regular expression constraint for finding string values that match the provided regular expression. This may be slow for large datasets.
	results = [ParseQuery registerInstanceMethod:@"whereMatches"
										selector:@selector(whereMatches:regex:)
									 returnValue:[ParseQuery className]
									   arguments:[NSString className],[NSString className], nil];
	DLog(@"Registered whereMatches = %@", (results ? @"YES" : @"NO"));

	//*- Java: public ParseQuery<T> whereMatches(String key,String regex,String modifiers)
	//*- ObjC: -(ParseQuery*)whereMatches:(NSString*)key regex:(NSString*)regex modifiers:(NSString*)modifiers;
	//Add a regular expression constraint for finding string values that match the provided regular expression. This may be slow for large datasets.
	results = [ParseQuery registerInstanceMethod:@"whereMatches"
										selector:@selector(whereMatches:regex:modifiers:)
									 returnValue:[ParseQuery className]
									   arguments:[NSString className],[NSString className],[NSString className], nil];
	DLog(@"Registered whereMatches = %@", (results ? @"YES" : @"NO"));

	//*- Java: public ParseQuery<T> whereContains(String key,String substring)
	//*- ObjC: -(ParseQuery*)whereContains:(NSString*)key substring:(NSString*)substring;
	//Add a constraint for finding string values that contain a provided string. This will be slow for large datasets.
	results = [ParseQuery registerInstanceMethod:@"whereContains"
										selector:@selector(whereContains:substring:)
									 returnValue:[ParseQuery className]
									   arguments:[NSString className],[NSString className], nil];
	DLog(@"Registered whereContains = %@", (results ? @"YES" : @"NO"));


	//*- Java: public ParseQuery<T> whereStartsWith(String key,String prefix)
	//*- ObjC: -(ParseQuery*)whereStartsWith:(NSString*)key prefix:(NSString*)prefix;
	//Add a constraint for finding string values that contain a provided string. This will be slow for large datasets.
	//Add a constraint for finding string values that start with a provided string. This query will use the backend index, so it will be fast even for large datasets.
	results = [ParseQuery registerInstanceMethod:@"whereStartsWith"
										selector:@selector(whereStartsWith:prefix:)
									 returnValue:[ParseQuery className]
									   arguments:[NSString className],[NSString className], nil];
	DLog(@"Registered whereStartsWith = %@", (results ? @"YES" : @"NO"));

	//*- Java: public ParseQuery<T> whereEndsWith(String key,String suffix)
	//*- ObjC: -(ParseQuery*)whereEndsWith:(NSString*)key suffix:(NSString*)suffix;
	//Add a constraint for finding string values that end with a provided string. This will be slow for large datasets.
	results = [ParseQuery registerInstanceMethod:@"whereEndsWith"
										selector:@selector(whereEndsWith:prefix:)
									 returnValue:[ParseQuery className]
									   arguments:[NSString className],[NSString className], nil];
	DLog(@"Registered whereEndsWith = %@", (results ? @"YES" : @"NO"));


	//*- Java: public void include(String key)
	//*- ObjC: -(void)include:(NSString*)key;
	//Include nested ParseObjects for the provided key. You can use dot notation to specify which fields in the included object that are also fetched.
	results = [ParseQuery registerInstanceMethod:@"include"
										selector:@selector(include:)
									 returnValue:nil
									   arguments:[NSString className], nil];
	DLog(@"Registered include = %@", (results ? @"YES" : @"NO"));

	//*- Java: public void selectKeys(Collection<String> keys)
	//*- ObjC: -(void)selectKeys:(JavaArrayList*)keys;
	//Restrict the fields of returned ParseObjects to only include the provided keys. If this is called multiple times, then all of the keys specified in each of the calls will be included.
	//results = [ParseQuery registerInstanceMethod:@"selectKeys"
	//									selector:@selector(selectKeys:)
	//								 returnValue:nil
	//								   arguments:[JavaList className], nil];
	//DLog(@"Registered selectKeys = %@", (results ? @"YES" : @"NO"));

	//*- Java: public ParseQuery<T> whereExists(String key)
	//*- ObjC: -(ParseQuery*)whereExists:(NSString*)key;
	//Add a constraint for finding objects that contain the given key.
	results = [ParseQuery registerInstanceMethod:@"whereExists"
										selector:@selector(whereExists:)
									 returnValue:[ParseQuery className]
									   arguments:[NSString className], nil];
	DLog(@"Registered whereExists = %@", (results ? @"YES" : @"NO"));

	//*- Java: public ParseQuery<T> whereDoesNotExist(String key)
	//*- ObjC: -(ParseQuery*)whereDoesNotExist:(NSString*)key
	//Add a constraint for finding objects that do not contain a given key.
	results = [ParseQuery registerInstanceMethod:@"whereDoesNotExist"
										selector:@selector(whereDoesNotExist:)
									 returnValue:[ParseQuery className]
									   arguments:[NSString className], nil];
	DLog(@"Registered whereDoesNotExist = %@", (results ? @"YES" : @"NO"));

	//*- Java: public ParseQuery<T> orderByAscending(String key)
	//*- ObjC: -(ParseQuery*)orderByAscending:(NSString*)key
	//Sorts the results in ascending order by the given key.
	results = [ParseQuery registerInstanceMethod:@"orderByAscending"
										selector:@selector(orderByAscending:)
									 returnValue:[ParseQuery className]
									   arguments:[NSString className], nil];
	DLog(@"Registered orderByAscending = %@", (results ? @"YES" : @"NO"));


	//*- Java: public ParseQuery<T> addAscendingOrder(String key)
	//*- ObjC: -(ParseQuery*)addAscendingOrder:(NSString*)key
	//Also sorts the results in ascending order by the given key. The previous sort keys have precedence over this key.
	results = [ParseQuery registerInstanceMethod:@"addAscendingOrder"
										selector:@selector(addAscendingOrder:)
									 returnValue:[ParseQuery className]
									   arguments:[NSString className], nil];
	DLog(@"Registered addAscendingOrder = %@", (results ? @"YES" : @"NO"));


	//*- Java: public ParseQuery<T> orderByDescending(String key)
	//*- ObjC: -(ParseQuery*)orderByDescending:(NSString*)key;
	//Sorts the results in descending order by the given key.
	results = [ParseQuery registerInstanceMethod:@"orderByDescending"
										selector:@selector(orderByDescending:)
									 returnValue:[ParseQuery className]
									   arguments:[NSString className], nil];
	DLog(@"Registered orderByDescending = %@", (results ? @"YES" : @"NO"));


	//*- Java: public ParseQuery<T> addDescendingOrder(String key)
	//*- ObjC: -(ParseQuery*)addDescendingOrder:(NSString*)key;
	//Also sorts the results in descending order by the given key. The previous sort keys have precedence over this key.
	results = [ParseQuery registerInstanceMethod:@"addDescendingOrder"
										selector:@selector(addDescendingOrder:)
									 returnValue:[ParseQuery className]
									   arguments:[NSString className], nil];
	DLog(@"Registered addDescendingOrder = %@", (results ? @"YES" : @"NO"));

	//*- Java: public void setLimit(int newLimit)
	//*- ObjC: -(void)setLimit:(int)newLimit;
	//Controls the maximum number of results that are returned. Setting a negative limit denotes retrieval without a limit. The default limit is 100, with a maximum of 1000 results being returned at a time.
	results = [ParseQuery registerInstanceMethod:@"setLimit"
										selector:@selector(setLimit:)
									 returnValue:nil
									   arguments:[JavaClass intPrimitive], nil];
	DLog(@"Registered setLimit = %@", (results ? @"YES" : @"NO"));


	//*- Java: public void setTrace(boolean shouldTrace)
	//*- ObjC: -(void)setTrace:(bool)shouldTrace;
	//Turn on performance tracing of finds. If performance tracing is already turned on this does nothing. In general you don't need to call trace.
	//results = [ParseQuery registerInstanceMethod:@"shouldTrace"
	//									selector:@selector(shouldTrace:)
	//								 returnValue:nil
	//								   arguments:[JavaClass boolPrimitive], nil];
	//DLog(@"Registered shouldTrace = %@", (results ? @"YES" : @"NO"));


	//*- Java: public int getLimit()
	//*- ObjC: -(int)getLimit;
	//Accessor for the limit.
	results = [ParseQuery registerInstanceMethod:@"getLimit"
										selector:@selector(getLimit)
									 returnValue:[JavaClass intPrimitive]
									   arguments:nil];
	DLog(@"Registered getLimit = %@", (results ? @"YES" : @"NO"));


	//*- Java: public void setSkip(int newSkip)
	//*- ObjC: -(void)setSkip:(int)newSkip;
	//Controls the number of results to skip before returning any results. This is useful for pagination. Default is to skip zero results.
	results = [ParseQuery registerInstanceMethod:@"setSkip"
										selector:@selector(setSkip:)
									 returnValue:nil
									   arguments:[JavaClass intPrimitive],nil];
	DLog(@"Registered setSkip = %@", (results ? @"YES" : @"NO"));


	//*- Java: public int getSkip()
	//*- ObjC: -(int)getSkip;
	//Accessor for the skip value.
	results = [ParseQuery registerInstanceMethod:@"getSkip"
										selector:@selector(getSkip)
									 returnValue:[JavaClass intPrimitive]
									   arguments:nil];
	DLog(@"Registered getSkip = %@", (results ? @"YES" : @"NO"));
 

	//*- Java: public String getClassName()
	//*- ObjC: -(NSString*)getClassName;
	//Accessor for the class name.
	results = [ParseQuery registerInstanceMethod:@"getClassName"
										selector:@selector(getClassName)
									 returnValue:[NSString className]
									   arguments:nil];
	DLog(@"Registered getClassName = %@", (results ? @"YES" : @"NO"));

	
}

+ (NSString *)className
{
    return @"com.parse.ParseQuery";
}
/*
-(NSArray*)find{
	return [[self _find] toArray];
}*/

@end
