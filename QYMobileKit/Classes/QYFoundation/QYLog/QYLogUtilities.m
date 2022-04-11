//
//  LogUtilities.m
//  SDP
//
//  Created by Peter Wen on 2022/3/12.
//

#import "QYLogUtilities.h"
#import <Foundation/Foundation.h>

static BOOL logAble = YES;
///配置QYLog是否打印
/// -parameter: able 是否开启日志功能
void QYLogConfig(BOOL able) {
    logAble = able;
}
///打印log
/// -parameter: format打印字符串格式
void QYLog(NSString *format, ...) {
    if (logAble) {
        va_list args;
        va_start(args, format);
        NSLogv(format, args);
        va_end(args);
    }
}


