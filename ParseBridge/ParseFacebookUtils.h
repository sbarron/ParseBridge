//
//  ParseFacebookUtils.h
//  FishBalls
//
//  Created by Spencer Barron on 7/7/13.
//  Copyright (c) 2013 Spencer Barron. All rights reserved.
//

#import <BridgeKit/JavaObject.h>
#import "ParseUser.h"

@interface ParseFacebookUtils : JavaObject

/*
 
 PFFacebookUtils
 + initializeFacebook
 + isLinkedWithUser:(PFUser*)
 + linkUser:(PFUser*) permissions:(NSSArray*) block:(BOOL succeeded, NSError *error)
 */

+ (void)initializeFacebook:(NSString*)appId;

+ (void)initializeFacebookWithUrlShemeSuffix:(NSString *)urlSchemeSuffix;

+ (BOOL)handleOpenURL:(NSURL *)url;

+ (BOOL)isLinkedWithUser:(ParseUser*)user;

+ (void)logInWithPermissions:(NSArray *)permissions;

+ (void)linkUser:(id)user permissions:(NSArray *)permissions block:(id)block;

@end
