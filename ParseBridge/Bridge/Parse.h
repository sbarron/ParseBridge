//
//  Parse.h
//  ParseBridge
//
//  Created by Spencer Barron on 7/6/13.
//  Copyright (c) 2013 Spencer Barron. All rights reserved.
//

//*- Documentation
//*- Android: https://www.parse.com/docs/android/api/
//*- iOS: https://www.parse.com/docs/ios/api/Classes/

#import <BridgeKit/JavaObject.h>

@class AndroidContext;

@interface Parse : JavaObject

+(void)init:(AndroidContext*)context applicationId:(NSString *)applicationId clientKey:(NSString *)clientKey;

@end
