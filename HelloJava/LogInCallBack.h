//
//  LogInCallBack.h
//
//  Created by Spencer Barron on 7/8/13.


#import <BridgeKit/JavaObject.h>
@class ParseUser;
@class ParseException;

@interface LogInCallBack: JavaObject

-(void) initLoginCallBack;
-(void)done:(ParseUser*)user :(ParseException*)error;

@end
