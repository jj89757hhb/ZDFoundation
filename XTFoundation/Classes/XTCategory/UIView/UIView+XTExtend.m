//
//  UIView+XTExtend.m
//  XTOnlineSchool
//
//  Created by fanfangliang on 2019/6/11.
//  Copyright © 2019 XT. All rights reserved.
//

#import "UIView+XTExtend.h"

#import "XTFoundationMacro.h"
XTSYNTH_DUMMY_CLASS(UIView_XTExtend)

@implementation UIView (XTExtend)
- (void)xt_removeAllSubviews {
    while (self.subviews.count) {
        [self.subviews.lastObject removeFromSuperview];
    }
}

@end
