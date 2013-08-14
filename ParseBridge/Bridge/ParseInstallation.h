//
//  ParseInstallation.h
//  ParseBridge
//
//  Created by Spencer Barron on 8/13/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

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
