//
//  LogUtilities.m
//  SDP
//
//  Created by Peter Wen on 2022/3/12.
//

#import "QYLogUtilities.h"
#import <Foundation/Foundation.h>

static BOOL logAble = YES;

void QYLogConfig(BOOL able) {
    logAble = able;
}

void QYLog(NSString *format, ...) {
    if (logAble) {
        va_list args;
        va_start(args, format);
        NSLogv(format, args);
        va_end(args);
    }
}


