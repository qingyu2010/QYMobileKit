//
//  QYDateUtilities.m
//  QYMobileKit
//
//  Created by Peter Wen on 2022/4/7.
//

#import "QYDateUtilities.h"

@implementation NSDate (QYDateConverterExtensions)
///NSString转NSDate
/// - parameter: dateString 输入的时间string
/// - parameter: dateFormat 输入的时间格式 @"yyyy-MM-dd HH:mm:ss"
+ (instancetype)dateWithString:(NSString *)dateString dateFormat:(NSString *)dateFormat {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:dateFormat];
    NSDate *date = [formatter dateFromString:dateString];
    return date;
}
///NSDate转NSString
/// - parameter: dateFormat 输入的时间格式 @"yyyy-MM-dd HH:mm:ss"
- (NSString *)stringWithDateFormat:(NSString *)dateFormat {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:dateFormat];
    NSString *dateString = [dateFormatter stringFromDate:self];
    return dateString;
}
///和另一个date比较
///大于otherDate 返回 1
///等于otherDate 返回 0
///小于otherDate 返回 -1
/// - parameter: otherDate 比较的时间date
- (NSInteger)compareWithDate:(NSDate *)otherDate {
    NSInteger result = 0;
    NSComparisonResult r = [self compare:otherDate];
    if (r == NSOrderedSame) {
        result = 0;
    } else if (r == NSOrderedAscending) {
        result = -1;
    } else {
        result = 1;
    }
    return result;
}
///和另一个date比较,只比较指定格式的时间
///大于otherDate 返回 1
///等于otherDate 返回 0
///小于otherDate 返回 -1
/// - parameter: otherDate 比较的时间date
/// - parameter: dateFormat 输入的时间格式 @"yyyy-MM-dd HH:mm:ss"
- (NSInteger)compareWithDate:(NSDate *)otherDate dateFormat:(NSString *)dateFormat {
    NSString *selfString = [self stringWithDateFormat:dateFormat];
    NSString *otherString = [otherDate stringWithDateFormat:dateFormat];
    NSInteger result = 0;
    NSComparisonResult r = [selfString compare:otherString];
    if (r == NSOrderedSame) {
        result = 0;
    } else if (r == NSOrderedAscending) {
        result = -1;
    } else {
        result = 1;
    }
    return result;
}


@end
