//
//  NSObject+XTNotify.m
//  XTOnlineSchool
//
//  Created by fanfangliang on 2019/6/12.
//  Copyright © 2019 XT. All rights reserved.
//

#import "NSObject+XTNotify.h"
#import <objc/runtime.h>
#import "XTFoundationMacro.h"
XTSYNTH_DUMMY_CLASS(NSObject_XTNotify)


static char XTNotifyObserverMapKey;

@interface _XTNotifyObserverMap_ : NSObject
@property (nonatomic, strong) NSMutableDictionary *dict;

@end

@implementation _XTNotifyObserverMap_
- (id)init {
    if ((self = [super init])) {
        _dict = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)dealloc {
    [self removeAllObservers];
}

- (void)setObserver:(id)observer forKey:(NSString *)key object:(id)object {
    NSMapTable *map = self.dict[key];
    object = object ?: self;
    if (!map) {
        map = [NSMapTable weakToStrongObjectsMapTable];
        [map setObject:observer forKey:object];
        [self.dict setObject:map forKey:key];
    } else {
        id oldObserver = [map objectForKey:object];
        if (oldObserver) {
            [[NSNotificationCenter defaultCenter] removeObserver:oldObserver];
        }
        [map setObject:observer forKey:object];
    }
}

- (id)observerForKey:(NSString *)key object:(id)object {
    NSMapTable *table = self.dict[key];
    return table ? [table objectForKey:object] : nil;
}

- (void)removeAllObservers {
    NSArray *allValues = self.dict.allValues;
    for (NSMapTable *map in allValues) {
        for (id observer in map.objectEnumerator) {
            [[NSNotificationCenter defaultCenter] removeObserver:observer];
        }
    }
    [self.dict removeAllObjects];
}

- (void)removeObserverForKey:(NSString *)key object:(id)object {
    NSMapTable *map = [self.dict objectForKey:key];
    if (!map) {
        return;
    }
    if (object) {
        id observer = [map objectForKey:object];
        if (!observer) {
            return;
        }
        [[NSNotificationCenter defaultCenter] removeObserver:observer];
        [map removeObjectForKey:object];
        if (map.count == 0) {
            [self.dict removeObjectForKey:key];
        }
    } else {
        for (id observer in map.objectEnumerator) {
            [[NSNotificationCenter defaultCenter] removeObserver:observer];
        }
        [self.dict removeObjectForKey:key];
    }
}

- (BOOL)isEmpty {
    return self.dict.count == 0;
}

@end
@implementation NSObject (XTNotify)
static char XTNotifyObserverMapKey;

#pragma mark - Observe notifaction
- (id)xt_observeNotificationByName:(NSString *)name withNotifyBlock:(XTNotifyBlock)block {
    return [self xt_observeNotificationByName:name withObject:nil notifyBlock:block];
}

- (id)xt_observeNotificationByName:(NSString *)name withObject:(id)object notifyBlock:(XTNotifyBlock)block {
    NSOperationQueue *op = [NSOperationQueue mainQueue];
    id observer = [[NSNotificationCenter defaultCenter] addObserverForName:name object:object queue:op usingBlock:block];
    _XTNotifyObserverMap_ *map = objc_getAssociatedObject(self, &XTNotifyObserverMapKey);
    if (!map) {
        map = [[_XTNotifyObserverMap_ alloc] init];
        objc_setAssociatedObject(self, &XTNotifyObserverMapKey, map, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    [map setObserver:observer forKey:name object:object];
    return observer;
}

- (id)xt_observeNotificationByName:(NSString *)name withSelector:(SEL)selector {
    return [self xt_observeNotificationByName:name withObject:nil selector:selector];
}

- (id)xt_observeNotificationByName:(NSString *)name withObject:(id)object selector:(SEL)selector {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    __weak typeof(self) weakSelf = self;
    return [self xt_observeNotificationByName:name withObject:object notifyBlock:^(NSNotification *note) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf performSelector:selector withObject:note];
    }];
#pragma clang diagnostic pop
}

- (BOOL)xt_isObservedNotificationByName:(NSString *)name {
    _XTNotifyObserverMap_ *map = objc_getAssociatedObject(self, &XTNotifyObserverMapKey);
    if (map) {
        if ([map observerForKey:name object:nil]) {
            return YES;
        }
    }
    return NO;
}

#pragma mark - Remove notifaction observer
- (void)xt_removeAllObservedNotifications {
    _XTNotifyObserverMap_ *dic = objc_getAssociatedObject(self, &XTNotifyObserverMapKey);
    if (dic) {
        [dic xt_removeAllObservedNotifications];
        objc_setAssociatedObject(self, &XTNotifyObserverMapKey, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

- (void)xt_removeObservedNotificationByName:(NSString *)name {
    return [self xt_removeObservedNotificationByName:name object:nil];
}

- (void)xt_removeObservedNotificationByName:(NSString *)name object:(id)object {
    _XTNotifyObserverMap_ *dic = objc_getAssociatedObject(self, &XTNotifyObserverMapKey);
    if (dic) {
        [dic removeObserverForKey:name object:object];
        if ([dic isEmpty]) {
            objc_setAssociatedObject(self, &XTNotifyObserverMapKey, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
}
#pragma mark - Deprecated
- (void)xt_listenNotificationByName:(NSString *)name withNotifyBlock:(void(^)(NSNotification *note, id weakSelf))block {
    [self xt_listenNotificationByName:name withObject:nil notifyBlock:block];
}

- (void)xt_listenNotificationByName:(NSString *)name withObject:(id)object notifyBlock:(void(^)(NSNotification *note, id weakSelf))block {
    __weak typeof(self) weakSelf = self;
    [self xt_observeNotificationByName:name withObject:object notifyBlock:^(NSNotification *note) {
        block(note, weakSelf);
    }];
}

- (BOOL)xt_isListenedNotificationByName:(NSString *)name {
    return [self xt_isObservedNotificationByName:name];
}
@end
