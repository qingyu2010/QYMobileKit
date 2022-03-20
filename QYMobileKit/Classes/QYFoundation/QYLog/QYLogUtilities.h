//
//  LogUtilities.h
//  SDP
//
//  Created by Peter Wen on 2022/3/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
///配置QYLog是否打印
/// -parameter: able 是否开启日志功能
FOUNDATION_EXPORT void QYLogConfig(BOOL able);

///打印log
/// -parameter: format打印字符串格式
FOUNDATION_EXPORT void QYLog(NSString *format, ...);

NS_ASSUME_NONNULL_END
