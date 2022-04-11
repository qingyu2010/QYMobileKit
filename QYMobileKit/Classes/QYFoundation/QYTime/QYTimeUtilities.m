//
//  QYTimeUtilities.m
//  QYMobileKit_Example
//
//  Created by Peter Wen on 2022/3/20.
//  Copyright © 2022 qingyu2010. All rights reserved.
//

#import "QYTimeUtilities.h"
///以秒创建dispatch_time_t
/// -parameter: second秒
dispatch_time_t QYCreateDispatchTime(double second) {
    return dispatch_time(DISPATCH_TIME_NOW, (int64_t)(second * NSEC_PER_SEC));
}
///以毫秒创建dispatch_time_t
/// parameter: millisecond毫秒
dispatch_time_t QYCreateDispatchTimeWithMsec(double millisecond) {
    return dispatch_time(DISPATCH_TIME_NOW, (int64_t)(millisecond * NSEC_PER_MSEC));
}
///通过参数秒转换成纳秒
/// -parameter: second秒
int64_t QYSecondToNanoseconds(double second) {
    return (uint64_t)(second * NSEC_PER_SEC);
}
///通过参数毫秒转换成纳秒
/// -parameter: millisecond毫秒
int64_t QYMillisecondToNanoseconds(double millisecond) {
    return (uint64_t)(millisecond * NSEC_PER_MSEC);
}
