//
//  ParseInstallation.m
//  ParseBridge
//
//  Created by Spencer Barron on 8/13/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

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
													selector:@selector(getInstallationId)
												 returnValue:[NSString className]
												   arguments:nil];
	

	//*- Java: public void put(String key, Object value)   throws IllegalArgumentException
	//*- iOS Bridge Method:  -(void)forKey:(NSString*)key setObject:(id)value;
    BOOL method4 = [ParseInstallation registerInstanceMethod:@"put"
							   selector:@selector(forKey:setObject:)
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
	//BOOL method6 = [ParseInstallation registerInstanceMethod:@"saveEventually"
    //                           selector:@selector(saveEventually:)
      //                      returnValue:nil
	//						  arguments:[SaveCallback className], nil];
	
	NSLog(@"ParseInstallation Method Registration %i, %i, %i, %i, %i", method1, method2, method3, method4, method5);
	


}

/*
-(NSString*)getInstallationId{
	NSString* installationID = [self _getInstallationId];
	NSLog(@"InstallationID = %@",installationID);
	return  installationID; //[NSString stringWithJavaString:(jstring)[self _getInstallationId];
}*/

+ (NSString *)className
{
    return @"com.parse.ParseInstallation";
}

@end

