//
//  QYURLRequestManager.m
//  QYMobileKit
//
//  Created by Peter Wen on 2022/3/29.
//

#import "QYURLRequestManager.h"
#import <AFNetworking/AFNetworking.h>

@implementation QYURLRequestManager

+ (QYURLRequestManager *)defaultManager {
    static QYURLRequestManager *httpManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        httpManager = [[QYURLRequestManager alloc] init];
    });
    return httpManager;
}

- (void)postRequestWithURLString:(NSString *)URLString  httpBody:(NSData *)httpBody completionHandler:(nullable void (^)(NSURLResponse *response, id _Nullable responseObject,  NSError * _Nullable error))completionHandle {
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:URLString]];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    // 设置body
    [request setHTTPBody:httpBody];
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    AFHTTPResponseSerializer *responseSerializer = [AFHTTPResponseSerializer serializer];
    responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",
                                                 @"text/html",
                                                 @"text/json",
                                                 @"text/javascript",
                                                 @"text/plain",
                                                 nil];
    manager.responseSerializer = responseSerializer;
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.requestSerializer.timeoutInterval = 30;
    //开始网络请求
    [[manager dataTaskWithRequest:request uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (completionHandle) {
            completionHandle(response,responseObject,error);
        }
     }] resume];
}

@end
