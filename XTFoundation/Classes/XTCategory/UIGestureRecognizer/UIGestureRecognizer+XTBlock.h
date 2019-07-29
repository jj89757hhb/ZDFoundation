//
//  UIGestureRecognizer+XTBlock.h
//  XTOnlineSchool
//
//  Created by fanfangliang on 2019/6/11.
//  Copyright © 2019 XT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIGestureRecognizer (XTBlock)

- (instancetype)initWithActionBlock:(void (^)(id sender))block;

- (void)xt_addActionBlock:(void (^)(id sender))block;

- (void)xt_removeAllActionBlocks;
@end

