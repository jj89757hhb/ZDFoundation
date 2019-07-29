//
//  UIScrollView+XTExtend.h
//  XTOnlineSchool
//
//  Created by fanfangliang on 2019/6/11.
//  Copyright © 2019 XT. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (XTExtend)

- (void)xt_scrollToTop;

- (void)xt_scrollToBottom;

- (void)xt_scrollToLeft;

- (void)xt_scrollToRight;

- (void)xt_scrollToTopAnimated:(BOOL)animated;

- (void)xt_scrollToBottomAnimated:(BOOL)animated;

- (void)xt_scrollToLeftAnimated:(BOOL)animated;

- (void)xt_scrollToRightAnimated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
