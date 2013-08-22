/*
 * ParseBridge: https://github.com/sbarron/ParseBridge
 *
 * Copyright (c) 2013 Spencer Barron & Matt Hudson.
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

#import "Parse.h"
#import <BridgeKit/AndroidContext.h>

@implementation Parse

+ (void)initializeJava
{
	[super initializeJava];
	
    //*- Java: public static void initialize(Context context, String applicationId, String clientKey)
    //*- Objective-C: +(void)init:(AndroidContext*)context applicationId:(NSString *)applicationId clientKey:(NSString *)clientKey;
	BOOL result = FALSE;
	
	result = [Parse registerStaticMethod:@"initialize"
					   selector:@selector(init:applicationId:clientKey:)
					returnValue:nil
					  arguments:[AndroidContext className],[NSString className],[NSString className], nil];
	DLog(@"Registered initialize = %@", (result ? @"YES" : @"NO"));
 
	//*- Java: public static void setLogLevel(int logLevel)
	//*- Objective-C:+(void)setLogLevel:(int)logLevel;
	result = [Parse registerStaticMethod:@"setLogLevel"
					   selector:@selector(setLogLevel:)
					returnValue:nil
					  arguments:[JavaClass intPrimitive], nil];
	DLog(@"Registered setLogLevel = %@", (result ? @"YES" : @"NO"));
	
	//*- Java: public static int getLogLevel()
	//*- Objective-C:+(int)getLogLevel;
	result = [Parse registerStaticMethod:@"getLogLevel"
					   selector:@selector(getLogLevel)
					returnValue:[JavaClass intPrimitive]
					  arguments:nil];
	DLog(@"Registered getLogLevel = %@", (result ? @"YES" : @"NO"));

					  				   
	
}


+ (NSString *)className
{
    return @"com.parse.Parse";
}

@end
