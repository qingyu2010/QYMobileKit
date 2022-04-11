//
//  QYDataUtilities.h
//  QYMobileKit
//
//  Created by Peter Wen on 2022/4/11.
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



NS_ASSUME_NONNULL_END
