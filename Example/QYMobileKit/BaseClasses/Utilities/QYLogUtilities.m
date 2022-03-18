//
//  LogUtilities.m
//  SDP
//
//  Created by Peter Wen on 2022/3/12.
//

#import "QYLogUtilities.h"
#import <Foundation/Foundation.h>


void QYLog(NSString *format, ...) {
    if (1) {
        va_list args;
        va_start(args, format);
        NSLogv(format, args);
        va_end(args);
    }
}

void QYDLog(NSString *format, ...) {
    if (1) {
        va_list args;
        va_start(args, format);
        NSLogv(format, args);
        va_end(args);
    }
}

