//
//  NSString+XTCalSize.m
//  XTOnlineSchool
//
//  Created by fanfangliang on 2019/6/6.
//  Copyright © 2019 XT. All rights reserved.
//

#import "NSString+XTCalSize.h"
#import "XTFoundationMacro.h"
XTSYNTH_DUMMY_CLASS(NSString_XTCalSize)

@implementation NSString (XTCalSize)
#pragma 计算字符串的高度
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize {
    
    NSDictionary *attrs = @{NSFontAttributeName:font};
    
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:attrs context:nil].size;
    
}
@end
