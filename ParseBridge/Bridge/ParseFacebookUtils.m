//
//  ParseFacebookUtils.m
//  ParseBridge
//
//  Created by Spencer Barron on 7/7/13.
//  Copyright (c) 2013 Spencer Barron. All rights reserved.
//

#import "ParseFacebookUtils.h"
#import <BridgeKit/AndroidActivity.h>
#import <BridgeKit/JavaList.h>
#import "LogInCallBack.h"

@implementation ParseFacebookUtils

+ (void)initializeJava
{
    [super initializeJava];

    //*- Java; public static void initialize(String appId)
    //*- Objc: + initializeFacebook
	[ParseFacebookUtils registerStaticMethod:@"initialize"
								selector:@selector(initializeFacebook:)
							 returnValue:nil
							   arguments:[NSString className], NULL];

    //*- ObjC: + isLinkedWithUser:(PFUser*)
	[ParseFacebookUtils registerStaticMethod:@"isLinked"
									selector:@selector(isLinkedWithUser:)
								 returnValue:[JavaClass boolPrimitive]
								   arguments:[ParseUser className], NULL];
	
    //*- Java: public static void link(ParseUser user, Collection<String> permissions, Activity activity, SaveCallback callback)
    //*- ObjC: + linkUser:(PFUser*) permissions:(NSSArray*) block:(BOOL succeeded, NSError *error)
    [ParseFacebookUtils registerStaticMethod:@"link"
                                    selector:@selector(linkUser:permissions:block:)
                                 returnValue:nil
                                   arguments:[ParseUser className], [JavaList className], [AndroidActivity className], nil];
    
	[ParseFacebookUtils registerStaticMethod:@"login"
									selector:@selector(logInWithPermissions:)
								 returnValue:nil
								   arguments:[JavaList className], [AndroidActivity className],[LogInCallBack className], NULL];
				
	[ParseFacebookUtils registerCallback:@"bridgeCallback"
						 selector:@selector(logInWithPermissions)
					  returnValue:nil
						arguments:[JavaClass intPrimitive], [JavaClass doublePrimitive], nil];

	
//*- Java: public static com.facebook.Session getSession()
//The active Facebook session associated with the logged in ParseUser, or null if there is none.
 

//*- Java: public static void initialize(String appId)
//Initializes Facebook for use with Parse. Here, you can provide the set of permissions that will be used when accessing Facebook, and toggle whether Facebook's single sign-on feature should be used when calling ParseFacebookUtils.logIn(Activity, int, LogInCallback) or ParseFacebookUtils.link(ParseUser, Activity, int, SaveCallback). You may invoke this method more than once if you need to change the appId.  IMPORTANT: If you choose to enable single sign-on, you must override the Activity.onActivityResult(int, int, android.content.Intent) method to invoke ParseFacebookUtils.finishAuthentication(int, int, Intent).



//*- Java:  public static void unlink(ParseUser user)
                  
//*- Java: public static void unlinkInBackground(ParseUser user)


//*- Java:public static void unlinkInBackground(ParseUser user,SaveCallback callback)
//Unlinks a user from a Facebook account in the background. Unlinking a user will save the user's data.

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


//*- Java: public static void finishAuthentication(int requestCode,int resultCode,Intent data)
//Completes authentication after the Facebook app returns an activity result. IMPORTANT: This method must be invoked at the top of the calling activity's onActivityResult() function or Facebook authentication will not function properly! If your calling activity does not currently implement onActivityResult(), you must implement it and include a call to this method if you intend to use the ParseFacebookUtils.logIn(Activity, int, LogInCallback) or ParseFacebookUtils.link(ParseUser, Activity, int, SaveCallback) methods in ParseFacebookUtilities . For more information, see http://developer.android.com/reference/android/app/ Activity.html#onActivityResult(int, int, android.content.Intent)


//*- Java: public static void saveLatestSessionData(ParseUser user,SaveCallback callback)


//*- Java:  public static void saveLatestSessionData(ParseUser user)


+ (NSString *)className
{
    return @"com.parse.ParseFacebookUtils";
}


@end
