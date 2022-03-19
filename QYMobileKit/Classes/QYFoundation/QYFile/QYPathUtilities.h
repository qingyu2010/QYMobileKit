//
//  QYFilePath.h
//  QYMobileKit_Example
//
//  Created by Peter Wen on 2022/2/19.
//  Copyright © 2022 qingyu2010. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


///返回沙盒容器根目录
FOUNDATION_EXPORT NSString* QYHomeDirectory(void);

///返回沙盒Documents目录
FOUNDATION_EXPORT NSString* QYDocumentDirectory(void);

///返回沙盒Library目录
FOUNDATION_EXPORT NSString* QYLibraryDirectory(void);

///返回沙盒Caches目录
FOUNDATION_EXPORT NSString* QYCachesDirectory(void);

///返回沙盒Temporary目录
FOUNDATION_EXPORT NSString* QYTemporaryDirectory(void);

///.app的资源为mainBundle,app下层级的资源为子Bundle，获取子Bundle的路径
/// - parameter: subBundle子Bundle名称
FOUNDATION_EXPORT NSString* QYSubBundleDirectory(NSString *subBundle);

///app的资源文件路径
/// - parameter: name 文件名称
/// - parameter: ofType 文件类型
FOUNDATION_EXPORT NSString* QYPathForMainBundleResource(NSString *name,NSString *ofType);

///子Bundle的资源文件路径*
/// - parameter: subBundle子bundle
/// - parameter: name文件名称
/// - parameter: ofType文件类型
FOUNDATION_EXPORT NSString* QYPathForSubBundleResource(NSString *subBundle,NSString *name,NSString *ofType);

NS_ASSUME_NONNULL_END
