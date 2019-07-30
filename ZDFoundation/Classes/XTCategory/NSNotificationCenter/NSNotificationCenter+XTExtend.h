//
//  NSNotificationCenter+XTExtend.h
//  XTOnlineSchool
//
//  Created by fanfangliang on 2019/6/11.
//  Copyright © 2019 XT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNotificationCenter (XTExtend)

- (void)xt_postNotificationOnMainThread:(NSNotification *)notification;

- (void)xt_postNotificationOnMainThread:(NSNotification *)notification
                       waitUntilDone:(BOOL)wait;

- (void)xt_postNotificationOnMainThreadWithName:(NSString *)name
                                      object:(nullable id)object;

- (void)xt_postNotificationOnMainThreadWithName:(NSString *)name
                                      object:(nullable id)object
                                    userInfo:(nullable NSDictionary *)userInfo;

- (void)xt_postNotificationOnMainThreadWithName:(NSString *)name
                                      object:(nullable id)object
                                    userInfo:(nullable NSDictionary *)userInfo
                               waitUntilDone:(BOOL)wait;
@end

