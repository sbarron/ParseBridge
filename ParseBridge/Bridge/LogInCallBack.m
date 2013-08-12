//
//  ParseBridge.m
//  ParseBridge
//
//  Created by Spencer Barron on 7/6/13.


#import "LogInCallBack.h"
#import "ParseUser.h"
#import "ParseException.h"

@implementation LogInCallBack

+ (void)initializeJava
{
    [super initializeJava];
    
     /*
	  A LogInCallback is used to run code after logging in a user.
	  
	  The easiest way to use a LogInCallback is through an anonymous inner class. Override the done function to specify what the callback should do after the login is complete. The done function will be run in the UI thread, while the login happens in a background thread. This ensures that the UI does not freeze while the save happens.
	  
	  For example, this sample code logs in a user and calls a different function depending on whether the login succeeded or not.
	  
	  ParseUser.logInInBackground("username", "password", new LogInCallback() {
	  public void done(ParseUser user, ParseException e) {
	  if (e == null && user != null) {
	  loginSuccessful();
	  } else if (user == null) {
	  usernameOrPasswordIsInvalid();
	  } else {
	  somethingWentWrong();
	  }
	  }
	  });
	 
	 */
	 
	//*- Java:  public LogInCallback()
    [LogInCallBack registerConstructorWithSelector:@selector(initLoginCallBack)
                                         arguments:nil];
	
	//*- Java:  public abstract void done(ParseUser user,ParseException e)
	//Override this function with the code you want to run after the save is complete.
    [LogInCallBack registerInstanceMethod:@"done"
                                 selector:@selector(done:error:)
                                arguments:[ParseUser className], [ParseException className], nil];
	
}

+ (NSString *)className
{
    return @"com.parse.LogInCallback";
}



@end
