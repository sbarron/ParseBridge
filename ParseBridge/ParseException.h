//
//  ParseException.h
//  FishBalls
//
//  Created by Spencer Barron on 7/9/13.
//  Copyright (c) 2013 Spencer Barron. All rights reserved.
//

#import <BridgeKit/JavaObject.h>

@interface ParseException : JavaObject{
	//int errorcode;
}

-(void)initParseException :(int)errorcode :(NSString*)message;
//-(int)getCode;

@end
