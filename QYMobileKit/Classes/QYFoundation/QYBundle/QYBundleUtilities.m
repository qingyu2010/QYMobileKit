//
//  QYBundleUtilities.m
//  QYMobileKit
//
//  Created by Peter Wen on 2022/3/17.
//

#import "QYBundleUtilities.h"

@implementation NSBundle (QYBundleInfoDictionaryExtensions)
/// app名称
- (NSString *)displayNameForQY {
    return [[self infoDictionary] objectForKey:@"CFBundleDisplayName"];
}
///app版本
- (NSString *)shortVersionStringForQY {
    return [[self infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}
///app build版本
- (NSString *)versionForQY {
    return [[self infoDictionary] objectForKey:@"CFBundleVersion"];
}
///Bundle Identifier (app id)
- (NSString *)identifierForQY {
    return [[self infoDictionary] objectForKey:@"CFBundleIdentifier"];
}
@end
