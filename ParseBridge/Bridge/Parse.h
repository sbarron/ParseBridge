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


//* BridgeKit http://static.apportable.com/documentation/BridgeKit/html/index.html
//* Android: https://www.parse.com/docs/android/api/
//* iOS: https://www.parse.com/docs/ios/api/Classes/

#import <BridgeKit/JavaObject.h>

typedef enum logLevel : int {
	LOG_LEVEL_DEBUG		= 3,
	LOG_LEVEL_ERROR		= 6,
	LOG_LEVEL_INFO		= 4,
	LOG_LEVEL_NONE		= 2147483647,
	LOG_LEVEL_VERBOSE	= 2,
	LOG_LEVEL_WARNING	= 5,
} logLevel;
 
@class AndroidContext;

@interface Parse : JavaObject

+(void)init:(AndroidContext*)context applicationId:(NSString *)applicationId clientKey:(NSString *)clientKey;

+(void)setLogLevel:(int)logLevel;

+(int)getLogLevel;

@end
