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

+ (void)initializeFacebook:(NSString*)appId;

+ (BOOL)isLinkedWithUser:(ParseUser*)user;

+ (void)logInWithPermissions:(NSArray *)permissions;

@end
