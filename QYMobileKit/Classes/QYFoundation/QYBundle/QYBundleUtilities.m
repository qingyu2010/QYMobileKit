//
//  QYBundleUtilities.m
//  QYMobileKit
//
//  Created by Peter Wen on 2022/3/17.
//

#import "QYBundleUtilities.h"

@implementation NSBundle (QYNSBundleInfoDictionaryExtensions)

+ (NSString *)displayNameForQY {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
}
+ (NSString *)shortVersionStringForQY {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}
+ (NSString *)versionForQY {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
}
+ (NSString *)identifierForQY {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
}
@end
