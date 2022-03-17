//
//  QYBundleUtilities.h
//  QYMobileKit
//
//  Created by Peter Wen on 2022/3/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSBundle (NSBundleInfoDictionaryExtensions)

/// app名称
@property (readonly, copy) NSString *displayNameForQY;
///app版本
@property (readonly, copy) NSString *shortVersionStringForQY;
///app build版本
@property (readonly, copy) NSString *versionForQY;
///Bundle Identifier (app id)
@property (readonly, copy) NSString *identifierForQY;

@end

NS_ASSUME_NONNULL_END
