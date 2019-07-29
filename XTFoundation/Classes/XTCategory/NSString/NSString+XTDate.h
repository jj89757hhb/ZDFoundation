//
//  NSString+XTDate.h
//  XTOnlineSchool
//
//  Created by Topredator on 2019/4/24.
//  Copyright © 2019 XT. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, XTFormatterType) {
    XTFormatterTypeDefault, // xxxx.xx.xx xx:xx:xx
    XTFormatterTypePoint, // xxxx.xx.xx xx:xx
    XTFormatterTypeDash, // xxxx-xx-xx xx:xx
    XTFormatterTypeText, // xxxx年xx月xx日 xx:xx
    XTFormatterTypeOnlyDate, // xxxx.xx.xx
    XTFormatterTypeOnlyDash, // xxxx-xx-xx
    XTFormatterTypeOnlyText, // xxxx年xx月xx日
    XTFormatterTypeOnlyDefaultMonth, // xx.xx
    XTFormatterTypeOnlyDashMonth, // xx-xx
    XTFormatterTypeOnlyTextMonth, // xx月xx日
    XTFormatterTypeOnlyHours // xx:xx
};

/**
 关于时间的扩展
 */
@interface NSString (XTDate)
/// 通过type输出 对应格式的时间字段
- (NSString *)XTTimeWithFormatterType:(XTFormatterType)type;
/// 星期几
- (NSString *)XTWeekday;

/// 从字符串转时间格式 毫秒级timeStr
+ (NSString *)timeStringWithFormat:(NSString *)format timeStampString:(NSString *)timeStr;
/// 从时间戳转时间格式 毫秒级time
+ (NSString *)timeStringWithFormat:(NSString *)format timeStamp:(NSTimeInterval)time;

@end
