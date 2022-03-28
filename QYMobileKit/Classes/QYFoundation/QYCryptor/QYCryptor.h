//
//  QYCryptor.h
//  QYMobileKit
//
//  Created by Peter Wen on 2022/3/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QYCryptor : NSObject

///aes256算法加密NSData
/// - parameter: data 加密前数据data
/// - parameter: key 密钥
+ (NSData *)aes256EncodedDataWithOriginalData:(NSData *)data key:(NSString *)key;

///aes256算法解密NSData
/// - parameter: data解密前数据data
/// - parameter: key 密钥
+ (NSData *)aes256DecodedDataWithOriginalData:(NSData *)data key:(NSString *)key;

///aes256算法加密NSString
/// - parameter: string 加密前数据string
/// - parameter: key 密钥
+ (NSString *)aes256EncodedStringWithOriginalString:(NSString *)string key:(NSString *)key;

///aes256算法解密NSString
/// - parameter: string解密前数据string
/// - parameter: key 密钥
+ (NSString *)aes256DecodedStringWithOriginalString:(NSString *)string key:(NSString *)key;

///base64算法加密NSData
/// - parameter: data 加密前数据data
+ (NSData *)base64EncodedDataWithOriginalData:(NSData *)data;

///base64算法解密NSString
/// - parameter: string解密前数据string
+ (NSData *)base64DecodedDataWithOriginalString:(NSString *)string;

@end

NS_ASSUME_NONNULL_END
