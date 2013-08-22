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

#import "ParseInstallation.h"
#import "ParseException.h"
#import "SaveCallBack.h"
#import "ParseQuery.h"

@implementation ParseInstallation

+ (void)initializeJava
{
    [super initializeJava];
	
	//*- Java:  public static ParseInstallation getCurrentInstallation()
	//*- iOS Bridge Method:  +(ParseInstallation*)getCurrentInstallation;
	BOOL method1 = [ParseInstallation registerStaticMethod:@"getCurrentInstallation"
							 selector:@selector(getCurrentInstallation)
						  returnValue:[ParseInstallation className]
							arguments:nil];


	//*- Java: public static ParseQuery<ParseInstallation> getQuery()
	//*- iOS Bridge Method:  +(ParseQuery*)getQuery;
	BOOL method2 = [ParseInstallation registerStaticMethod:@"getQuery"
							 selector:@selector(getQuery)
						  returnValue:[ParseQuery className]
							arguments:nil];
	
 
	//*- Java:   public String getInstallationId()
	//*- iOS Bridge Method:  -(NSString*)getInstallationId;
	BOOL method3 = [ParseInstallation registerInstanceMethod:@"getInstallationId"
													selector:@selector(_getInstallationId)
												 returnValue:[NSString className]
												   arguments:nil];
	

	//*- Java: public void put(String key, Object value)   throws IllegalArgumentException
	//*- iOS Bridge Method:  -(void)forKey:(NSString*)key setObject:(id)value;
    BOOL method4 = [ParseInstallation registerInstanceMethod:@"put"
							   selector:@selector(_forKey:setObject:)
							returnValue:nil
							  arguments:[NSString className],[JavaObject className],nil];

	//*- Java:  public void remove(String key)
	//*- iOS Bridge Method:  -(void)remove:(NSString*)key;
	BOOL method5 = [ParseInstallation registerInstanceMethod:@"remove"
							   selector:@selector(remove:)
							returnValue:nil
							  arguments:[NSString className],nil];


	//*- Java:  public void saveEventually(SaveCallback callback)
	//*- iOS Bridge Method:  -(void)saveEventually:(SaveCallback*)callback;
	BOOL method6 = [ParseInstallation registerInstanceMethod:@"saveEventually"
                               selector:@selector(saveEventually:)
                            returnValue:nil
							  arguments:[SaveCallback className], nil];
	
	DLog(@"ParseInstallation Method Registration %i, %i, %i, %i, %i, %i", method1, method2, method3, method4, method5, method6);
	


}

/*
-(void)forKey:(NSString*)key setObject:(id)value{
	DLog(@"ParseInstallation Value = %@");
	[self _forKey:key setObject:value];
}*/



-(NSString*)getInstallationId{
	NSString* installationID = [NSString stringWithJavaString:[self _getInstallationId]];
	DLog(@"InstallationID = %@",installationID);
	return  installationID; 
}


+ (NSString *)className
{
    return @"com.parse.ParseInstallation";
}

@end

