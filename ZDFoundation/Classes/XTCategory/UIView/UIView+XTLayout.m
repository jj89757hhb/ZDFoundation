//
//  UIView+XTLayout.m
//  XTOnlineSchool
//
//  Created by fanfangliang on 2019/6/11.
//  Copyright © 2019 XT. All rights reserved.
//

#import "UIView+XTLayout.h"
#import "XTFoundationMacro.h"
XTSYNTH_DUMMY_CLASS(UIView_XTLayout)

@implementation UIView (XTLayout)

- (CGFloat)xt_x {
    return self.frame.origin.x;
}

- (void)setXt_x:(CGFloat)xt_x {
    CGRect frame = self.frame;
    frame.origin.x = xt_x;
    self.frame = frame;
}

- (CGFloat)xt_y {
     return self.frame.origin.y;
}

- (void)setXt_y:(CGFloat)xt_y {
    CGRect frame = self.frame;
    frame.origin.y = xt_y;
    self.frame = frame;
}

- (CGFloat)xt_left {
    return self.xt_x;
}

- (void)setXt_left:(CGFloat)xt_left {
    self.xt_x = xt_left;
}

- (CGFloat)xt_top {
    return self.xt_y;
}

- (void)setXt_top:(CGFloat)xt_top {
    self.xt_y = xt_top;
}

- (CGFloat)xt_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setXt_right:(CGFloat)xt_right {
    CGRect frame = self.frame;
    frame.origin.x = xt_right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)xt_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setXt_bottom:(CGFloat)xt_bottom {
    CGRect frame = self.frame;
    frame.origin.y = xt_bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)xt_width {
    return self.frame.size.width;
}

- (void)setXt_width:(CGFloat)xt_width {
    CGRect frame = self.frame;
    frame.size.width = xt_width;
    self.frame = frame;
}

- (CGFloat)xt_height {
    return self.frame.size.height;
}

- (void)setXt_height:(CGFloat)xt_height {
    CGRect frame = self.frame;
    frame.size.height = xt_height;
    self.frame = frame;
}

- (CGFloat)xt_centerX {
    return self.center.x;
}

- (void)setXt_centerX:(CGFloat)xt_centerX {
    self.center = CGPointMake(xt_centerX, self.center.y);
}

- (CGFloat)xt_centerY {
    return self.center.y;
}

- (void)setXt_centerY:(CGFloat)xt_centerY {
    self.center = CGPointMake(self.center.x, xt_centerY);
}

- (CGPoint)xt_origin {
    return self.frame.origin;
}

- (void)setXt_origin:(CGPoint)xt_origin {
    CGRect frame = self.frame;
    frame.origin = xt_origin;
    self.frame = frame;
}

- (CGSize)xt_size {
    return self.frame.size;
}

- (void)setXt_size:(CGSize)xt_size {
    CGRect frame = self.frame;
    frame.size = xt_size;
    self.frame = frame;
}

@end
