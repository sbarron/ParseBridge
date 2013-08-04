//
//  ParseManager.h
//  HelloJava
//
//  Created by Spencer Barron on 7/22/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import <BridgeKit/JavaObject.h>
#import <BridgeKit/AndroidContext.h>

@interface ParseManager : JavaObject

-(id)initParse:(AndroidContext*)context;
-(void)createTestObject;
-(void)testClass;

@end
