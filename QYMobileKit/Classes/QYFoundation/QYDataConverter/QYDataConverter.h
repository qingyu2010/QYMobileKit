//
//  QYDataConverter.h
//  Pods
//
//  Created by Peter Wen on 2022/3/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QYDataConverter : NSObject

///NSString转NSData
/// - parameter: string 输入的字符串
+ (NSData *)dataWithString:(NSString *)string;

///NSData转NSString
/// - parameter: data 输入的data
+ (NSString *)stringWithData:(NSData *)data;


///Dictionary转Json NSString
/// - parameter: dic 输入的字典
+ (NSString *)jsonStringWithDictionary:(NSDictionary *)dic;

///jsonString转dictionary
/// - parameter: jsonString 输入的json格式字符串
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

///data转十六进制字符串
/// - parameter: data 输入的data
+ (NSString *)hexStringWithData:(NSData *)data;

///HexString转NSData
/// - parameter: hexString 输入的字符串
+ (NSData *)dataWithHexString:(NSString *)hexString;

@end

NS_ASSUME_NONNULL_END
