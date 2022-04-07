//
//  QYDateUtilities.m
//  QYMobileKit
//
//  Created by Peter Wen on 2022/4/7.
//

#import "QYDateUtilities.h"

@implementation NSDate (QYDateConverterExtensions)

+ (instancetype)dateWithString:(NSString *)dateString dateFormat:(NSString *)dateFormat {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:dateFormat];
    NSDate *date = [formatter dateFromString:dateString];
    return date;
}
- (NSString *)stringWithDateFormat:(NSString *)dateFormat {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:dateFormat];
    NSString *dateString = [dateFormatter stringFromDate:self];
    return dateString;
}

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
