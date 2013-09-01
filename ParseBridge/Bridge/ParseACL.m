/*
 * ParseBridge: https://github.com/sbarron/ParseBridge
 *
 * Copyright (c) 2013 Spencer Barron & Matt Hudson
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

#import "ParseACL.h"
#import "ParseRole.h"
#import "ParseUser.h"

@implementation ParseACL


+ (void)initializeJava
{
    [super initializeJava];
	
	//Constructors
	//*- Java:  ParseACL()
	//Creates an ACL with no permissions granted.
	BOOL result = [ParseACL registerConstructor];
	DLog(@"Registered constructor =  %@", (result ? @"YES" : @"NO"));
		
	//*- Java:  ParseACL(ParseUser owner)
	//*- ObjC:  -(id)initWithUser:(ParseUser*)owner;
	//Creates an ACL where only the provided user has access.
	result = [ParseACL registerConstructorWithSelector:@selector(initWithUser:)
												arguments:[ParseUser className], nil];
	DLog(@"Registered constructor2  =  %@", (result ? @"YES" : @"NO"));
	
	
	//Methods
	
	//*- Java:  public void setPublicReadAccess(boolean allowed)
	//*- ObjC:  -(void)setPublicReadAccess:(bool)allowed;
	//Set whether the public is allowed to read this object.
	result = [ParseACL registerInstanceMethod:@"setPublicReadAccess"
										selector:@selector(setPublicReadAccess:)
									 returnValue:nil
									   arguments:[JavaClass boolPrimitive],nil];
	DLog(@"Registered setPublicReadAccess = %@", (result ? @"YES" : @"NO"));
	
	
	//*- Java:  public boolean getPublicReadAccess()
	//*- ObjC:  -(bool)getPublicReadAccess;
	//Get whether the public is allowed to read this object.
	result = [ParseACL registerInstanceMethod:@"getPublicReadAccess"
										selector:@selector(getPublicReadAccess:)
									 returnValue:[JavaClass boolPrimitive]
									   arguments:nil];
	DLog(@"Registered getPublicReadAccess = %@", (result ? @"YES" : @"NO"));
	
	
	//*- Java:  public void setPublicWriteAccess(boolean allowed)
	//*- ObjC: -(void)setPublicWriteAcess:(bool)allowed;
	//Set whether the public is allowed to write this object.
	result = [ParseACL registerInstanceMethod:@"setPublicWriteAccess"
										selector:@selector(setPublicWriteAcess:)
									 returnValue:nil
									   arguments:[JavaClass boolPrimitive],nil];
	DLog(@"Registered setPublicWriteAcess = %@", (result ? @"YES" : @"NO"));
	
	
	//*- Java:  public boolean getPublicWriteAccess()
	//*- ObjC: -(bool)getPublicWriteAccess;
	//Set whether the public is allowed to write this object.
	result = [ParseACL registerInstanceMethod:@"getPublicWriteAccess"
									 selector:@selector(getPublicWriteAccess:)
								  returnValue:[JavaClass boolPrimitive]
									arguments:nil];
	DLog(@"Registered getPublicWriteAccess = %@", (result ? @"YES" : @"NO"));
	
	
	//*- Java:  public void setReadAccess(String userId,boolean allowed)
	//*- ObjC: -(void)setReadAccessForUserId:(NSString*)userId allowed:(bool)allowed;
	//Set whether the given user id is allowed to read this object.
	result = [ParseACL registerInstanceMethod:@"setReadAccess"
									 selector:@selector(setReadAccessForUserId:allowed:)
								  returnValue:nil
									arguments:[NSString className], [JavaClass boolPrimitive], nil];
	DLog(@"Registered setReadAccess = %@", (result ? @"YES" : @"NO"));
	
	
	//*- Java:  public boolean getReadAccess(String userId)
	//*- ObjC: -(bool)getReadAccessWithUserId:(NSString*)userId;
	//Get whether the given user id is *explicitly* allowed to read this object. Even if this returns false, the user may still be able to access it if getPublicReadAccess returns true or a role that the user belongs to has read access.
	result = [ParseACL registerInstanceMethod:@"getReadAccess"
									 selector:@selector(getReadAccessWithUserId:)
								  returnValue:[JavaClass boolPrimitive]
									arguments:[NSString className], nil];
	DLog(@"Registered getReadAccess = %@", (result ? @"YES" : @"NO"));
	
	
	//*- Java:  public void setWriteAccess(String userId,boolean allowed)
	//*- ObjC:  -(void)setWriteAccessForUserId:(NSString*)userId allowed:(bool)allowed;
	//Set whether the given user id is allowed to write this object.
	result = [ParseACL registerInstanceMethod:@"setWriteAccess"
									 selector:@selector(setWriteAccessForUserId:allowed:)
								  returnValue:nil
									arguments:[NSString className], [JavaClass boolPrimitive], nil];
	DLog(@"Registered setWriteAccess for UserId = %@", (result ? @"YES" : @"NO"));
	
	
	//*- Java:  public boolean getWriteAccess(String userId)
	//*- ObjC: -(bool)getWriteAccessForUserId:(NSString*)userId;
	//Get whether the given user id is *explicitly* allowed to write this object. Even if this returns false, the user may still be able to write it if getPublicWriteAccess returns true or a role that the user belongs to has write access.
	result = [ParseACL registerInstanceMethod:@"getWriteAccess"
									 selector:@selector(getWriteAccessForUserId:)
								  returnValue:[JavaClass boolPrimitive]
									arguments:[NSString className], nil];
	DLog(@"Registered getWriteAccess = %@", (result ? @"YES" : @"NO"));
	
	
	//*- Java:  public void setReadAccess(ParseUser user,boolean allowed)
	//*- ObjC: -(void)setReadAccessWithUser:(ParseUser*)user allowed:(bool)allowed;
	//Set whether the given user is allowed to read this object.
	result = [ParseACL registerInstanceMethod:@"setReadAccess"
									 selector:@selector(setReadAccessWithUser:allowed:)
								  returnValue:nil
								    arguments:[ParseUser className], [JavaClass boolPrimitive], nil];
	DLog(@"Registered setReadAccess = %@", (result ? @"YES" : @"NO"));
	
	
	//*- Java:  public boolean getReadAccess(ParseUser user)
	//*- ObjC: -(bool)getReadAccessWithUser:(ParseUser*)user;
	//Get whether the given user id is *explicitly* allowed to read this object. Even if this returns false, the user may still be able to access it if getPublicReadAccess returns true or a role that the user belongs to has read access.
	result = [ParseACL registerInstanceMethod:@"getReadAccess"
									 selector:@selector(getReadAccessWithUser:)
								  returnValue:[JavaClass boolPrimitive]
									arguments:[ParseUser className], nil];
	DLog(@"Registered getReadAccess = %@", (result ? @"YES" : @"NO"));
	
	
	//*- Java:  public void setWriteAccess(ParseUser user,boolean allowed)
	//*- ObjC: -(void)setWriteAccessForUser:(ParseUser*)user allowed:(bool)allowed;
	//Set whether the given user is allowed to write this object.
	result = [ParseACL registerInstanceMethod:@"setWriteAccess"
									 selector:@selector(setWriteAccessForUser:allowed:)
								  returnValue:nil
								    arguments:[ParseUser className],[JavaClass boolPrimitive], nil];
	DLog(@"Registered setWriteAccess for User = %@", (result ? @"YES" : @"NO"));
	
	//*- Java:  public boolean getWriteAccess(ParseUser user)
	//*- ObjC: -(bool)getWriteAccessForUser:(ParseUser*)user;
	//Get whether the given user id is *explicitly* allowed to write this object. Even if this returns false, the user may still be able to write it if getPublicWriteAccess returns true or a role that the user belongs to has write access.
	result = [ParseACL registerInstanceMethod:@"getWriteAccess"
									 selector:@selector(getWriteAccessForUser:)
								  returnValue:[JavaClass boolPrimitive]
									arguments:[ParseUser className], nil];
	DLog(@"Registered getReadAccess = %@", (result ? @"YES" : @"NO"));
	
	
	//*- Java:  public boolean getRoleReadAccess(String roleName)
	//*- ObjC: -(bool)getRoleReadAccess:(NSString*)roleName;
	//Get whether users belonging to the role with the given roleName are allowed to read this object. Even if this returns false, the role may still be able to read it if a parent role has read access.
	result = [ParseACL registerInstanceMethod:@"getRoleReadAccess"
									 selector:@selector(getRoleReadAccess:)
								  returnValue:[JavaClass boolPrimitive]
									arguments:[NSString className], nil];
	DLog(@"Registered getRoleReadAccess = %@", (result ? @"YES" : @"NO"));
	
	
	//*- Java:  public void setRoleReadAccess(String roleName,boolean allowed)
	//*- ObjC: -(void)setRoleReadAccessWithRoleName:(NSString*)roleName allowed:(bool)allowed;
	//Set whether users belonging to the role with the given roleName are allowed to read this object.
	result = [ParseACL registerInstanceMethod:@"setRoleReadAccess"
									 selector:@selector(setRoleReadAccessWithRoleName:allowed:)
								  returnValue:nil
									arguments:[NSString className], [JavaClass boolPrimitive], nil];
	DLog(@"Registered setRoleReadAccess = %@", (result ? @"YES" : @"NO"));
	
	
	//*- Java:  public boolean getRoleWriteAccess(String roleName)
	//*- ObjC: -(bool)getRoleWriteAccessWithRoleName:(NSString*)roleName;
	//Get whether users belonging to the role with the given roleName are allowed to write this object. Even if this returns false, the role may still be able to write it if a parent role has write access.
	result = [ParseACL registerInstanceMethod:@"getRoleWriteAccess"
									 selector:@selector(getRoleWriteAccessWithRoleName:)
								  returnValue:[JavaClass boolPrimitive]
									arguments:[NSString className], nil];
	DLog(@"Registered getRoleWriteAccess = %@", (result ? @"YES" : @"NO"));
	
	
	//*- Java:  public void setRoleWriteAccess(String roleName,boolean allowed)
	//*- ObjC: -(void)setRoleWriteAccessWithRoleName:(NSString*)roleName allowed:(bool)allowed;
	//Set whether users belonging to the role with the given roleName are allowed to write this object.
	result = [ParseACL registerInstanceMethod:@"setRoleWriteAccess"
									 selector:@selector(setRoleWriteAccessWithRoleName:allowed:)
							      returnValue:nil
									arguments:[NSString className],[JavaClass boolPrimitive], nil];
	DLog(@"Registered setRoleWriteAccess with rolename = %@", (result ? @"YES" : @"NO"));
	
	
	//*- Java:  public boolean getRoleReadAccess(ParseRole role)
	//*- ObjC: -(bool)getRoleReadAccessWithRole:(ParseRole*) role;
	//Get whether users belonging to the given role are allowed to read this object. Even if this returns false, the role may still be able to read it if a parent role has read access. The role must already be saved on the server and its data must have been fetched in order to use this method.
	result = [ParseACL registerInstanceMethod:@"getRoleReadAccess"
									 selector:@selector(getRoleReadAccessWithRole:)
								  returnValue:[JavaClass boolPrimitive]
									arguments:[ParseRole className], nil];
	DLog(@"Registered getRoleReadAccess = %@", (result ? @"YES" : @"NO"));
	
	
	//*- Java: public void setRoleReadAccess(ParseRole role,boolean allowed)
	//*- ObjC: -(void)setRoleReadAccessWithRole:(ParseRole*)role allowed:(bool)allowed;
	//Set whether users belonging to the given role are allowed to read this object. The role must already be saved on the server and its data must have been fetched in order to use this method.
	result = [ParseACL registerInstanceMethod:@"setRoleReadAccess"
									 selector:@selector(setRoleReadAccessWithRole:allowed:)
								  returnValue:nil
									arguments:[ParseRole className],[JavaClass boolPrimitive], nil];
	DLog(@"Registered setRoleReadAccess = %@", (result ? @"YES" : @"NO"));
	
	
	
	//*- Java:  public boolean getRoleWriteAccess(ParseRole role)
	//*- ObjC: -(bool)getRoleWriteAccessWithRole:(ParseRole*)role;
	//Get whether users belonging to the given role are allowed to write this object. Even if this returns false, the role may still be able to write it if a parent role has write access. The role must already be saved on the server and its data must have been fetched in order to use this method.
	result = [ParseACL registerInstanceMethod:@"getRoleWriteAccess"
									 selector:@selector(getRoleWriteAccessWithRole:)
								  returnValue:[JavaClass boolPrimitive]
									arguments:[ParseRole className], nil];
	DLog(@"Registered getRoleWriteAccess = %@", (result ? @"YES" : @"NO"));
	
	//*- Java:  public void setRoleWriteAccess(ParseRole role,boolean allowed)
	//*- ObjC: -(void)setRoleWriteAccessWithRole:(ParseRole*)role allowed:(bool)allowed;
	//Set whether users belonging to the given role are allowed to write this object. The role must already be saved on the server and its data must have been fetched in order to use this method.
	result = [ParseACL registerInstanceMethod:@"setRoleWriteAccess"
									 selector:@selector(setRoleWriteAccessWithRole:)
								  returnValue:nil
									arguments:[ParseRole className],[JavaClass boolPrimitive], nil];
	DLog(@"Registered setRoleWriteAccess with ParseRole = %@", (result ? @"YES" : @"NO"));
	
	
	//*- Java:  public static void setDefaultACL(ParseACL acl,boolean withAccessForCurrentUser)
	//*- ObjC: +(void)setDefaultACL:(ParseACL*)acl currentUserAccess:(bool)currentUserAccess;
	//Sets a default ACL that will be applied to all ParseObjects when they are created.
	result = [ParseACL registerStaticMethod:@"setDefaultACL"
									  selector:@selector(setDefaultACL:currentUserAccess:)
								   returnValue:nil
									 arguments:[ParseACL className],[JavaClass boolPrimitive], nil];
	DLog(@"Registered setDefaultACL = %@", (result ? @"YES" : @"NO"));
}

 
+ (NSString *)className
{
    return @"com.parse.ParseACL";
}

 
@end
