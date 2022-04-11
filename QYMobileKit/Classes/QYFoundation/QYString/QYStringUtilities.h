//
//  QYStringUtilities.h
//  QYMobileKit
//
//  Created by Peter Wen on 2022/4/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (QYStringCryptorExtensions)

///aes256算法加密NSString
/// - parameter: key 密钥
- (NSString *)aes256EncodedStringWithKey:(NSString *)key;

///aes256算法解密NSString
/// - parameter: key 密钥
- (NSString *)aes256DecodedStringWithKey:(NSString *)key;

@end



@interface NSString (QYStringRegexValidateExtensions)

///是否是手机号码，只判断符合11位数字
- (BOOL)isValidPhoneNumber;

///是否是三大运营商的手机号码
- (BOOL)isValidRealPhoneNumber;

///是否是邮箱地址
- (BOOL)isValidEmailAddress;

///是否是有效的ip 地址
- (BOOL)isValidIPAddress;

@end

NS_ASSUME_NONNULL_END
