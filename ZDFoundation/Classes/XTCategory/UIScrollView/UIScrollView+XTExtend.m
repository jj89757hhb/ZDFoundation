//
//  UIScrollView+XTExtend.m
//  XTOnlineSchool
//
//  Created by fanfangliang on 2019/6/11.
//  Copyright © 2019 XT. All rights reserved.
//

#import "UIScrollView+XTExtend.h"
#import "XTFoundationMacro.h"
XTSYNTH_DUMMY_CLASS(UIScrollView_XTExtend)

@implementation UIScrollView (XTExtend)

- (void)xt_scrollToTop {
    [self xt_scrollToTopAnimated:YES];
}

- (void)xt_scrollToBottom {
    [self xt_scrollToBottomAnimated:YES];
}

- (void)xt_scrollToLeft {
    [self xt_scrollToLeftAnimated:YES];
}

- (void)xt_scrollToRight {
    [self xt_scrollToRightAnimated:YES];
}

- (void)xt_scrollToTopAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.y = 0 - self.contentInset.top;
    [self setContentOffset:off animated:animated];
}

- (void)xt_scrollToBottomAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.y = self.contentSize.height - self.bounds.size.height + self.contentInset.bottom;
    [self setContentOffset:off animated:animated];
}

- (void)xt_scrollToLeftAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.x = 0 - self.contentInset.left;
    [self setContentOffset:off animated:animated];
}

- (void)xt_scrollToRightAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.x = self.contentSize.width - self.bounds.size.width + self.contentInset.right;
    [self setContentOffset:off animated:animated];
}

@end
