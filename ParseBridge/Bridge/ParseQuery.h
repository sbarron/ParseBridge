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
@class ParseObject;
@class ParseGeoPoint;
@class JavaArrayList;
@class JavaSet;
@class JavaList;

@class FindCallback;
@class GetCallback;
@class CountCallback;

@interface ParseQuery : JavaObject

//*- Java:  public ParseQuery(Class<T> subclass)
-(id)initWithParseObject:(ParseObject*)object;

//*- Java:  public ParseQuery(String theClassName)
-(id)initWithClassName:(NSString*)theClassName;

-(ParseQuery*)queryWithClassName:(NSString*)theClassName;

-(ParseQuery*)queryWithObject:(ParseObject*)object;

-(ParseObject*)get:(NSString*)objectID;

-(void)getInBackground:(NSString*)objectID callback:(GetCallback*)callback;

+(ParseQuery*)orQuery:(JavaList*)queries;

-(void)cancel;

-(JavaList*)find;

-(ParseObject*)getFirst;

-(void)findInBackground:(FindCallback*)callback;

-(void)getFirstInBackground:(GetCallback*)callback;

-(int)count;

-(int)count:(bool)needsLock;

-(void)countInBackground:(CountCallback*)callback;

-(bool)hasCachedResult;

-(void)clearCachedResult;

-(void)clearAllCachedResults;

-(ParseQuery*)whereEqualTo:(NSString*)key value:(JavaObject*)value;

-(ParseQuery*)whereLessThan:(NSString*)key value:(JavaObject*)value;

-(ParseQuery*)whereNotEqualTo:(NSString*)key value:(JavaObject*)value;

-(ParseQuery*)whereGreaterThan:(NSString*)key value:(JavaObject*)value;

-(ParseQuery*)whereLessThanOrEqualTo:(NSString*)key value:(JavaObject*)value;

-(ParseQuery*)whereGreaterThanOrEqualTo:(NSString*)key value:(JavaObject*)value;

-(ParseQuery*)whereContainedIn:(NSString*)key values:(JavaArrayList*)values;

-(ParseQuery*)whereContainsAll:(NSString*)key values:(JavaObject*)values;

-(ParseQuery*)whereMatchesQuery:(NSString*)key query:(ParseQuery*)query;

-(ParseQuery*)whereDoesNotMatchQuery:(NSString*)key query:(ParseQuery*)query;

-(ParseQuery*)whereMatchesKeyInQuery:(NSString*)key keyInQuery:(NSString*)keyInQuery  query:(ParseQuery*)query;

-(ParseQuery*)whereDoesNotMatchKeyInQuery:(NSString*)key keyInQuery:(NSString*)keyInQuery  query:(ParseQuery*)query;

-(ParseQuery*)whereNotContainedIn:(NSString*)key values:(JavaArrayList*)values;

-(ParseQuery*)whereWithinMiles:(NSString*)key point:(ParseGeoPoint*)point maxDistance:(double)maxDistance;

-(ParseQuery*)whereWithinKilometers:(NSString*)key point:(ParseGeoPoint*)point maxDistance:(double)maxDistance;

-(ParseQuery*)whereWithinRadians:(NSString*)key point:(ParseGeoPoint*)point maxDistance:(double)maxDistance;

-(ParseQuery*)whereWithinGeoBox:(NSString*)key southwest:(ParseGeoPoint*)southwest northeast:(ParseGeoPoint*)northeast;

-(ParseQuery*)whereMatches:(NSString*)key regex:(NSString*)regex;

-(ParseQuery*)whereMatches:(NSString*)key regex:(NSString*)regex modifiers:(NSString*)modifiers;

-(ParseQuery*)whereContains:(NSString*)key substring:(NSString*)substring;

-(ParseQuery*)whereStartsWith:(NSString*)key prefix:(NSString*)prefix;

-(ParseQuery*)whereEndsWith:(NSString*)key suffix:(NSString*)suffix;

-(void)include:(NSString*)key;

-(void)selectKeys:(JavaArrayList*)keys;

-(ParseQuery*)whereExists:(NSString*)key;

-(ParseQuery*)whereDoesNotExist:(NSString*)key;

-(ParseQuery*)orderByAscending:(NSString*)key;

-(ParseQuery*)addAscendingOrder:(NSString*)key;

-(ParseQuery*)orderByDescending:(NSString*)key;

-(ParseQuery*)addDescendingOrder:(NSString*)key;

-(void)setLimit:(int)newLimit;

-(void)setTrace:(bool)shouldTrace;

-(int)getLimit;

-(void)setSkip:(int)newSkip;

-(int)getSkip;

-(NSString*)getClassName;



@end

