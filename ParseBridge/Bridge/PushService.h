/*
 * ParseBridge: https://github.com/sbarron/ParseBridge
 *
 * Copyright (c) 2013 Spencer Barron
 *
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 */

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
+ (void)setDefaultPushCallback:(AndroidContext*)context activitySubClass:(JavaClass*)activitySubClass;

//*- Java:  public static void setDefaultPushCallback(Context context,Class<? extends Activity> cls,int icon)
+ (void)setDefaultPushCallbackWithIcon:(AndroidContext*)context activitySubClass:(JavaClass*)activitySubClass icon:(int)icon;

//*- Java:   public static Set<String> getSubscriptions(Context context)
+ (NSArray*)getSubscriptions:(AndroidContext*)context;


@end
