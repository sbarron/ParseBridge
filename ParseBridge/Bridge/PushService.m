//
//  PushService.m
//  ParseBridge
//
//  Created by Spencer Barron on 8/13/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import "PushService.h"
#import <BridgeKit/AndroidActivity.h>
#import <BridgeKit/AndroidContext.h>
#import <BridgeKit/JavaSet.h>

@implementation PushService

+ (void)initializeJava
{
    [super initializeJava];
	
	//Constructor
	//*- Java: public PushService()
	/*
		Client code should not construct a PushService directly.
	 */
	[PushService registerConstructor];

	//*- Java:   public static void startServiceIfRequired(Context context)
	//*- iOS Bridge Method:  +(void)startServiceIfRequired:(AndroidContext*)context;
	[PushService registerStaticMethod:@"startServiceIfRequired"
					   selector:@selector(startServiceIfRequired:)
					returnValue:nil
					  arguments:[AndroidContext className], nil];
	
	
	//*- Java:   public static void subscribe(Context context,String channel,Class<? extends Activity> cls)
	//*- iOS Bridge Method:  +(void)subscribe:(AndroidContext*)context channel:(NSString*)channel activitySubClass:(AndroidActivity*)activitySubClass;
	[PushService registerStaticMethod:@"subscribe"
							 selector:@selector(subscribe:channel:activitySubClass:)
						  returnValue:nil
							arguments:[AndroidContext className], [NSString className], [AndroidActivity className], nil];
				

	//*- Java:   public static void subscribe(Context context,String channel,Class<? extends Activity> cls,int icon)
	//*- iOS Bridge Method:  +(void)subscribeWithIcon:(AndroidContext*)context channel:(NSString*)channel activitySubClass:(AndroidActivity*)activitySubClass icon:(int)icon;
	[PushService registerStaticMethod:@"subscribe"
							 selector:@selector(subscribe:channel:activitySubClass:icon:)
						  returnValue:nil
							arguments:[AndroidContext className], [NSString className], [AndroidActivity className], [JavaClass intPrimitive], nil];
		/*Call this function when the user should be subscribed to a new push channel. When push notifications are sent out on this channel subsequently, this device will display a "toast" notification in the system tray. This function returns immediately, even when there is no internet access. In that case the subscription is cached and when internet access is next available the client will inform the server of its subscription. This starts a PushService running in the background that will not permanently terminate as long as the user is subscribed to some channel, unless the application is uninstalled.*/
		/*Parameters:
			context - This is used to access local storage to cache the subscription, so it must currently be a viable context.
			channel - A string identifier that determines which messages will cause a push notification to be sent to this client. The channel name must start with a letter and contain only letters, numbers, dashes, and underscores.
			cls - This should be a subclass of Activity. An instance of this Activity is started when the user responds to this push notification. If you are not sure what to use here, just use your application's main Activity subclass.
			icon - The icon to show for the notification.*/
		//Throws: IllegalArgumentException - if the channel name is not valid.



	//*- Java:   public static void unsubscribe(Context context,String channel)
	//*- iOS Bridge Method:  +(void)unsubscribe:(AndroidContext*)context channel:(NSString*)channel;
	[PushService registerStaticMethod:@"unsubscribe"
							 selector:@selector(unsubscribe:channel:)
						  returnValue:nil
							arguments:[AndroidContext className], [NSString className], nil];
	//Cancels a previous call to subscribe. If the user is not subscribed to this channel, this is a no-op. This call does not require internet access. It returns without blocking.
 

	//*- Java:   public static void setDefaultPushCallback(Context context,Class<? extends Activity> cls)
	//*- iOS Bridge Method:  +(void)setDefaultPushCallback:(AndroidContext*)context activitySubClass:(AndroidActivity*)activitySubClass;
	[PushService registerStaticMethod:@"setDefaultPushCallback"
							 selector:@selector(setDefaultPushCallback:activitySubClass:)
						  returnValue:nil
							arguments:[AndroidContext className], [AndroidActivity className], nil];
		//Provides a default Activity class to handle pushes. Setting a default allows your program to handle pushes that aren't registered with a subscribe call. This can happen when your application changes its subscriptions directly through the ParseInstallation or via push-to-query.
			// Parameters:
			// context - This is used to access local storage to cache the subscription, so it must currently be a viable context.
			// cls - This should be a subclass of Activity. An instance of this Activity is started when the user responds to this push notification. If you are not sure what to use here, just use your application's main Activity subclass.


	//*- Java:  public static void setDefaultPushCallback(Context context,Class<? extends Activity> cls,int icon)
	//*- iOS Bridge Method:  +(void)setDefaultPushCallbackWithIcon:(AndroidContext*)context activitySubClass:(AndroidActivity*)activitySubClass icon:(int)icon;
	[PushService registerStaticMethod:@"setDefaultPushCallback"
							 selector:@selector(setDefaultPushCallbackWithIcon:activitySubClass:icon:)
						  returnValue:nil
							arguments:[AndroidContext className], [AndroidActivity className], [JavaClass intPrimitive], nil];

		//Provides a default Activity class to handle pushes. Setting a default allows your program to handle pushes that aren't registered with a subscribe call. This can happen when your application changes its subscriptions directly through the ParseInstallation or via push-to-query.
		//Parameters:
		//context - This is used to access local storage to cache the subscription, so it must currently be a viable context.
		//cls - This should be a subclass of Activity. An instance of this Activity is started when the user responds to this push notification. If you are not sure what to use here, just use your application's main Activity subclass.
		//icon - The icon to show for the notification.


	//*- Java:   public static Set<String> getSubscriptions(Context context)
	//*- iOS Bridge Method: +(JavaSet*)getSubscriptions:(AndroidContext*)context;
	[PushService registerStaticMethod:@"getSubscriptions"
							 selector:@selector(getSubscriptions:)
						  returnValue:[JavaSet className]
							arguments:[AndroidContext className], nil];
	//Accesses the current set of channels for which the current installation is subscribed. It is important to remember that the device may receive pushes by means other than channels. This method returns the local cache, so it returns without blocking on network IO. In rare circumstances this may be stale, but only after the installation was edited via the REST API using the master key.
	//Parameters:
		//context - A currently viable Context.
	//Returns:
	//A set containing all of the channels this application is currently subscribed to.

	//*- Java: public void onCreate()
	//*- Java:  public IBinder onBind(Intent intent)
	//*- Java:   public void onDestroy()



	



}

+ (NSString *)className
{
    return @"com.parse.PushService";
}

@end

