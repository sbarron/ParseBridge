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
	[ParseInstallation registerStaticMethod:@"getCurrentInstallation"
							 selector:@selector(getCurrentInstallation)
						  returnValue:[ParseInstallation className]
							arguments:nil];


	//*- Java: public static ParseQuery<ParseInstallation> getQuery()
	//*- iOS Bridge Method:  +(ParseQuery*)getQuery;
	[ParseInstallation registerStaticMethod:@"getQuery"
							 selector:@selector(getQuery)
						  returnValue:[ParseQuery className]
							arguments:nil];
	
 

	//*- Java:  public String getInstallationId()
	//*- iOS Bridge Method:  -(NSString*)getInstallationId;
	[ParseInstallation registerStaticMethod:@"getInstallationId"
								   selector:@selector(getInstallationId)
								returnValue:[NSString className]
								  arguments:nil];
	

	//*- Java: public void put(String key, Object value)   throws IllegalArgumentException
	//*- iOS Bridge Method:  -(void)forKey:(NSString*)key setObject:(id)value;
    [ParseInstallation registerInstanceMethod:@"put"
							   selector:@selector(forKey:setObject:)
							returnValue:nil
							  arguments:[NSString className],[JavaObject className],nil];

	//*- Java:  public void remove(String key)
	//*- iOS Bridge Method:  -(void)remove:(NSString*)key;
	[ParseInstallation registerInstanceMethod:@"remove"
							   selector:@selector(remove:)
							returnValue:nil
							  arguments:[NSString className],nil];


	//*- Java:  public void saveEventually(SaveCallback callback)
	//*- iOS Bridge Method:  -(void)saveEventually:(SaveCallback*)callback;
	[ParseInstallation registerInstanceMethod:@"saveEventually"
                               selector:@selector(saveEventually:)
                            returnValue:nil
							  arguments:[SaveCallback className], nil];
	


}

+ (NSString *)className
{
    return @"com.parse.ParseInstallation";
}

@end

