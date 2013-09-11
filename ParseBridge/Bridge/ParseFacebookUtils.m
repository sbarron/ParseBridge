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
#import "MySaveCallback.h"
#import <BridgeKit/AndroidActivity.h>
#import <BridgeKit/JavaList.h>
#import <BridgeKit/JavaClass.h>
#import "MyLogInCallback.h"


@implementation ParseFacebookUtils

+ (void)initializeJava
{
    [super initializeJava];
	BOOL result;


     //NOTES ABOUT SINGLE SIGN-ON  
	 /*
	  Facebook's Android SDK provides an enhanced login experience on devices that have Facebook's official Android app installed. This allows users of apps that support Facebook login to sign in directly through the Facebook app, using credentials that are already on the device. If the Facebook app is not installed, the default dialog-based authentication will be used. Facebook calls this feature "Single sign-on," and requires you to override onActivityResult() in your calling Activity to invoke finishAuthentication().
	  
	  @Override
	  protected void onActivityResult(int requestCode, int resultCode, Intent data) {
	  super.onActivityResult(requestCode, resultCode, data);
	  ParseFacebookUtils.finishAuthentication(requestCode, resultCode, data);
	  }
	  If your Activity is already using onActivityResult(), you can avoid requestCode collisions by calling the versions of link() and logIn() that take an activityCode parameter and specifying a code you know to be unique. Otherwise, a sensible default activityCode will be used.
	 */

	//@Deprecated
	//public static com.facebook.android.Facebook getFacebook()
		
	//public static com.facebook.Session getSession()
	//Returns:	The active Facebook session associated with the logged in ParseUser, or null if there is none.

	//public static boolean isLinked(ParseUser user)
	//Returns true if the user is linked to a Facebook account.
	//*- ObjC: + isLinkedWithUser:(PFUser*)
	result = [ParseFacebookUtils registerStaticMethod:@"isLinked"
											 selector:@selector(isLinkedWithUser:)
										  returnValue:[JavaClass boolPrimitive]
											arguments:[ParseUser className], NULL];
	DLog(@"Registered isLinked = %@", (result ? @"YES" : @"NO"));
		
		
	//*- Java; public static void initialize(String appId)
    //*- Objc: + initializeFacebook
	result = [ParseFacebookUtils registerStaticMethod:@"initialize"
											 selector:@selector(initializeWithApplicationId:)
										  returnValue:nil
											arguments:[NSString className], NULL];
	DLog(@"Registered initialize = %@", (result ? @"YES" : @"NO"));
	//Initializes Facebook for use with Parse. Here, you can provide the set of permissions that will be used when accessing Facebook, and toggle whether Facebook's single sign-on feature should be used when calling ParseFacebookUtils.logIn(Activity, int, LogInCallback) or ParseFacebookUtils.link(ParseUser, Activity, int, SaveCallback). You may invoke this method more than once if you need to change the appId.
	//IMPORTANT: If you choose to enable single sign-on, you must override the Activity.onActivityResult(int, int, android.content.Intent) method to invoke ParseFacebookUtils.finishAuthentication(int, int, Intent).
				
				
					
	//public static void unlink(ParseUser user)    throws ParseException
	//Unlinks a user from a Facebook account. Unlinking a user will save the user's data.
	result = [ParseFacebookUtils registerStaticMethod:@"unlink"
											 selector:@selector(unlink:)
										  returnValue:nil
											arguments:[ParseUser className], NULL];
	DLog(@"Registered unlink = %@", (result ? @"YES" : @"NO"));
	
	//public static void unlinkInBackground(ParseUser user)
	result = [ParseFacebookUtils registerStaticMethod:@"unlinkInBackground"
											 selector:@selector(unlinkInBackground:)
										  returnValue:nil
											arguments:[ParseUser className],NULL];
	DLog(@"Registered unlinkInBackground = %@", (result ? @"YES" : @"NO"));
	
	//public static void unlinkInBackground(ParseUser user,  SaveCallback callback)
	//+(void)unlinkInBackground:(ParseUser*)user callback:(SaveCallback*)callback;
	//Unlinks a user from a Facebook account in the background. Unlinking a user will save the user's data.
	result = [ParseFacebookUtils registerStaticMethod:@"unlinkInBackground"
											 selector:@selector(unlinkInBackground:callback:)
										  returnValue:nil
											arguments:[ParseUser className], [SaveCallback className],NULL];
	DLog(@"Registered unlinkInBackground2 = %@", (result ? @"YES" : @"NO"));
	
					
	//public static void link(ParseUser user,String facebookId,String accessToken,Date expirationDate)
					
	//public static void link(ParseUser user,String facebookId,String accessToken,Date expirationDate,SaveCallback callback)
	//Links a ParseUser to a Facebook account, allowing you to use Facebook for authentication, and providing access to Facebook data for the user. This method allows you to handle getting access tokens for the user yourself, rather than delegating to the Facebook SDK.
														
	//public static void link(ParseUser user,Collection<String> permissions,Activity activity,int activityCode,SaveCallback callback)
	//Links a ParseUser to a Facebook account, allowing you to use Facebook for authentication, and providing access to Facebook data for the user. This method delegates to the Facebook SDK's authenticate() method.
	//IMPORTANT: Note that single sign-on authentication will not function correctly if you do not include a call to the finishAuthentication() method in your onActivityResult() function! Please see below for more information.
	//Starts either an Activity or a dialog which prompts the user to log in to Facebook and grant the requested permissions to the given application.
	//This method will, when possible, use Facebook's single sign-on for Android to obtain an access token. This involves proxying a call through the Facebook for Android stand-alone application, which will handle the authentication flow, and return an OAuth access token for making API calls.
	//Because this process will not be available for all users, if single sign-on is not possible, this method will automatically fall back to the OAuth 2.0 User-Agent flow. In this flow, the user credentials are handled by Facebook in an embedded WebView, not by the client application. As such, the dialog makes a network request and renders HTML content rather than a native UI. The access token is retrieved from a redirect to a special URL that the WebView handles.
											
	//public static void link(ParseUser user,Collection<String> permissions,Activity activity,SaveCallback callback)
	//Links a user using the default activity code if single sign-on is enabled.
													
	//public static void link(ParseUser user,Collection<String> permissions,Activity activity,int activityCode)
				
	//public static void link(ParseUser user,Collection<String> permissions,Activity activity)
														
	//public static void link(ParseUser user,Activity activity,int activityCode,SaveCallback callback)
	
	//public static void link(ParseUser user,Activity activity,SaveCallback callback)
	//  +(void)linkWithUser:(ParseUser*)user activity:(AndroidActivity*)activity callback:(SaveCallback*)callback;
	result = [ParseFacebookUtils registerStaticMethod:@"link"
											 selector:@selector(linkWithUser:activity:callback:)
										  returnValue:nil
											arguments:[ParseUser className],[AndroidActivity className], [SaveCallback className], NULL];
	DLog(@"Registered link with user = %@", (result ? @"YES" : @"NO"));
	
	
	
	
	
	
	//public static void link(ParseUser user,Activity activity,int activityCode)
														
	//public static void link(ParseUser user,Activity activity)
														
	//public static void logIn(String facebookId, String accessToken, Date expirationDate, LogInCallback callback)
	//Logs in a ParseUser using Facebook for authentication. If a user for the given Facebook credentials does not already exist, a new user will be created. This method allows you to handle getting access tokens for the user yourself, rather than delegating to the Facebook SDK.
															
																	
	//public static void logIn(Collection<String> permissions,Activity activity,int activityCode,LogInCallback callback)
	//Logs in a ParseUser using Facebook for authentication. If a user for the given Facebook credentials does not already exist, a new user will be created. This method delegates to the Facebook SDK's authenticate() method.
	//IMPORTANT: Note that single sign-on authentication will not function correctly if you do not include a call to the finishAuthentication() method in your onActivityResult() function! Please see below for more information.
																			
	//public static void logIn(Activity activity, int activityCode, LogInCallback callback)
	
	
																																												
	//public static void logIn(Collection<String> permissions, Activity activity, LogInCallback callback)
	result = [ParseFacebookUtils registerStaticMethod:@"logIn"
											 selector:@selector(logInWithPermissions:activity:callback:)
										  returnValue:nil
											arguments:[JavaObject className],[AndroidActivity className],[LogInCallback className], NULL];
	DLog(@"Registered login with permissions = %@", (result ? @"YES" : @"NO"));
	
	
 
	//*- Java:public static void logIn(Activity activity,LogInCallback callback)
	//*- ObjC:+(void)logIn:(AndroidActivity*)activity callback:(LogInCallback*)callback;
	result = [ParseFacebookUtils registerStaticMethod:@"logIn"
											 selector:@selector(logIn:callback:)
										  returnValue:nil
											arguments:[AndroidActivity className],[LogInCallback className], NULL];
	DLog(@"Registered login = %@", (result ? @"YES" : @"NO"));
																						
	//public static void finishAuthentication(int requestCode,int resultCode,Intent data)
	//Completes authentication after the Facebook app returns an activity result. IMPORTANT: This method must be invoked at the top of the calling activity's onActivityResult() function or Facebook authentication will not function properly!
	//If your calling activity does not currently implement onActivityResult(), you must implement it and include a call to this method if you intend to use the ParseFacebookUtils.logIn(Activity, int, LogInCallback) or ParseFacebookUtils.link(ParseUser, Activity, int, SaveCallback) methods in ParseFacebookUtilities . For more information, see http://developer.android.com/reference/android/app/ Activity.html#onActivityResult(int, int, android.content.Intent)
				
				
				
	
	
	//*- Java: public static void saveLatestSessionData(ParseUser user,SaveCallback callback)
	//*- ObjC: + (void)saveLatestSessionDataWithCallback:(ParseUser*)user callback:(SaveCallback*)callback;
	result = [ParseFacebookUtils registerStaticMethod:@"saveLatestSessionData"
											 selector:@selector(saveLatestSessionDataWithCallback:callback:)
										  returnValue:nil
											arguments:[ParseUser className],[SaveCallback className],nil];
	DLog(@"Registered saveLatestSessionData1 = %@", (result ? @"YES" : @"NO"));
	//Saves the latest session data to the user. Call this after requesting new read or publish permissions for the user's Facebook session.
	
	
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

+ (void)initializeFacebook{
	
	NSBundle* bundle = [NSBundle mainBundle];
	NSString* appId = [bundle objectForInfoDictionaryKey:@"FacebookAppID"];
	NSLog(@"appId = %@", appId);
	return [self initializeWithApplicationId:appId];
}
@end
