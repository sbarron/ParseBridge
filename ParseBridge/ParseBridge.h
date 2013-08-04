#import <BridgeKit/JavaObject.h>

@interface HelloBridge : JavaObject
@property (nonatomic, assign) int intValue;
- (id)initWithIntValue:(int)i doubleValue:(double)d;
- (void)setDoubleValue:(double)d;
- (double)doubleValue;
@end