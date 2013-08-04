//
//  ParseManager.m
//  HelloJava
//
//  Created by Spencer Barron on 7/22/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import "ParseManager.h"



@implementation ParseManager

+ (void)initializeJava
{
	
	NSLog(@"InitializeJava Parse.h bridge");
	
	[super initializeJava];
    // Note: this must be called for any class that registers custom
    // java apis, without this call the inheritance may not work as expected
    
	[ParseManager registerConstructorWithSelector:@selector(initParse)
                                       arguments:[AndroidContext className], nil];
    
	//[ParseManager registerInstanceMethod:@"initParse"
					//   selector:@selector(initParse:)
				//	returnValue:nil
				//	  arguments:[AndroidContext className], nil];
				
	[ParseManager registerInstanceMethod:@"createTestObject"
                               selector:@selector(createTestObject)
							  arguments:nil];
				
	[ParseManager registerInstanceMethod:@"testClass"
                               selector:@selector(testClass)
							  arguments:nil];
				
	[ParseManager registerCallback:@"bridgeCallback"
                         selector:@selector(callBack:)
                      returnValue:nil
                        arguments:[JavaClass intPrimitive], nil];

	
	NSLog(@"ParseManager.h associated with %@", [[ParseManager javaClass] className]);
}


+ (NSString *)className
{
    return @"com.parsebridge.parsebridge.ParseManager";
}

-(void)callBack:(int)i{
	NSLog(@"Testing success = %i",i);
}





@end
