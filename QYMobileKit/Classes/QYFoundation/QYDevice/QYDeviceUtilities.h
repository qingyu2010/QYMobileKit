//
//  QYDeviceUtilities.h
//  QYMobileKit
//
//  Created by Peter Wen on 2022/3/3.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (QYDeviceIdentifierExtensions)

///设备的唯一标识符（没有分割符的字符串）
@property (readonly, copy) NSString *identifierForQY;
///设备的唯一标识符（有分割符）
@property (readonly, copy) NSString *identifierWithSeparatorForQY;


@end



NS_ASSUME_NONNULL_END
