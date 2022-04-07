//
//  QYDateUtilities.h
//  QYMobileKit
//
//  Created by Peter Wen on 2022/4/7.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (QYDateConverterExtensions)

///NSString转NSDate
/// - parameter: dateString 输入的时间string
/// - parameter: dateFormat 输入的时间格式 @"yyyy-MM-dd HH:mm:ss"
+ (instancetype)dateWithString:(NSString *)dateString dateFormat:(NSString *)dateFormat;

///NSDate转NSString
/// - parameter: dateFormat 输入的时间格式 @"yyyy-MM-dd HH:mm:ss"
- (NSString *)stringWithDateFormat:(NSString *)dateFormat;

///和另一个date比较
///大于otherDate 返回 1
///等于otherDate 返回 0
///小于otherDate 返回 -1
/// - parameter: otherDate 比较的时间date
- (NSInteger)compareWithDate:(NSDate *)otherDate;

///和另一个date比较,只比较指定格式的时间
///大于otherDate 返回 1
///等于otherDate 返回 0
///小于otherDate 返回 -1
/// - parameter: otherDate 比较的时间date
/// - parameter: dateFormat 输入的时间格式 @"yyyy-MM-dd HH:mm:ss"
- (NSInteger)compareWithDate:(NSDate *)otherDate dateFormat:(NSString *)dateFormat;

@end

NS_ASSUME_NONNULL_END
