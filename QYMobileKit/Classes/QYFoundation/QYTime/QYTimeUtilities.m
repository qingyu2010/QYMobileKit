//
//  QYTimeUtilities.m
//  QYMobileKit_Example
//
//  Created by Peter Wen on 2022/3/20.
//  Copyright © 2022 qingyu2010. All rights reserved.
//

#import "QYTimeUtilities.h"

dispatch_time_t QYCreateDispatchTime(double second) {
    return dispatch_time(DISPATCH_TIME_NOW, (int64_t)(second * NSEC_PER_SEC));
}

dispatch_time_t QYCreateDispatchTimeWithMsec(double millisecond) {
    return dispatch_time(DISPATCH_TIME_NOW, (int64_t)(millisecond * NSEC_PER_MSEC));
}

int64_t QYSecondToNanoseconds(double second) {
    return (uint64_t)(second * NSEC_PER_SEC);
}

int64_t QYMillisecondToNanoseconds(double millisecond) {
    return (uint64_t)(millisecond * NSEC_PER_MSEC);
}
