//
//  NSString+XTDate.m
//  XTOnlineSchool
//
//  Created by Topredator on 2019/4/24.
//  Copyright © 2019 XT. All rights reserved.
//

#import "NSString+XTDate.h"
#import "XTFoundationMacro.h"
XTSYNTH_DUMMY_CLASS(NSString_XTDate)

@implementation NSString (XTDate)
- (NSString *)XTTimeWithFormatterType:(XTFormatterType)type {
    if (!self.length) return nil;
    NSString *format = nil;
    switch (type) {
        case XTFormatterTypeDefault:
            format = @"yyyy.MM.dd HH:mm:ss";
            break;
        case XTFormatterTypePoint:
            format = @"yyyy.MM.dd HH:mm";
            break;
        case XTFormatterTypeDash:
            format = @"yyyy-MM-dd HH:mm";
            break;
        case XTFormatterTypeText:
            format = @"yyyy年MM月dd日 HH:mm";
            break;
        case XTFormatterTypeOnlyDate:
            format = @"yyyy.MM.dd";
            break;
        case XTFormatterTypeOnlyDash:
            format = @"yyyy-MM-dd";
            break;
        case XTFormatterTypeOnlyText:
            format = @"yyyy年MM月dd日";
            break;
        case XTFormatterTypeOnlyDefaultMonth:
            format = @"MM.dd";
            break;
        case XTFormatterTypeOnlyDashMonth:
            format = @"MM-dd";
            break;
        case XTFormatterTypeOnlyTextMonth:
            format = @"MM月dd日";
            break;
        case XTFormatterTypeOnlyHours:
            format = @"HH:mm";
            break;
        default:
            format = @"yyyy.MM.dd HH:mm:ss";
            break;
    }
    return [self.class timeStringWithFormat:format timeStampString:self];
}

+ (NSString *)timeStringWithFormat:(NSString *)format timeStampString:(NSString *)timeStr {
    return [self timeStringWithFormat:format timeStamp:[timeStr doubleValue]];
}

+ (NSString *)timeStringWithFormat:(NSString *)format timeStamp:(NSTimeInterval)time {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time / 1000];
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = format;
    return [formatter stringFromDate:date];
}

- (NSString *)XTWeekday {
    if (!self.length) return nil;
    NSArray *weekdays = @[[NSNull null], @"星期天", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六"];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    [calendar setTimeZone: timeZone];
    NSCalendarUnit calendarUnit = NSCalendarUnitWeekday;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[self doubleValue] / 1000];
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:date];
    return [weekdays objectAtIndex:theComponents.weekday];
}





@end
