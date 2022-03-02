//
//  QYTimer.m
//  QYMobileKit_Example
//
//  Created by Peter Wen on 2022/3/2.
//  Copyright © 2022 qingyu2010. All rights reserved.
//

#import "QYTimer.h"

@interface QYTimer ()

@property (nonatomic, strong) dispatch_source_t gcdTimer;

@end

@implementation QYTimer

- (instancetype)initWithQueue:(nullable dispatch_queue_t)queue delay:(double) delayTime timeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(QYTimer *timer))block{
    self = [super init];
    if (self) {
        self.gcdTimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
        dispatch_time_t startTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayTime*NSEC_PER_SEC));
            uint64_t timeInterval = (uint64_t)(interval*NSEC_PER_SEC);
        dispatch_source_set_timer(self.gcdTimer, startTime, timeInterval, 0);
        __weak typeof(self) weakSelf = self;
        dispatch_source_set_event_handler(self.gcdTimer, ^{
            if (block) {
                block(weakSelf);
            }
            if (!repeats) {
                dispatch_cancel(weakSelf.gcdTimer);
                weakSelf.gcdTimer = nil;
            }
        });
        dispatch_resume(self.gcdTimer);
    }
    return self;
}
+ (QYTimer *)timerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(QYTimer *timer))block {
    QYTimer *timer = [[QYTimer alloc] initWithQueue:nil delay:0 timeInterval:interval repeats:repeats block:block];
    return timer;
}
+ (QYTimer *)timerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats queue:(nullable dispatch_queue_t)queue delay:(double)delayTime block:(void (^)(QYTimer *timer))block {
    QYTimer *timer = [[QYTimer alloc] initWithQueue:queue delay:delayTime timeInterval:interval repeats:repeats block:block];
    return timer;
}
- (void)invalidate {
    dispatch_cancel(self.gcdTimer
                    );
    self.gcdTimer = nil;
}

@end
