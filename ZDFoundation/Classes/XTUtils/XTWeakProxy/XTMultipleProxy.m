//
//  XTMultipleProxy.m
//  XTFoundation
//
//  Created by Topredator on 2019/6/14.
//

#import "XTMultipleProxy.h"

@implementation XTMultipleProxy
@synthesize objects = _objects;
- (BOOL)respondsToSelector:(SEL)aSelector {
    for (id obj in self.objects) {
        if ([obj respondsToSelector:aSelector]) {
            return YES;
        }
    }
    return NO;
}

+ (instancetype)proxyWithObjects:(NSArray *)objects {
    return [(XTMultipleProxy *)[self alloc] initWithObjects:objects];
}

- (instancetype)initWithObjects:(NSArray *)objects {
    NSPointerArray *array = [NSPointerArray weakObjectsPointerArray];
    for (id obj in objects) {
        [array addPointer:(__bridge void *)(obj)];
    }
    _objects = array;
    return self;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    NSMethodSignature *sign;
    for (id obj in self.objects) {
        sign = [obj methodSignatureForSelector:aSelector];
        if (sign) {
            break;
        }
    }
    return sign;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation{
    for (id obj in self.objects) {
        if ([obj respondsToSelector:anInvocation.selector]) {
            [anInvocation invokeWithTarget:obj];
        }
    }
}
@end
