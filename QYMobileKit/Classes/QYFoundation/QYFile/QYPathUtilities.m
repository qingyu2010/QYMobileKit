//
//  QYFilePath.m
//  QYMobileKit_Example
//
//  Created by Peter Wen on 2022/2/19.
//  Copyright © 2022 qingyu2010. All rights reserved.
//

#import "QYPathUtilities.h"

///返回沙盒容器根目录
NSString* QYHomeDirectory(void) {
    return NSHomeDirectory();
}
///返回沙盒Documents目录
NSString* QYDocumentDirectory(void) {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
}
///返回沙盒Library目录
NSString* QYLibraryDirectory(void) {
    return [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject];
}
///返回沙盒Caches目录
NSString* QYCachesDirectory(void) {
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
}
///返回沙盒Temporary目录
NSString* QYTemporaryDirectory(void) {
    return NSTemporaryDirectory();;
}
///.app的资源为mainBundle,app下层级的资源为子Bundle，获取子Bundle的路径
/// - parameter: subBundle子Bundle名称
NSString* QYSubBundleDirectory(NSString *subBundle) {
    return [[NSBundle mainBundle] pathForResource:subBundle ofType:@"bundle"];
}
///app的资源文件路径
/// - parameter: name 文件名称
/// - parameter: ofType 文件类型
NSString* QYPathForMainBundleResource(NSString *name,NSString *ofType) {
    return [[NSBundle mainBundle] pathForResource:name ofType:ofType];
}
///子Bundle的资源文件路径*
/// - parameter: subBundle子bundle
/// - parameter: name文件名称
/// - parameter: ofType文件类型
NSString* QYPathForSubBundleResource(NSString *subBundle,NSString *name,NSString *ofType) {
    NSString *subBundlePath = QYSubBundleDirectory(subBundle);
    NSString *fileName = [NSString stringWithFormat:@"%@.%@",name,ofType];
    return [subBundlePath stringByAppendingPathComponent:fileName];
}
