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

typedef enum parseErrorCode : int {
	ACCOUNT_ALREADY_LINKED			=	208,
	CACHE_MISS						=	120,
	COMMAND_UNAVAILABLE				=	108,
	CONNECTION_FAILED				=	100,
	DUPLICATE_VALUE					=	137,
	EMAIL_MISSING					=	204,
	EMAIL_NOT_FOUND					=	205,
	EMAIL_TAKEN						=	203,
	EXCEEDED_QUOTA					=	140,
	FILE_DELETE_ERROR				=	153,
	INCORRECT_TYPE					=	111,
	INTERNAL_SERVER_ERROR			=	1,
	INVALID_ACL						=	123,
	INVALID_CHANNEL_NAME			=	112,
	INVALID_CLASS_NAME				=	103,
	INVALID_EMAIL_ADDRESS			=	125,
	INVALID_FILE_NAME				=	122,
	INVALID_JSON					=	107,
	INVALID_KEY_NAME				=	105,
	INVALID_LINKED_SESSION			=	251,
	INVALID_NESTED_KEY				=	121,
	INVALID_POINTER					=	106,
	INVALID_QUERY					=	102,
	INVALID_ROLE_NAME				=	139,
	LINKED_ID_MISSING				=	250,
	MISSING_OBJECT_ID				=	104,
	MUST_CREATE_USER_THROUGH_SIGNUP	=	207,
	NOT_INITIALIZED					=	109,
	OBJECT_NOT_FOUND				=	101,
	OBJECT_TOO_LARGE				=	116,
	OPERATION_FORBIDDEN				=	119,
	OTHER_CAUSE						=	-1,
	PASSWORD_MISSING				=	201,
	PUSH_MISCONFIGURED				=	115,
	SCRIPT_ERROR					=	141,
	SESSION_MISSING					=	206,
	TIMEOUT							=	124,
	UNSUPPORTED_SERVICE				=	252,
	USERNAME_MISSING				=	200,
	USERNAME_TAKEN					=	202,
	VALIDATION_ERROR				=	142,

} parseErrorCode;

@class JavaThrowable;

@interface ParseException : JavaObject{
}

-(id)initParseExceptionWithCode:(int)errorcode message:(NSString*)message;
-(id)initParseExceptionWithMessageandCause:(NSString*)message throwable:(JavaThrowable*)throwable;
-(id)initParseExceptionWithCause:(JavaThrowable*)throwable;

-(int)getCode;

@end
