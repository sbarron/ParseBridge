//
//  SaveCallback.h
//  ParseBridge
//
//  Created by Spencer Barron on 8/14/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import <BridgeKit/JavaObject.h>
@class ParseException;

@interface SaveCallback : JavaObject

//*- Java: public abstract void done(ParseException e)
-(void)done:(ParseException*)error;

@end
