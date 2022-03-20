//
//  QYTimeUtilities.h
//  QYMobileKit_Example
//
//  Created by Peter Wen on 2022/3/20.
//  Copyright © 2022 qingyu2010. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

///以秒创建dispatch_time_t
/// -parameter: second秒
FOUNDATION_EXPORT dispatch_time_t QYCreateDispatchTime(double second);

///以毫秒创建dispatch_time_t
/// parameter: millisecond毫秒
FOUNDATION_EXPORT dispatch_time_t QYCreateDispatchTimeWithMsec(double millisecond);

///通过参数秒转换成纳秒
/// -parameter: second秒
FOUNDATION_EXPORT int64_t QYSecondToNanoseconds(double second);

///通过参数毫秒转换成纳秒
/// -parameter: millisecond毫秒
FOUNDATION_EXPORT int64_t QYMillisecondToNanoseconds(double millisecond);

NS_ASSUME_NONNULL_END
