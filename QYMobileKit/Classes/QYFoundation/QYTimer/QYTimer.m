//
//  QYTimer.m
//  QYMobileKit_Example
//
//  Created by Peter Wen on 2022/3/2.
//  Copyright © 2022 qingyu2010. All rights reserved.
//

#import "QYTimer.h"
#import "QYTimeUtilities.h"

@interface QYTimer ()

@property (nonatomic, strong) dispatch_source_t gcdTimer;
@property (nonatomic, assign) NSInteger opCount;
@end

@implementation QYTimer

#pragma mark - Private
- (instancetype)initWithQueue:(nullable dispatch_queue_t)queue delay:(double) delayTime timeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(QYTimer *timer))block{
    self = [super init];
    if (self) {
        self.gcdTimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
        dispatch_time_t startTime = QYCreateDispatchTime(delayTime);
            uint64_t timeInterval = QYSecondToNanoseconds(interval);
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
        self.opCount = 1;
    }
    return self;
}

#pragma mark - Public
+ (QYTimer *)timerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(QYTimer *timer))block {
    QYTimer *timer = [[QYTimer alloc] initWithQueue:nil delay:0 timeInterval:interval repeats:repeats block:block];
    return timer;
}
+ (QYTimer *)timerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats queue:(nullable dispatch_queue_t)queue afterDelay:(NSTimeInterval)delay block:(void (^)(QYTimer *timer))block {
    QYTimer *timer = [[QYTimer alloc] initWithQueue:queue delay:delay timeInterval:interval repeats:repeats block:block];
    return timer;
}

- (void)suspend {
    if (self.opCount == 1 && self.gcdTimer) {
        dispatch_suspend(self.gcdTimer);
        self.opCount = 0;
    }
}
- (void)resume {
    if (self.opCount == 0 && self.gcdTimer) {
        dispatch_resume(self.gcdTimer);
        self.opCount = 1;
    }
}
- (void)invalidate {
    if (self.opCount > 0) {
        dispatch_cancel(self.gcdTimer
                        );
        self.opCount = 0;
    } else {
        dispatch_resume(self.gcdTimer);
        dispatch_cancel(self.gcdTimer
                        );
        self.opCount = 0;
    }
    self.gcdTimer = nil;
}

@end
