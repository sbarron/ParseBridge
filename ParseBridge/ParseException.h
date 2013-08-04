//
//  ParseException.h
//  ParseBridge
//
//  Created by Spencer Barron on 7/9/13.
//  Copyright (c) 2013 Spencer Barron. All rights reserved.
//

#import <BridgeKit/JavaObject.h>

@interface ParseException : JavaObject{
}

-(void)initParseException :(int)errorcode :(NSString*)message;

@end
