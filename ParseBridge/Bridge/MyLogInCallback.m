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
#import "MyLogInCallback.h"
#import "ParseUser.h"
#import "ParseException.h"


@implementation MyLogInCallback

@synthesize handler = _handler;

+ (void)initializeJava
{
	[super initializeJava];
	BOOL results = [MyLogInCallback registerConstructor];
	DLog(@"Registered constructor = %@", (results ? @"YES" : @"NO"));
	
	//MyLoginCallback implements LoginCallback (abstract class)
	//*- Java:  public abstract void done(ParseUser user,ParseException e)
	results = [MyLogInCallback registerCallback:@"done" selector:@selector(done:error:) returnValue:nil arguments:[ParseUser className], [ParseException className], nil];
	DLog(@"Registered done = %@", (results ? @"YES" : @"NO"));
}

+ (NSString *)className { return @"com.parsebridge.MyLogInCallback"; }

+ (MyLogInCallback *)callbackWithHandler:(loginCallbackBlock)myHandler
{
	MyLogInCallback *callback = [MyLogInCallback new];
	callback.handler = myHandler;
	return callback;
}
										  
- (void)done:(JavaObject *)userObj error:(JavaObject *)errorObj
{
	if (_handler) {
		
		ParseUser *user = [ParseUser typecast:userObj];
		// this is to work around a bug in the trampolines when calling back (hopefully we will have that fixed in the near future
		ParseException *ex = [ParseException typecast:errorObj];
		

		//NSLog(@"Exception is %@", ex);
		//NSLog(@"Excpetion is %i", [ex getCode]);
		
		dispatch_async(dispatch_get_main_queue(), ^{
			_handler(user, ex);
		});
	}
}
										  
@end



@implementation LogInCallback

+ (void)initializeJava
{
    [super initializeJava];
	BOOL results;
	results = [LogInCallback registerConstructor];
	DLog(@"Registered done = %@", (results ? @"YES" : @"NO"));
	
	//*- Java:  public abstract void done(ParseUser user,ParseException e)
	//*- iOS Bridge Method:  -(void)done:(ParseUser*)user :(ParseException*)error;
	//Override this function with the code you want to run after the save is complete.
	results = [LogInCallback registerCallback:@"done"
									 selector:@selector(done:error:)
								  returnValue:nil
									arguments:[ParseUser className],[ParseException className], nil];
	DLog(@"Registered done = %@", (results ? @"YES" : @"NO"));
	
}

+ (NSString *)className
{
    return @"com.parse.LogInCallback";
}

@end
										  
