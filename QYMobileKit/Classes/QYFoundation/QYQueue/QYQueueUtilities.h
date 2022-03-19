//
//  QYQueueUtilities.h
//  Pods
//
//  Created by Peter Wen on 2022/3/19.
//

#ifndef QYQueueUtilities_h
#define QYQueueUtilities_h

///获取主队列（UI串行队列）
FOUNDATION_EXPORT dispatch_queue_t _Nullable QYGetMainQueue(void);

///获取全局并发队列
FOUNDATION_EXPORT dispatch_queue_t _Nullable QYGetGlobalQueue(void);

///创建串行队列
/// - parameter: queueName 队列名称，可为NULL
FOUNDATION_EXPORT dispatch_queue_t _Nullable QYCreateSerialQueue(const char *_Nullable queueName);

///创建并行队列
/// - parameter: queueName 队列名称，可为NULL
FOUNDATION_EXPORT dispatch_queue_t _Nonnull QYCreateConcurrentQueue(const char *_Nullable queueName);

#endif /* QYQueueUtilities_h */
