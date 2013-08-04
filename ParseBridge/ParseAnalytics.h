//
//  ParseAnalytics.h
//  Created by Spencer Barron on 7/7/13.


#import <BridgeKit/JavaObject.h>
#import <BridgeKit/AndroidIntent.h>

@interface ParseAnalytics : JavaObject
   +(void)trackAppOpened:(AndroidIntent*)intent;
@end
