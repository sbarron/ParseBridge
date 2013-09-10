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
#import "MySignUpCallback.h"
#import "ParseException.h"

@implementation MySignUpCallback

@synthesize handler = _handler;

+ (void)initializeJava
{
	[super initializeJava];
	BOOL results = [MySignUpCallback registerConstructor];
	DLog(@"Registered constructor = %@", (results ? @"YES" : @"NO"));
	
	results = [MySignUpCallback registerCallback:@"done" selector:@selector(done:) returnValue:nil arguments:[ParseException className], nil];
	DLog(@"Registered done = %@", (results ? @"YES" : @"NO"));
}

+ (NSString *)className { return @"com.parsebridge.MySignUpCallback"; }

+ (MySignUpCallback *)callbackWithHandler:(signupCallbackBlock)myHandler
{
	MySignUpCallback *callback = [MySignUpCallback new];
	callback.handler = myHandler;
	return callback;
}

- (void)done:(JavaObject *)errorObj
{
	if (_handler) {
		// this is to work around a bug in the trampolines when calling back (hopefully we will have that fixed in the near future
		ParseException *ex = [ParseException typecast:errorObj];
		
		if([ex respondsToSelector:@selector(getCode)]){
		    NSLog(@"Exception is %@", ex);
		}
		else{
			ex = nil;
		}
		
		dispatch_async(dispatch_get_main_queue(), ^{
			_handler(ex);
		});
	}
}

@end



@implementation SignUpCallback

+ (void)initializeJava
{
    [super initializeJava];
	BOOL results;
	//*- Java: public SignUpCallback()
	results = [SignUpCallback registerConstructor];
	DLog(@"Registered constructor = %@", (results ? @"YES" : @"NO"));
	
	
	//*- Java:  public abstract void done(ParseException e)
	//*- iOS Bridge Method:  -(void)done:(ParseException*)error;
	//Override this function with the code you want to run after the save is complete.
	results = [SignUpCallback registerCallback:@"done"
						  selector:@selector(done:)
					   returnValue:nil
						 arguments:[ParseException className], nil];
	DLog(@"Registered done = %@", (results ? @"YES" : @"NO"));
	
	
}

-(void)done:(ParseException*)error{
	//[self _done:error];
	if(!error){
		//No error
		NSLog(@"Send success");
	}
	else{
		NSLog(@"Send failed", [error getCode]);
	}
}


+ (NSString *)className
{
    return @"com.parse.SignUpCallback";
}


@end
