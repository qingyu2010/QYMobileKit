//
//  QYFileManager.m
//  QYMobileKit
//
//  Created by Peter Wen on 2022/2/20.
//

#import "QYFileManager.h"



@implementation QYFileManager

+ (QYFileManager *)defaultManager {
    static QYFileManager *fileManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        fileManager = [[QYFileManager alloc] init];
    });
    return fileManager;
}

- (BOOL)createDirectoryAtPath:(NSString *)path {
    if (path.length == 0) {
        return NO;
    }
    BOOL isSuccess = YES;
    BOOL isExist = [[NSFileManager defaultManager] fileExistsAtPath:path];
    if (isExist == NO) {
        NSError *error;
        if (![[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error]) {
            isSuccess = NO;
            NSLog(@"creat Directory Failed:%@",[error localizedDescription]);
        }
    }
    return isSuccess;
}

- (BOOL)createFileAtPath:(NSString *)path contents:(nullable NSData *)data {
    if (path.length == 0) {
        return NO;
    }
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:path]) {
        return YES;
    }
    NSError *error;
    NSString *dirPath = [path stringByDeletingLastPathComponent];
    BOOL isSuccess = [fileManager createDirectoryAtPath:dirPath withIntermediateDirectories:YES attributes:nil error:&error];
    if (!isSuccess) {
        NSLog(@"creat File Failed:%@",[error localizedDescription]);
        return NO;
    }
    isSuccess = [fileManager createFileAtPath:path contents:data attributes:nil];
    return isSuccess;
}

- (BOOL)writeToFile:(NSString *)path contents:(NSData *)data {
    if (path.length == 0) {
        return NO;
    }
    if (data.length == 0) {
        return NO;
    }
    BOOL result = [self createFileAtPath:path contents:nil];
    if (result) {
        if ([data writeToFile:path atomically:YES]) {
            NSLog(@"write Success");
        } else{
            NSLog(@"write Failed");
        }
    }
    else {
        NSLog(@"write Failed");
    }
    return result;
}

- (BOOL)appendData:(NSData *)data withPath:(NSString *)path {
    if (path.length == 0) {
        return NO;
    }
    BOOL result = [self createFileAtPath:path contents:nil];
    if (result) {
        NSFileHandle *handle = [NSFileHandle fileHandleForWritingAtPath:path];
        [handle seekToEndOfFile];
        [handle writeData:data];
        [handle synchronizeFile];
        [handle closeFile];
    }
    else {
        NSLog(@"appendData Failed");
    }
    return result;
}

- (NSData *)readDataOfFileAtPath:(NSString *)path {
    NSFileHandle *handle = [NSFileHandle fileHandleForReadingAtPath:path];
    NSData *fileData = [handle readDataToEndOfFile];
    [handle closeFile];
    return fileData;
}

- (nullable NSArray<NSString *> *)contentsOfDirectoryAtPath:(NSString *)path {
    if (path.length == 0) {
        return nil;
    }
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *fileList = [fileManager contentsOfDirectoryAtPath:path error:&error];
    if (error) {
        NSLog(@"getFileList Failed:%@",[error localizedDescription]);
    }
    return fileList;
}

- (nullable NSArray<NSString *> *)subpathsOfDirectoryAtPath:(NSString *)path {
    if (path.length == 0) {
        return nil;
    }
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *fileList = [fileManager subpathsOfDirectoryAtPath:path error:&error];
    if (error) {
        NSLog(@"getFileList Failed:%@",[error localizedDescription]);
    }
    return fileList;
}

- (BOOL)removeItemAtPath:(NSString *)path {
    BOOL isSuccess = NO;
    NSError *error;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    isSuccess = [fileManager removeItemAtPath:path error:&error];
    if (error) {
        NSLog(@"removeFile Field：%@",[error localizedDescription]);
    }else{
        NSLog(@"removeFile Success");
    }
    return isSuccess;
}

@end
