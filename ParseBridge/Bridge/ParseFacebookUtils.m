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

#import "ParseFacebookUtils.h"
#import "ParseUser.h"
#import "SaveCallback.h"
#import <BridgeKit/AndroidActivity.h>
#import <BridgeKit/JavaList.h>
#import <BridgeKit/JavaClass.h>
#import "LogInCallback.h"
#import <FacebookSDK/FacebookSDK.h>

@implementation ParseFacebookUtils

+ (void)initializeJava
{
    [super initializeJava];
	BOOL result;
    //*- Java; public static void initialize(String appId)
    //*- Objc: + initializeFacebook
	result = [ParseFacebookUtils registerStaticMethod:@"initialize"
								selector:@selector(initializeFacebook:)
							 returnValue:nil
							   arguments:[NSString className], NULL];
	DLog(@"Registered initialize = %@", (result ? @"YES" : @"NO"));
	

    //*- ObjC: + isLinkedWithUser:(PFUser*)
	result = [ParseFacebookUtils registerStaticMethod:@"isLinked"
									selector:@selector(isLinkedWithUser:)
								 returnValue:[JavaClass boolPrimitive]
								   arguments:[ParseUser className], NULL];
	DLog(@"Registered isLinked = %@", (result ? @"YES" : @"NO"));
	
    //*- Java: public static void link(ParseUser user, Collection<String> permissions, Activity activity, SaveCallback callback)
    //*- ObjC: + linkUser:(PFUser*) permissions:(NSSArray*) block:(BOOL succeeded, NSError *error)
    result = [ParseFacebookUtils registerStaticMethod:@"link"
                                    selector:@selector(linkUser:permissions:block:)
                                 returnValue:nil
                                   arguments:[ParseUser className], [JavaList className], [AndroidActivity className], [SaveCallback className],nil];
	DLog(@"Registered link = %@", (result ? @"YES" : @"NO"));
				
	
	//*- Java: public static void link(ParseUser user, String facebookId, String accessToken,Date expirationDate)
	
	
	//*- Java: public static void link(ParseUser user,String facebookId,String accessToken,Date expirationDate,SaveCallback callback)
	//Links a ParseUser to a Facebook account, allowing you to use Facebook for authentication, and providing access to Facebook data for the user. This method allows you to handle getting access tokens for the user yourself, rather than delegating to the Facebook SDK.
	
	
	//public static void link(ParseUser user,Collection<String> permissions,Activity activity,int activityCode,SaveCallback callback)
	//Links a ParseUser to a Facebook account, allowing you to use Facebook for authentication, and providing access to Facebook data for the user. This method delegates to the Facebook SDK's authenticate() method. IMPORTANT: Note that single sign-on authentication will not function correctly if you do not include a call to the finishAuthentication() method in your onActivityResult() function! Please see below for more information.
	
	
	//*- Java: public static void link(ParseUser user,Collection<String> permissions,Activity activity,SaveCallback callback)
	
	//*- Java: public static void link(ParseUser user,Collection<String> permissions,Activity activity,int activityCode)
	
	//*- Java: public static void link(ParseUser user,Activity activity,int activityCode,SaveCallback callback)
	
	
	//*- Java: public static void link(ParseUser user,Activity activity,SaveCallback callback)
	
	//*- Java:public static void link(ParseUser user,Activity activity,int activityCode)
	
	
	//*- Java:public static void link(ParseUser user,Activity activity)
    
	//*- Java:public static void logIn(String facebookId,String accessToken,Date expirationDate,LogInCallback callback)
	//Logs in a ParseUser using Facebook for authentication. If a user for the given Facebook credentials does not already exist, a new user will be created. This method allows you to handle getting access tokens for the user yourself, rather than delegating to the Facebook SDK.
	
	//*- Java: public static void logIn(Collection<String> permissions,Activity activity,int activityCode,LogInCallback callback)
	//Logs in a ParseUser using Facebook for authentication. If a user for the given Facebook credentials does not already exist, a new user will be created. This method delegates to the Facebook SDK's authenticate() method.IMPORTANT: Note that single sign-on authentication will not function correctly if you do not include a call to the finishAuthentication() method in your onActivityResult() function! Please see below for more information.
	
	//*- Java:public static void logIn(Activity activity,int activityCode,LogInCallback callback)
	//*- Java:public static void logIn(Collection<String> permissions,Activity activity,LogInCallback callback)
	//Logs in a user using the default activity code if single sign-on is enabled.
	
	
	//*- Java:public static void logIn(Activity activity,LogInCallback callback)
	//*- ObjC:+(void)logIn:(AndroidActivity*)activity callback:(LogInCallback*)callback;
	result = [ParseFacebookUtils registerStaticMethod:@"login"
									selector:@selector(logInWithPermissions:)
								 returnValue:nil
								   arguments:[AndroidActivity className],[LogInCallback className], NULL];
	DLog(@"Registered login = %@", (result ? @"YES" : @"NO"));
	
//*- Java: public static com.facebook.Session getSession()
//The active Facebook session associated with the logged in ParseUser, or null if there is none.
 

//*- Java: public static void initialize(String appId)
//Initializes Facebook for use with Parse. Here, you can provide the set of permissions that will be used when accessing Facebook, and toggle whether Facebook's single sign-on feature should be used when calling ParseFacebookUtils.logIn(Activity, int, LogInCallback) or ParseFacebookUtils.link(ParseUser, Activity, int, SaveCallback). You may invoke this method more than once if you need to change the appId.  IMPORTANT: If you choose to enable single sign-on, you must override the Activity.onActivityResult(int, int, android.content.Intent) method to invoke ParseFacebookUtils.finishAuthentication(int, int, Intent).



//*- Java:  public static void unlink(ParseUser user)
                  
//*- Java: public static void unlinkInBackground(ParseUser user)


//*- Java:public static void unlinkInBackground(ParseUser user,SaveCallback callback)
//Unlinks a user from a Facebook account in the background. Unlinking a user will save the user's data.

 


//*- Java: public static void finishAuthentication(int requestCode,int resultCode,Intent data)
//Completes authentication after the Facebook app returns an activity result. IMPORTANT: This method must be invoked at the top of the calling activity's onActivityResult() function or Facebook authentication will not function properly! If your calling activity does not currently implement onActivityResult(), you must implement it and include a call to this method if you intend to use the ParseFacebookUtils.logIn(Activity, int, LogInCallback) or ParseFacebookUtils.link(ParseUser, Activity, int, SaveCallback) methods in ParseFacebookUtilities . For more information, see http://developer.android.com/reference/android/app/ Activity.html#onActivityResult(int, int, android.content.Intent)


//*- Java: public static void saveLatestSessionData(ParseUser user,SaveCallback callback)
//*- ObjC: + (void)saveLatestSessionDataWithCallback:(ParseUser*)user callback:(SaveCallback*)callback;
	result = [ParseFacebookUtils registerStaticMethod:@"saveLatestSessionData"
									selector:@selector(saveLatestSessionDataWithCallback:callback:)
								 returnValue:nil
								   arguments:[ParseUser className],[SaveCallback className],nil];
	DLog(@"Registered saveLatestSessionData1 = %@", (result ? @"YES" : @"NO"));


//*- Java:  public static void saveLatestSessionData(ParseUser user)
//*- ObjC: + (void)saveLatestSessionData:(ParseUser*)user;
	result = [ParseFacebookUtils registerStaticMethod:@"saveLatestSessionData"
											 selector:@selector(saveLatestSessionData:)
										  returnValue:nil
											arguments:[ParseUser className],nil];
	DLog(@"Registered saveLatestSessionData2 = %@", (result ? @"YES" : @"NO"));

}

+ (NSString *)className
{
    return @"com.parse.ParseFacebookUtils";
}


@end
