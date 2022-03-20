//
//  QYKeyChainUtilities.h
//  QYMobileKit
//
//  Created by Peter Wen on 2022/3/3.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

///存储数据到钥匙串
/// - parameter:  data 需要存储的数据
/// - parameter:  service 保存数据对应的key
FOUNDATION_EXPORT void QYAddItemToKeychainWithData(id data,NSString *service);

///从钥匙串获取数据
/// - parameter:  service 保存数据对应的key
FOUNDATION_EXPORT id QYGetItemFromKeychainByService(NSString * service);

///从钥匙串删除数据
/// - parameter:  service 保存数据对应的key
FOUNDATION_EXPORT void QYDeleteItemFromKeychainByService(NSString *service);

NS_ASSUME_NONNULL_END
