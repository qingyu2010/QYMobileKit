//
//  QYDeviceUtilities.m
//  QYMobileKit
//
//  Created by Peter Wen on 2022/3/3.
//

#import "QYDeviceUtilities.h"
#import "QYKeyChainUtilities.h"


static NSString * identifierStringKey = @"com.QY.UUID";

@implementation UIDevice (UIDeviceIdentifierExtensions)

- (NSString *)identifierForQY {
    NSString *orgIdentifier = self.identifierWithSeparatorForQY;
    NSString *uuidString = [orgIdentifier stringByReplacingOccurrencesOfString:@"-" withString:@""];
    return uuidString;
}

- (NSString *)identifierWithSeparatorForQY {
    NSString *uuid = (NSString *)QYGetItemFromKeychainByService(identifierStringKey);
    if (!uuid || uuid.length == 0) {
        uuid = [[NSUUID UUID] UUIDString];
        QYAddItemToKeychainWithData(uuid, identifierStringKey);
    }
    return uuid;
}
@end

