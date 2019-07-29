//
//  UIView+XTToImage.m
//  XTOnlineSchool
//
//  Created by fanfangliang on 2019/6/11.
//  Copyright © 2019 XT. All rights reserved.
//

#import "UIView+XTToImage.h"
#import "XTFoundationMacro.h"
XTSYNTH_DUMMY_CLASS(UIView_XTToImage)

@implementation UIView (XTToImage)

- (UIImage *)xt_snapshotImage {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *snap = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return snap;
}

- (UIImage *)xt_snapshotImageAfterScreenUpdates:(BOOL)afterUpdates {
    if (![self respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)]) {
        return [self xt_snapshotImage];
    }
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0);
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:afterUpdates];
    UIImage *snap = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return snap;
}
@end
