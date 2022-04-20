//
//  QYDataConverter.m
//  Pods
//
//  Created by Peter Wen on 2022/3/28.
//

#import "QYDataConverter.h"
#import "QYLogUtilities.h"

@implementation QYDataConverter

///NSString转NSData
/// - parameter: string 输入的字符串
+ (NSData *)dataWithString:(NSString *)string {
    return [string dataUsingEncoding:NSUTF8StringEncoding];
}
///NSData转NSString
/// - parameter: data 输入的data
+ (NSString *)stringWithData:(NSData *)data {
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

///Json obj(NSDictonary or NSArray)转NSData
/// - parameter: dic 输入的Json obj(NSDictonary or NSArray)
+ (nullable NSData *)dataWithJSONObject:(id)obj {
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:obj options:NSJSONWritingPrettyPrinted error:&parseError];
    if (parseError) {
        QYLog(@"DictionaryToJsonString fail! %@",[parseError description]);
        return nil;
    }
    return jsonData;
}
///Json obj(NSDictonary or NSArray)转Json NSString
/// - parameter: dic 输入的Json obj(NSDictonary or NSArray)
+ (NSString *)jsonStringWithJSONObject:(id)obj {
    if (obj == nil) {
        return nil;
    }
    
    NSData *jsonData = [QYDataConverter dataWithJSONObject:obj];
    if (!jsonData) {
        QYLog(@"jsonStringWithJSONObject fail! ");
        return nil;
    }
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

///NSData转Json obj(NSDictonary or NSArray)
/// - parameter: jsonString 输入的json格式NSData
+ (nullable id)jsonObjectWithData:(NSData *)data {
    NSError *parseError = nil;
    id obj = nil;
    obj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&parseError];
    if (parseError) {
        QYLog(@"JSONObjectWithData fail! %@",[parseError description]);
        return nil;
    }
    return obj;
}
///jsonString转Json obj(NSDictonary or NSArray)
/// - parameter: jsonString 输入的json格式字符串
+ (nullable id)jsonObjectWithString:(NSString *)jsonString {
    id obj = nil;
    if (jsonString.length > 0) {
        NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
        obj = [QYDataConverter jsonObjectWithData:jsonData];
    }
    return obj;
}
///data转十六进制字符串
/// - parameter: data 输入的data
+ (NSString *)hexStringWithData:(NSData *)data {
    NSUInteger i, len;
    unsigned char *buf, *bytes;
    
    len = data.length;
    bytes = (unsigned char*)data.bytes;
    buf = malloc(len*2);
    
    for (i=0; i<len; i++) {
        buf[i*2] = itoh((bytes[i] >> 4) & 0xF);
        buf[i*2+1] = itoh(bytes[i] & 0xF);
    }
    
    return [[NSString alloc] initWithBytesNoCopy:buf
                                          length:len*2
                                        encoding:NSASCIIStringEncoding
                                    freeWhenDone:YES];
}
///HexString转NSData
/// - parameter: hexString 输入的字符串
+ (NSData *)dataWithHexString:(NSString *)hexString {
    NSMutableData *result = [[NSMutableData alloc] init];
    int i = 0;
    for (i = 0; i+2 <= hexString.length; i+=2) {
        NSRange range = NSMakeRange(i, 2);
        NSString* hexStr = [hexString substringWithRange:range];
        NSScanner* scanner = [NSScanner scannerWithString:hexStr];
        unsigned int intValue;
        [scanner scanHexInt:&intValue];
        unsigned char uc = (unsigned char) intValue;
        [result appendBytes:&uc length:1];
    }
    NSData * data = [NSData dataWithData:result];
    return data;
}
#pragma mark - Private
static inline char itoh(int i) {
    if (i > 9) return 'A' + (i - 10);
    return '0' + i;
}


@end
