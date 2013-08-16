//
//  PushService.h
//  ParseBridge
//
//  Created by Spencer Barron on 8/13/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import <BridgeKit/JavaObject.h>

@class AndroidActivity;
@class AndroidContext;
@class JavaSet;

@interface PushService : JavaObject

//*- Java:   public static void startServiceIfRequired(Context context)
+ (void)startServiceIfRequired:(AndroidContext*)context;

//*- Java:   public static void subscribe(Context context,String channel,Class<? extends Activity> cls)
+ (void)subscribe:(AndroidContext*)context channel:(NSString*)channel activitySubClass:(AndroidActivity*)activitySubClass;

//*- Java:   public static void subscribe(Context context,String channel,Class<? extends Activity> cls,int icon)
+ (void)subscribeWithIcon:(AndroidContext*)context channel:(NSString*)channel activitySubClass:(AndroidActivity*)activitySubClass icon:(int)icon;

//*- Java:   public static void unsubscribe(Context context,String channel)
+ (void)unsubscribe:(AndroidContext*)context channel:(NSString*)channel;

//*- Java:   public static void setDefaultPushCallback(Context context,Class<? extends Activity> cls)
+ (void)setDefaultPushCallback:(AndroidContext*)context activitySubClass:(AndroidActivity*)activitySubClass;

//*- Java:  public static void setDefaultPushCallback(Context context,Class<? extends Activity> cls,int icon)
+ (void)setDefaultPushCallbackWithIcon:(AndroidContext*)context activitySubClass:(AndroidActivity*)activitySubClass icon:(int)icon;

//*- Java:   public static Set<String> getSubscriptions(Context context)
+ (NSArray*)getSubscriptions:(AndroidContext*)context;


@end
