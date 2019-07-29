//
//  NSObject+XTNotify.h
//  XTOnlineSchool
//
//  Created by fanfangliang on 2019/6/12.
//  Copyright © 2019 XT. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^XTNotifyBlock)(NSNotification *note);


NS_ASSUME_NONNULL_BEGIN

@interface NSObject (XTNotify)

///监听通知（如果self被释放，将会自动清除通知不需要手动停止监听；返回observer对象）
- (id)xt_observeNotificationByName:(NSString *)name withNotifyBlock:(XTNotifyBlock)block;
- (id)xt_observeNotificationByName:(NSString *)name withObject:(id)object notifyBlock:(XTNotifyBlock)block;
- (id)xt_observeNotificationByName:(NSString *)name withSelector:(SEL)selector;
- (id)xt_observeNotificationByName:(NSString *)name withObject:(id)object selector:(SEL)selector;
- (BOOL)xt_isObservedNotificationByName:(NSString *)name;

///主动停止通知监听
- (void)xt_removeAllObservedNotifications;
- (void)xt_removeObservedNotificationByName:(NSString *)name;
- (void)xt_removeObservedNotificationByName:(NSString *)name object:(id)object;

#pragma mark - Deprecated
- (void)xt_listenNotificationByName:(NSString *)name withNotifyBlock:(void(^)(NSNotification *note, id weakSelf))block __deprecated_msg("Use observeNotificationByName:withNotifyBlock:");
- (void)xt_listenNotificationByName:(NSString *)name withObject:(id)object notifyBlock:(void(^)(NSNotification *note, id weakSelf))block __deprecated_msg("Use observeNotificationByName:withObject:notifyBlock:");
- (BOOL)xt_isListenedNotificationByName:(NSString *)name __deprecated_msg("Use isObservedNotificationByName:");

@end

NS_ASSUME_NONNULL_END
