//
//  QYQueueUtilities.m
//  QYMobileKit
//
//  Created by Peter Wen on 2022/3/19.
//

#import <Foundation/Foundation.h>
#import "QYQueueUtilities.h"
///获取主队列（UI串行队列）
dispatch_queue_t QYGetMainQueue(void) {
    return dispatch_get_main_queue();
}
///获取全局并发队列
dispatch_queue_t QYGetGlobalQueue(void) {
    return dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
}
///创建串行队列
dispatch_queue_t QYCreateSerialQueue(const char *_Nullable queueName) {
    return dispatch_queue_create(queueName, DISPATCH_QUEUE_SERIAL);
}
///创建并行队列
dispatch_queue_t QYCreateConcurrentQueue(const char *_Nullable queueName) {
    return dispatch_queue_create(queueName, DISPATCH_QUEUE_CONCURRENT);
}
