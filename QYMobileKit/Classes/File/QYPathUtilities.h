//
//  QYFilePath.h
//  QYMobileKit_Example
//
//  Created by Peter Wen on 2022/2/19.
//  Copyright © 2022 qingyu2010. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


/**返回沙盒容器根目录*/
NSString* QYHomeDirectory(void);

/**返回沙盒Documents目录*/
NSString* QYDocumentDirectory(void);

/**返回沙盒Library目录*/
NSString* QYLibraryDirectory(void);

/**返回沙盒Caches目录*/
NSString* QYCachesDirectory(void);

/**返回沙盒Temporary目录*/
NSString* QYTemporaryDirectory(void);

/**.app的资源为mainBundle,app下层级的资源为子Bundle，获取子Bundle的路径*/
NSString* QYSubBundleDirectory(NSString *subBundle);

/**app的资源文件路径*/
NSString* QYPathForMainBundleResource(NSString *name,NSString *ofType);

/**子Bundle的资源文件路径*/
NSString* QYPathForSubBundleResource(NSString *subBundle,NSString *name,NSString *ofType);

NS_ASSUME_NONNULL_END
