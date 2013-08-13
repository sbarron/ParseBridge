//
//  ParseBridge.m
//  ParseBridge
//
//  Created by Spencer Barron on 7/6/13.
//  Copyright (c) 2013 Spencer Barron. All rights reserved.


#import "ParseUser.h"

@implementation ParseUser

+ (void)initializeJava
{
    [super initializeJava];
	
	[ParseUser registerConstructorWithSelector:@selector(initUser)
                                       arguments:nil];
	//*- ObjC: + currentUser
    [ParseUser registerStaticMethod:@"getCurrentUser"
						selector:@selector(currentUser)
					 returnValue:[ParseUser className]
					   arguments:nil];

	[ParseUser registerStaticMethod:@"logOut"
								 selector:@selector(logOut)
								 returnValue:nil
					   arguments:nil];
					   
    //*- Java: public void put(String key, Object value)
    //*- ObjC: - setObject:(id) forKey:(NSString*)
    [ParseUser registerInstanceMethod:@"put"
                               selector:@selector(forKey:setObject:)
                            returnValue:nil
                              arguments:[NSString className],[JavaObject className],nil];

    //*- Java: public boolean isAuthenticated()
    //*- ObjC: - (BOOL)isAuthenticated
    [ParseUser registerInstanceMethod:@"isAuthenticated"
                               selector:@selector(isAuthenticated)
                            returnValue:[JavaClass boolPrimitive]
                              arguments:nil];

    //*- Java: public final void saveInBackground()
    //*- ObjC: - saveInBackground
    [ParseUser registerInstanceMethod:@"saveInBackground"
                               selector:@selector(saveInBackground)
                            returnValue:nil];

    //*- Java: public static void enableAutomaticUser()
    //*- ObjC: + enableAutomaticUser
    [ParseUser registerStaticMethod:@"enableAutomaticUser"
                           selector:@selector(enableAutomaticUser)
                        returnValue:nil
                          arguments:nil];

 

//*- Java: public void remove(String key)
//Description copied from class: ParseObject


//*- Java: public void setUsername(String username)
//Sets the username. Usernames cannot be null or blank.


//*- Java: public String getUsername()
//Retrieves the username.
 

//*- Java: public void setPassword(String password)
//Sets the password.
 
//*- Java: public void setEmail(String email)
//Sets the email address.

//*- Java: public String getEmail()
//Retrieves the email address.
 
 
//public String getSessionToken()
//Retrieves the session token for a user, if they are logged in.

//public ParseUser fetch()
//Description copied from class: ParseObject
 

//public void signUp()
//Signs up a new user. You should call this instead of ParseObject.save() for new ParseUsers. This will create a new ParseUser on the server, and also persist the session on disk so that you can access the user using ParseUser.getCurrentUser(). A username and password must be set before calling signUp.Typically, you should use ParseUser.signUpInBackground(com.parse.SignUpCallback) instead of this, unless you are managing your own threading.


//*- Java: public void signUpInBackground(SignUpCallback callback)
//Signs up a new user. You should call this instead of ParseObject.save() for new ParseUsers. This will create a new ParseUser on the server, and also persist the session on disk so that you can access the user using ParseUser.getCurrentUser(). This is preferable to using ParseUser.signUp(), unless your code is already running from a background thread.


//*- Java: public static ParseUser logIn(String username,String password)
//Logs in a user with a username and password. On success, this saves the session to disk, so you can retrieve the currently logged in user using ParseUser.getCurrentUser()  Typically, you should use ParseUser.logInInBackground(java.lang.String, java.lang.String, com.parse.LogInCallback) instead of this, unless you are managing your own threading.


//*- Java: public static void logInInBackground(String username,String password,LogInCallback callback)
//Logs in a user with a username and password. On success, this saves the session to disk, so you can retrieve the currently logged in user using ParseUser.getCurrentUser() This is preferable to using ParseUser.logIn(java.lang.String, java.lang.String), unless your code is already running from a background thread.


//public static void requestPasswordReset(String email)
//Requests a password reset email to be sent to the specified email address associated with the user account. This email allows the user to securely reset their password on the Parse site. Typically, you should use ParseUser.requestPasswordResetInBackground(java.lang.String, com.parse.RequestPasswordResetCallback) instead of this, unless you are managing your own threading.

//public static void requestPasswordResetInBackground(String email,RequestPasswordResetCallback callback)
//Requests a password reset email to be sent in a background thread to the specified email address associated with the user account. This email allows the user to securely reset their password on the Parse site. This is preferable to using requestPasswordReset(), unless your code is already running from a background thread.

//*- Java: public ParseUser fetchIfNeeded()

//*- Java: public boolean isNew()
//Indicates whether this ParseUser was created during this session through a call to ParseUser.signUp() or by logging in with a linked service such as Facebook.

//*- Java: public static ParseQuery<ParseUser> getQuery()
//Constructs a query for ParseUsers.
  
}



+ (NSString *)className
{
    return @"com.parse.ParseUser";
}

@end
