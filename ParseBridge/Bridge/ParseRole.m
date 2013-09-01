//
//  ParseRole.m
//  ParseBridge
//
//  Created by Spencer Barron on 8/17/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import "ParseRole.h"
#import "ParseACL.h"

@implementation ParseRole

+ (void)initializeJava
{
    [super initializeJava];
	
	BOOL results = FALSE;	
	//*- Java:  public ParseRole(String name)
	//*- ObjC:  -(id)initWithName:(NSString*)name;
	//Constructs a new ParseRole with the given name. If no default ACL has been specified, you must provide an ACL for the role.
	results = [ParseRole registerConstructorWithSelector:@selector(initWithName:)
													arguments:[NSString className], nil];
	DLog(@"ParseRole Registered constructor for initWithName =  %@", (results ? @"YES" : @"NO"));
	

 		
	//*- Java:  public ParseRole(String name,ParseACL acl)
	//*- ObjC:  -(id)initWithNameandACL:(NSString*)name acl:(ParseACL*)acl;
	//Constructs a new ParseRole with the given name.
	results = [ParseRole registerConstructorWithSelector:@selector(initWithNameandACL:acl:)
									arguments:[NSString className],[ParseACL className], nil];
	DLog(@"ParseRole Registered constructor for initWithNameandACL =  %@", (results ? @"YES" : @"NO"));
			
	//public void setName(String name)
	//Sets the name for a role. This value must be set before the role has been saved to the server, and cannot be set once the role has been saved.
	
	
	//public String getName()
	//Gets the name of the role.
				
	//public ParseRelation<ParseUser> getUsers()
	//Gets the ParseRelation for the ParseUsers that are direct children of this role. These users are granted any privileges that this role has been granted (e.g. read or write access through ACLs). You can add or remove users from the role through this relation.
					 
							
	//public ParseRelation<ParseRole> getRoles()
	//Gets the ParseRelation for the ParseRoles that are direct children of this role. These roles' users are granted any privileges that this role has been granted (e.g. read or write access through ACLs). You can add or remove child roles from this role through this relation.
				
									
	//protected void validateSave()
				
									
	//public void put(String key,Object value)
	//Description copied from class: ParseObject
									
									
	//public static ParseQuery<ParseRole> getQuery()
								 
}

+(NSString *)className
{
    return @"com.parse.ParseRole";
}

@end
