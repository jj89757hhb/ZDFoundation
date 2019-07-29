//
//  UIFont+XTExtend.m
//  XTOnlineSchool
//
//  Created by fanfangliang on 2019/6/11.
//  Copyright © 2019 XT. All rights reserved.
//

#import "UIFont+XTExtend.h"
#import "XTFoundationMacro.h"
XTSYNTH_DUMMY_CLASS(UIFont_XTExtend)

@implementation UIFont (XTExtend)
+ (UIFont *)xt_pingFangSCRegularFontWithSize:(CGFloat)size {
    return [UIFont fontWithName:@"PingFangSC-Regular" size:size];
}

+ (UIFont *)xt_pingFangSCMediumFontWithSize:(CGFloat)size {
    return [UIFont fontWithName:@"PingFangSC-Medium" size:size];
}

+ (UIFont *)xt_pingFangSCLightFontWithSize:(CGFloat)size {
    return [UIFont fontWithName:@"PingFangSC-Light" size:size];
}

+ (UIFont *)xt_pingFangSCSemiboldFontWithSize:(CGFloat)size {
    return [UIFont fontWithName:@"PingFangSC-Semibold" size:size];
}

+ (UIFont *)xt_pingFangSCThinFontWithSize:(CGFloat)size {
    return [UIFont fontWithName:@"PingFangSC-Thin" size:size];
}
@end
