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

///(NSDictonary or NSArray)转Json NSData
/// - parameter: obj 输入的Json obj(NSDictonary or NSArray)
+ (nullable NSData *)dataWithJSONObject:(id)obj;

///(NSDictonary or NSArray)转Json NSString
/// - parameter: obj 输入的Json obj(NSDictonary or NSArray)
+ (NSString *)jsonStringWithJSONObject:(id)obj;

///NSData转(NSDictonary or NSArray)
/// - parameter: data 输入的json格式NSData
+ (nullable id)jsonObjectWithData:(NSData *)data;

///jsonString转(NSDictonary or NSArray)
/// - parameter: jsonString 输入的json格式字符串
+ (nullable id)jsonObjectWithString:(NSString *)jsonString;

///data转十六进制字符串
/// - parameter: data 输入的data
+ (NSString *)hexStringWithData:(NSData *)data;

///HexString转NSData
/// - parameter: hexString 输入的字符串
+ (NSData *)dataWithHexString:(NSString *)hexString;

@end

NS_ASSUME_NONNULL_END
