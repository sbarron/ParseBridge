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

#import "ParsePush.h"

@implementation ParsePush

+ (void)initializeJava
{
    [super initializeJava];
	
	//Constructor
	//*- Java:  ParsePush()
	BOOL results;
	results = [ParsePush registerConstructorWithSelector:@selector(init)
												arguments:nil];
	DLog(@"ParsePush Registered init =  %@", (results ? @"YES" : @"NO"));
	
	/*
	Creates a new push notification. The default channel is the empty string, also known as the global broadcast channel, but this value can be overridden using ParsePush.setChannel(String), ParsePush.setChannels(Collection) or ParsePush.setQuery(ParseQuery). Before sending the push notification you must call either ParsePush.setMessage(String) or ParsePush.setData(JSONObject).
	*/
	
	
	//*- Java:  public static void sendMessageInBackground(String message, ParseQuery<ParseInstallation> query)
	//A helper method to concisely send a push message to a query. This method is equivalent to ParsePush push = new ParsePush(); push.setMessage(message); push.setQuery(query); push.sendInBackground();
 

//*- Java:  public static void sendMessageInBackground(String message, ParseQuery<ParseInstallation> query,SendCallback callback)
	//A helper method to concisely send a push message to a query. This method is equivalent to ParsePush push = new ParsePush(); push.setMessage(message); push.setQuery(query); push.sendInBackground(callback);
 
//*- Java:  public static void sendDataInBackground(JSONObject data,ParseQuery<ParseInstallation> query)
    //A helper method to concisely send a push to a query. This method is equivalent to ParsePush push = new ParsePush(); push.setData(data); push.setQuery(query); push.sendInBackground();
 
//*- Java:  public static void sendDataInBackground(JSONObject data,ParseQuery<ParseInstallation> query,SendCallback callback)
	//A helper method to concisely send a push to a query. This method is equivalent to ParsePush push = new ParsePush(); push.setData(data); push.setQuery(query); push.sendInBackground(callback);
 

//*- Java:  public void setChannel(String channel)
	//Sets the channel on which this push notification will be sent. The channel name must start with a letter and contain only letters, numbers, dashes, and underscores. A push can either have channels or a query. Setting this will unset the query.

//*- Java:  public void setChannels(Collection<String> channels)
	//Sets the collection of channels on which this push notification will be sent. Each channel name must start with a letter and contain only letters, numbers, dashes, and underscores. A push can either have channels or a query. Setting this will unset the query.
 

//*- Java:  public void setQuery(ParseQuery<ParseInstallation> query)
	//Sets the query for this push for which this push notification will be sent. This query will be executed in the Parse cloud; this push notification will be sent to Installations which this query yields. A push can either have channels or a query. Setting this will unset the channels.
 
//*- Java:  public void setExpirationTime(long time)
	//Sets a UNIX epoch timestamp at which this notification should expire, in seconds (UTC). This notification will be sent to devices which are either online at the time the notification is sent, or which come online before the expiration time is reached. Because device clocks are not guaranteed to be accurate, most applications should instead use ParsePush.setExpirationTimeInterval(long).
 
//*- Java:  public void setExpirationTimeInterval(long timeInterval)
	//Sets the time interval after which this notification should expire, in seconds. This notification will be sent to devices which are either online at the time the notification is sent, or which come online within the given number of seconds of the notification being received by Parse's server. An interval which is less than or equal to zero indicates that the message should only be sent to devices which are currently online.
 
//*- Java:  public void clearExpiration()
	//Clears both expiration values, indicating that the notification should never expire.


//*- Java:  public void setData(JSONObject data)
	//Sets the entire data of the push message. See the push guide for more details on the data format. This will overwrite any data specified in ParsePush.setMessage(String).
 

//*- Java:  public void setMessage(String message)
	//Sets the message that will be shown in the notification. This will overwrite any data specified in ParsePush.setData(JSONObject).
 
//*- Java:  public void send()   throws ParseException 
	//Sends this push notification while blocking this thread until the push notification has successfully reached the Parse servers. Typically, you should use ParsePush.sendInBackground() instead of this, unless you are managing your own threading.
 
//*- Java:  public void sendInBackground(SendCallback callback)
	//Sends this push notification in a background thread. This is preferable to using send(), unless your code is already running from a background thread.
 

//*- Java:  public void sendInBackground()
	//Sends this push notification in a background thread. Use this when you do not have code to run on completion of the push.

	
}

+ (NSString *)className
{
    return @"com.parse.ParsePush";
}

@end
