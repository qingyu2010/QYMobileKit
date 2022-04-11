//
//  QYStringUtilities.m
//  QYMobileKit
//
//  Created by Peter Wen on 2022/4/11.
//

#import "QYStringUtilities.h"
#import "QYDataUtilities.h"


@implementation NSString (NSString)

///aes256算法加密NSString
/// - parameter: key 密钥
- (NSString *)aes256EncodedStringWithKey:(NSString *)key {
    const char *cstr = [self cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:self.length];
    //对数据进行加密
    NSData *result = [data aes256EncodedDataWithKey:key];
    
    //转换为二进制字符串
    if (result && result.length > 0) {
        
        Byte *datas = (Byte*)[result bytes];
        NSMutableString *output = [NSMutableString stringWithCapacity:result.length * 2];
        for(int i = 0; i < result.length; i++){
            [output appendFormat:@"%02x", datas[i]];
        }
        return output;
    }
    return nil;
}
///aes256算法解密NSString
/// - parameter: key 密钥
- (NSString *)aes256DecodedStringWithKey:(NSString *)key {
    //转换为二进制Data
    NSMutableData *data = [NSMutableData dataWithCapacity:self.length / 2];
    unsigned char whole_byte;
    char byte_chars[3] = {'\0','\0','\0'};
    int i;
    for (i=0; i < [self length] / 2; i++) {
        byte_chars[0] = [self characterAtIndex:i*2];
        byte_chars[1] = [self characterAtIndex:i*2+1];
        whole_byte = strtol(byte_chars, NULL, 16);
        [data appendBytes:&whole_byte length:1];
    }
    
    //对数据进行解密
    NSData* result = [data aes256DecodedDataWithKey:key];
    if (result && result.length > 0) {
        
        return [[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding];
    }
    return nil;
}
@end

@implementation NSString (QYStringRegexValidateExtensions)

#pragma mark - Private
- (BOOL)isValidateByRegex:(NSString *)regex {
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [pre evaluateWithObject:self];
}

#pragma mark - Public
///是否是手机号码，只判断符合11位数字
- (BOOL)isValidPhoneNumber {
    NSString *regex = @"^[0-9]{11}";
    return [self isValidateByRegex:regex];
}

///是否是三大运营商的手机号码
- (BOOL)isValidRealPhoneNumber {
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188,1705
     * 联通：130,131,132,152,155,156,185,186,1709
     * 电信：133,1349,153,180,189,1700
     */
    /**
     * 中国移动：China Mobile
     * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188，1705
     */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\\\d|705)\\\\d{7}$";
    /**
     * 中国联通：China Unicom
     * 130,131,132,152,155,156,185,186,1709
     */
    NSString * CU = @"^1((3[0-2]|5[256]|8[56])\\\\d|709)\\\\d{7}$";
    /**
     * 中国电信：China Telecom
     * 133,1349,153,180,189,1700
     */
    NSString * CT = @"^1((33|53|8[09])\\\\d|349|700)\\\\d{7}$";
    /**
     * 大陆地区固话及小灵通
     * 区号：010,020,021,022,023,024,025,027,028,029
     * 号码：七位或八位
     */
    NSString * PHS = @"^0(10|2[0-5789]|\\\\d{3})\\\\d{7,8}$";
    
    if (([self isValidateByRegex:CM])
        || ([self isValidateByRegex:CU])
        || ([self isValidateByRegex:CT])
        || ([self isValidateByRegex:PHS])) {
        return YES;
    }else {
        return NO;
    }
}
///是否是邮箱地址
- (BOOL)isValidEmailAddress {
    NSString *emailRegex = @"[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\\\.[A-Za-z]{2,4}";
    return [self isValidateByRegex:emailRegex];
}
///是否是有效的ip 地址
- (BOOL)isValidIPAddress {
   
   NSString *urlRegEx =@"^([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\."
                       "([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\."
                       "([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\."
                       "([01]?\\d\\d?|2[0-4]\\d|25[0-5])$";
   
   return [self isValidateByRegex:urlRegEx];
}

@end
