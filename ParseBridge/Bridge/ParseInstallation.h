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
#import "ParseObject.h"

@class SaveCallback;
@class ParseQuery;

@interface ParseInstallation : ParseObject

//*- Java:  public static ParseInstallation getCurrentInstallation()
+(ParseInstallation*)getCurrentInstallation;

//*- Java: public static ParseQuery<ParseInstallation> getQuery()
+(ParseQuery*)getQuery;
//Constructs a query for ParseInstallations.

//*- Java:  public String getInstallationId()
-(NSString*)getInstallationId;
//Returns the unique ID of this installation.

//*- Java: public void put(String key, Object value)
-(void)forKey:(NSString*)key setObject:(id)value;
//Description copied from class: ParseObject - Add a key-value pair to this object. It is recommended to name keys in partialCamelCaseLikeThis. Overrides: put in class ParseObject
//Parameters:
//key - Keys must be alphanumerical plus underscore, and start with a letter.
//value - Values may be numerical, String, JSONObject, JSONArray, JSONObject.NULL, or other ParseObjects. value may not be null.


//*- Java:  public void remove(String key)
-(void)remove:(NSString*)key;
// Description copied from class: ParseObject
//Removes a key from this object's data if it exists.
//Overrides: remove in class ParseObject

//*- Java:  public void saveEventually(SaveCallback callback)
-(void)saveEventually:(SaveCallback*)callback;

@end
