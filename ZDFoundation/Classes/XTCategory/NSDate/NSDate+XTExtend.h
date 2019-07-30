//
//  NSDate+XTExtend.h
//  XTOnlineSchool
//
//  Created by fanfangliang on 2019/6/11.
//  Copyright © 2019 XT. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (XTExtend)
@property (nonatomic, readonly) NSInteger xt_year; ///< Year component
@property (nonatomic, readonly) NSInteger xt_month; ///< Month component (1~12)
@property (nonatomic, readonly) NSInteger xt_day; ///< Day component (1~31)
@property (nonatomic, readonly) NSInteger xt_hour; ///< Hour component (0~23)
@property (nonatomic, readonly) NSInteger xt_minute; ///< Minute component (0~59)
@property (nonatomic, readonly) NSInteger xt_second; ///< Second component (0~59)
@property (nonatomic, readonly) NSInteger xt_nanosecond; ///< Nanosecond component
@property (nonatomic, readonly) NSInteger xt_weekday; ///< Weekday component (1~7, first day is based on user setting)
@property (nonatomic, readonly) NSInteger xt_weekdayOrdinal; ///< WeekdayOrdinal component
@property (nonatomic, readonly) NSInteger xt_weekOfMonth; ///< WeekOfMonth component (1~5)
@property (nonatomic, readonly) NSInteger xt_weekOfYear; ///< WeekOfYear component (1~53)
@property (nonatomic, readonly) NSInteger xt_yearForWeekOfYear; ///< YearForWeekOfYear component
@property (nonatomic, readonly) NSInteger xt_quarter; ///< Quarter component
@property (nonatomic, readonly) BOOL xt_isLeapMonth; ///< whether the month is leap month
@property (nonatomic, readonly) BOOL xt_isLeapYear; ///< whether the year is leap year
@property (nonatomic, readonly) BOOL xt_isToday; ///< whether date is today (based on current locale)
@property (nonatomic, readonly) BOOL xt_isYesterday; ///< whether date is yesterday (based on current locale)
@property (nonatomic, readonly) BOOL xt_isSameWeek; /// whether date is same week (based on current locale)
#pragma mark - Date modify

- (nullable NSDate *)xt_dateByAddingYears:(NSInteger)years;
- (nullable NSDate *)xt_dateByAddingMonths:(NSInteger)months;
- (nullable NSDate *)xt_dateByAddingWeeks:(NSInteger)weeks;
- (nullable NSDate *)xt_dateByAddingDays:(NSInteger)days;
- (nullable NSDate *)xt_dateByAddingHours:(NSInteger)hours;
- (nullable NSDate *)xt_dateByAddingMinutes:(NSInteger)minutes;
- (nullable NSDate *)xt_dateByAddingSeconds:(NSInteger)seconds;


#pragma mark - Date Format
- (nullable NSString *)xt_stringWithFormat:(NSString *)format;
- (nullable NSString *)xt_stringWithFormat:(NSString *)format
                               timeZone:(nullable NSTimeZone *)timeZone
                                 locale:(nullable NSLocale *)locale;
- (nullable NSString *)xt_stringWithISOFormat;
+ (nullable NSDate *)xt_dateWithString:(NSString *)dateString format:(NSString *)format;
+ (nullable NSDate *)xt_dateWithString:(NSString *)dateString
                             format:(NSString *)format
                           timeZone:(nullable NSTimeZone *)timeZone
                             locale:(nullable NSLocale *)locale;
+ (nullable NSDate *)xt_dateWithISOFormatString:(NSString *)dateString;

@end

NS_ASSUME_NONNULL_END
