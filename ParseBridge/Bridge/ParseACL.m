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
	//Set whether the public is allowed to read this object.
	
	
	//*- Java:  public boolean getPublicReadAccess()
	//Get whether the public is allowed to read this object.
	
	
	//*- Java:  public void setPublicWriteAccess(boolean allowed)
	//Set whether the public is allowed to write this object.
	
	
	//*- Java:  public boolean getPublicWriteAccess()
	//Set whether the public is allowed to write this object.
	
	
	//*- Java:  public void setReadAccess(String userId,boolean allowed)
	//Set whether the given user id is allowed to read this object.
	
	
	//*- Java:  public boolean getReadAccess(String userId)
	//Get whether the given user id is *explicitly* allowed to read this object. Even if this returns false, the user may still be able to access it if getPublicReadAccess returns true or a role that the user belongs to has read access.
	
	
	//*- Java:  public void setWriteAccess(String userId,boolean allowed)
	//Set whether the given user id is allowed to write this object.
	
	
	//*- Java:  public boolean getWriteAccess(String userId)
	//Get whether the given user id is *explicitly* allowed to write this object. Even if this returns false, the user may still be able to write it if getPublicWriteAccess returns true or a role that the user belongs to has write access.
	
	
	//*- Java:  public void setReadAccess(ParseUser user,boolean allowed)
	//Set whether the given user is allowed to read this object.
	
	
	//*- Java:  public boolean getReadAccess(ParseUser user)
	//Get whether the given user id is *explicitly* allowed to read this object. Even if this returns false, the user may still be able to access it if getPublicReadAccess returns true or a role that the user belongs to has read access.
	
	
	//*- Java:  public void setWriteAccess(ParseUser user,boolean allowed)
	//Set whether the given user is allowed to write this object.
	
	//*- Java:  public boolean getWriteAccess(ParseUser user)
	//Get whether the given user id is *explicitly* allowed to write this object. Even if this returns false, the user may still be able to write it if getPublicWriteAccess returns true or a role that the user belongs to has write access.
	
	
	//*- Java:  public boolean getRoleReadAccess(String roleName)
	//Get whether users belonging to the role with the given roleName are allowed to read this object. Even if this returns false, the role may still be able to read it if a parent role has read access.
	
	
	//*- Java:  public void setRoleReadAccess(String roleName,boolean allowed)
	//Set whether users belonging to the role with the given roleName are allowed to read this object.
	
	
	//*- Java:  public boolean getRoleWriteAccess(String roleName)
	//Get whether users belonging to the role with the given roleName are allowed to write this object. Even if this returns false, the role may still be able to write it if a parent role has write access.
	
	
	//*- Java:  public void setRoleWriteAccess(String roleName,boolean allowed)
	//Set whether users belonging to the role with the given roleName are allowed to write this object.
	
	
	//*- Java:  public boolean getRoleReadAccess(ParseRole role)
	//Get whether users belonging to the given role are allowed to read this object. Even if this returns false, the role may still be able to read it if a parent role has read access. The role must already be saved on the server and its data must have been fetched in order to use this method.
	
	
	//public void setRoleReadAccess(ParseRole role,boolean allowed)
	//Set whether users belonging to the given role are allowed to read this object. The role must already be saved on the server and its data must have been fetched in order to use this method.
	
	
	
	//*- Java:  public boolean getRoleWriteAccess(ParseRole role)
	//Get whether users belonging to the given role are allowed to write this object. Even if this returns false, the role may still be able to write it if a parent role has write access. The role must already be saved on the server and its data must have been fetched in order to use this method.
	
	
	//*- Java:  public void setRoleWriteAccess(ParseRole role,boolean allowed)
	//Set whether users belonging to the given role are allowed to write this object. The role must already be saved on the server and its data must have been fetched in order to use this method.
	
	
	//*- Java:  public static void setDefaultACL(ParseACL acl,boolean withAccessForCurrentUser)
	//Sets a default ACL that will be applied to all ParseObjects when they are created.
	
}

 
+ (NSString *)className
{
    return @"com.parse.ParseACL";
}

 
@end
