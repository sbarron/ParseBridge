//
//  ParseBridge.h
//  ParseBridge
//
//  Created by Spencer Barron on 7/6/13.

#import <BridgeKit/JavaObject.h>

@class ParseUser;

@interface ParseUser: JavaObject

+ (ParseUser*) currentUser; 
+ (void)logOut;
- (void)initUser;
- (BOOL)isAuthenticated;
- (void)forKey:(NSString *)key setObject:(id)value;

/*
 PFUser
 //public boolean isAuthenticated()
 - (BOOL)isAuthenticated
 
 + currentUser
 
 + enableAutomaticUser
 
 - saveInBackground

 - setObject:(id) forKey:(NSString*)
 */

@end
