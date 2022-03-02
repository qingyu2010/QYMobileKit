//
//  QYFilePath.m
//  QYMobileKit_Example
//
//  Created by Peter Wen on 2022/2/19.
//  Copyright © 2022 qingyu2010. All rights reserved.
//

#import "QYPathUtilities.h"


NSString* QYHomeDirectory(void) {
    return NSHomeDirectory();
}

NSString* QYDocumentDirectory(void) {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
}

NSString* QYLibraryDirectory(void) {
    return [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject];
}

NSString* QYCachesDirectory(void) {
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
}

NSString* QYTemporaryDirectory(void) {
    return NSTemporaryDirectory();;
}

NSString* QYSubBundleDirectory(NSString *subBundle) {
    return [[NSBundle mainBundle] pathForResource:subBundle ofType:@"bundle"];
}

NSString* QYPathForMainBundleResource(NSString *name,NSString *ofType) {
    return [[NSBundle mainBundle] pathForResource:name ofType:ofType];
}

NSString* QYPathForSubBundleResource(NSString *subBundle,NSString *name,NSString *ofType) {
    NSString *subBundlePath = QYSubBundleDirectory(subBundle);
    NSString *fileName = [NSString stringWithFormat:@"%@.%@",name,ofType];
    return [subBundlePath stringByAppendingPathComponent:fileName];
}
