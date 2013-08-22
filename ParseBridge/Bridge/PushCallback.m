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

#import "PushCallback.h"
#import "ParseException.h"

// VERIFY SUPPORT for JSONObjects and for Android Service
@implementation PushCallback

 
+ (void)initializeJava
{
    [super initializeJava];
	BOOL results;
	results = [PushCallback registerConstructor];
	DLog(@"Registered constructor = %@", (results ? @"YES" : @"NO"));
	/*
	//*- Java:  public void setChannel(String theChannel)
	//*- iOS Bridge Method:  -(void)setChannel:(NSString*)channel;
	results = [PushCallback registerInstanceMethod:@"setChannel"
										selector:@selector(setChannel:)
									 returnValue:nil
									   arguments:[NSString className], nil];
	DLog(@"Registered setChannel  =  %@", (results ? @"YES" : @"NO"));
	
	
	//*- Java: public void setService(Service theService)
	//*- iOS Bridge Method:  -(void)setService:(JavaObject*)channel;
	results = [PushCallback registerInstanceMethod:@"setService"
										  selector:@selector(setService:)
									   returnValue:nil
										 arguments:[JavaObject className], nil];
	DLog(@"Registered setService  =  %@", (results ? @"YES" : @"NO"));
	
	
	//*- Java: public void setPushData(JSONObject thePushData)
	//*- iOS Bridge Method:  -(void)setPushData:(JavaObject*)pushData;
	results = [PushCallback registerInstanceMethod:@"setPushData"
										  selector:@selector(setPushData:)
									   returnValue:nil
										 arguments:[JavaObject className], nil];
	DLog(@"Registered setPushData  =  %@", (results ? @"YES" : @"NO"));
	
	
	//*- Java: public void setLocalData(JSONObject theLocalData)
	//*- iOS Bridge Method:  -(void)setLocalData:(JavaObject*)localData;
	results = [PushCallback registerInstanceMethod:@"setLocalData"
										  selector:@selector(setChannel:)
									   returnValue:nil
										 arguments:[JavaObject className], nil];
	DLog(@"Registered setLocalData  =  %@", (results ? @"YES" : @"NO"));
	*/
}

+ (NSString *)className
{
    return @"com.parse.ProgressCallback";
}



@end
