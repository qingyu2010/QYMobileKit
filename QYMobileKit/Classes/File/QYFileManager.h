//
//  QYFileManager.h
//  QYMobileKit
//
//  Created by Peter Wen on 2022/2/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QYFileManager : NSObject

@property (class, readonly, strong) QYFileManager *defaultManager;

/**创建目录，如果已经存在则不需要创建直接返回YES*/
- (BOOL)createDirectoryAtPath:(NSString *)path;

/**创建文件，如果data传nil，则创建空的文件*/
- (BOOL)createFileAtPath:(NSString *)path contents:(nullable NSData *)data;

/**写文件，如果路径不存在，会自动创建目录，如果文件不存在，会自动创建文件，然后再写文件（覆盖旧文件）*/
- (BOOL)writeToFile:(NSString *)path contents:(NSData *)data;

/**追加写文件，如果路径不存在，会自动创建目录，如果文件不存在，会自动创建文件，然后再写文件（不会覆盖旧文件）*/
- (BOOL)appendData:(NSData *)data withPath:(NSString *)path;

/**读文件返回NSData*/
- (NSData *)readDataOfFileAtPath:(NSString *)path;

/**返回目录下的所有文件路径（不递归）*/
- (nullable NSArray<NSString *> *)contentsOfDirectoryAtPath:(NSString *)path;

/**返回目录下的所有文件路径（递归所有子目录的文件）*/
- (nullable NSArray<NSString *> *)subpathsOfDirectoryAtPath:(NSString *)path;

/**删除单个文件*/
- (BOOL)removeItemAtPath:(NSString *)path;
@end

NS_ASSUME_NONNULL_END
