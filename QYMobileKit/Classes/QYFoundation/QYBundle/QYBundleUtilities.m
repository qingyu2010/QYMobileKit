//
//  QYBundleUtilities.m
//  QYMobileKit
//
//  Created by Peter Wen on 2022/3/17.
//

#import "QYBundleUtilities.h"

@implementation NSBundle (QYBundleInfoDictionaryExtensions)

- (NSString *)displayNameForQY {
    return [[self infoDictionary] objectForKey:@"CFBundleDisplayName"];
}
- (NSString *)shortVersionStringForQY {
    return [[self infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}
- (NSString *)versionForQY {
    return [[self infoDictionary] objectForKey:@"CFBundleVersion"];
}
- (NSString *)identifierForQY {
    return [[self infoDictionary] objectForKey:@"CFBundleIdentifier"];
}
@end
