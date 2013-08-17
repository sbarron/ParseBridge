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
