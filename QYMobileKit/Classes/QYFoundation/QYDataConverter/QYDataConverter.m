//
//  QYDataConverter.m
//  Pods
//
//  Created by Peter Wen on 2022/3/28.
//

#import "QYDataConverter.h"
#import "QYLogUtilities.h"

@implementation QYDataConverter

+ (NSData *)dataWithString:(NSString *)string {
    return [string dataUsingEncoding:NSUTF8StringEncoding];
}

+ (NSString *)stringWithData:(NSData *)data {
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}


+ (NSString *)jsonStringWithDictionary:(NSDictionary *)dic {
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    if (parseError) {
        QYLog(@"DictionaryToJsonString fail! %@",[parseError description]);
        return nil;
    }
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *parseError = nil;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&parseError];
    if (parseError) {
        QYLog(@"JsonStringToDictionary fail! %@",[parseError description]);
        return nil;
    }
    return dic;
}

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
