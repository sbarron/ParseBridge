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
 
#import <BridgeKit/JavaObject.h>

@class ParseUser;
@class ParseACL;
@class ParseRole;

@interface ParseACL : JavaObject

//*- Java:  ParseACL(ParseUser owner)
-(id)initWithUser:(ParseUser*)owner;

//*- Java:  public void setPublicReadAccess(boolean allowed)
-(void)setPublicReadAccess:(bool)allowed;

//*- Java:  public boolean getPublicReadAccess()
-(bool)getPublicReadAccess;

//*- Java:  public void setPublicWriteAccess(boolean allowed)
-(void)setPublicWriteAcess:(bool)allowed;

//*- Java:  public boolean getPublicWriteAccess()
-(bool)getPublicWriteAccess;

//*- Java:  public void setReadAccess(String userId,boolean allowed)
-(void)setReadAccessForUserId:(NSString*)userId allowed:(bool)allowed;

//*- Java:  public boolean getReadAccess(String userId)
-(bool)getReadAccessWithUserId:(NSString*)userId;

//*- Java:  public void setWriteAccess(String userId,boolean allowed)
-(void)setWriteAccessForUserId:(NSString*)userId allowed:(bool)allowed;

//*- Java:  public boolean getWriteAccess(String userId)
-(bool)getWriteAccessForUserId:(NSString*)userId;

//*- Java:  public void setReadAccess(ParseUser user,boolean allowed)
-(void)setReadAccessWithUser:(ParseUser*)user allowed:(bool)allowed;

//*- Java:  public boolean getReadAccess(ParseUser user)
-(bool)getReadAccessWithUser:(ParseUser*)user;

//*- Java:  public void setWriteAccess(ParseUser user,boolean allowed)
-(void)setWriteAccessForUser:(ParseUser*)user allowed:(bool)allowed;

//*- Java:  public boolean getWriteAccess(ParseUser user)
-(bool)getWriteAccessForUser:(ParseUser*)user;

//*- Java:  public boolean getRoleReadAccess(String roleName)
-(bool)getRoleReadAccess:(NSString*)roleName;

//*- Java:  public void setRoleReadAccess(String roleName,boolean allowed)
-(void)setRoleReadAccessWithRoleName:(NSString*)roleName allowed:(bool)allowed;

//*- Java:  public boolean getRoleWriteAccess(String roleName)
-(bool)getRoleWriteAccessWithRoleName:(NSString*)roleName;

//*- Java:  public void setRoleWriteAccess(String roleName,boolean allowed)
-(void)setRoleWriteAccessWithRoleName:(NSString*)roleName allowed:(bool)allowed;

//*- Java:  public boolean getRoleReadAccess(ParseRole role)
-(bool)getRoleReadAccessWithRole:(ParseRole*) role;

//*- Java: public void setRoleReadAccess(ParseRole role,boolean allowed)
-(void)setRoleReadAccessWithRole:(ParseRole*)role allowed:(bool)allowed;


//*- Java:  public boolean getRoleWriteAccess(ParseRole role)
-(bool)getRoleWriteAccessWithRole:(ParseRole*)role;

//*- Java:  public void setRoleWriteAccess(ParseRole role,boolean allowed)
-(void)setRoleWriteAccessWithRole:(ParseRole*)role allowed:(bool)allowed;

//*- Java:  public static void setDefaultACL(ParseACL acl,boolean withAccessForCurrentUser)
+(void)setDefaultACL:(ParseACL*)acl currentUserAccess:(bool)currentUserAccess;

@end
