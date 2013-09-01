//
//  ParseRole.h
//  ParseBridge
//
//  Created by Spencer Barron on 8/17/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//


#import <BridgeKit/JavaObject.h>
#import "ParseObject.h"

@class ParseACL;

@interface ParseRole : ParseObject

-(id)initWithName:(NSString*)name;
-(id)initWithNameandACL:(NSString*)name acl:(ParseACL*)acl;

@end
