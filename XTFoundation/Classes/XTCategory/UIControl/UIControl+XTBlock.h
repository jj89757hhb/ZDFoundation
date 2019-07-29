//
//  UIControl+XTBlock.h
//  XTOnlineSchool
//
//  Created by fanfangliang on 2019/6/11.
//  Copyright © 2019 XT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (XTBlock)

- (void)xt_removeAllTargets;

- (void)xt_setTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;

- (void)xt_addBlockForControlEvents:(UIControlEvents)controlEvents block:(void (^)(id sender))block;

- (void)xt_setBlockForControlEvents:(UIControlEvents)controlEvents block:(void (^)(id sender))block;

- (void)xt_removeAllBlocksForControlEvents:(UIControlEvents)controlEvents;

@end
