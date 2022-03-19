//
//  QYQueueUtilities.m
//  QYMobileKit
//
//  Created by Peter Wen on 2022/3/19.
//

#import <Foundation/Foundation.h>
#import "QYQueueUtilities.h"

dispatch_queue_t QYGetMainQueue(void) {
    return dispatch_get_main_queue();
}

dispatch_queue_t QYGetGlobalQueue(void) {
    return dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
}

dispatch_queue_t QYCreateSerialQueue(const char *_Nullable queueName) {
    return dispatch_queue_create(queueName, DISPATCH_QUEUE_SERIAL);
}

dispatch_queue_t QYCreateConcurrentQueue(const char *_Nullable queueName) {
    return dispatch_queue_create(queueName, DISPATCH_QUEUE_CONCURRENT);
}
