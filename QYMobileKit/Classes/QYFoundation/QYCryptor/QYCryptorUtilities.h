//
//  QYCryptorUtilities.h
//  QYMobileKit
//
//  Created by Peter Wen on 2022/4/3.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (QYDataCryptorExtensions)

///base64算法加密NSData
@property (readonly, copy) NSData *base64EncodedDataForQY;

///base64算法解密 NSString ->NSData
/// - parameter: string解密前数据string
- (nullable instancetype)initWithBase64EncodedString:(NSString *)base64String;

///aes256算法加密NSData
/// - parameter: key 密钥
- (NSData *)aes256EncodedDataWithKey:(NSString *)key;

///aes256算法解密NSData
/// - parameter: key 密钥
- (NSData *)aes256DecodedDataWithKey:(NSString *)key;

@end

@interface NSString (QYStringCryptorExtensions)

///aes256算法加密NSString
/// - parameter: key 密钥
- (NSString *)aes256EncodedStringWithKey:(NSString *)key;

///aes256算法解密NSString
/// - parameter: key 密钥
- (NSString *)aes256DecodedStringWithKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
