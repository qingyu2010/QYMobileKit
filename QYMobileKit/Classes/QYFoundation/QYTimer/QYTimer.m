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
/// 工厂方法创建定时器对象，不需要考虑子线程问题，不需要手动开启，默认创建对象后马上开启定时器。
/// - parameter:  interval 定时器间隔
/// - parameter: repeats 是否循环执行
/// - parameter: block 定时器执行的任务，在子线程执行
+ (QYTimer *)timerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(QYTimer *timer))block {
    QYTimer *timer = [[QYTimer alloc] initWithQueue:nil delay:0 timeInterval:interval repeats:repeats block:block];
    return timer;
}
/// 工厂方法创建定时器对象，不需要考虑子线程问题，不需要手动开启。
/// - parameter:  interval 定时器间隔
/// - parameter: repeats 是否循环执行
/// - parameter: queue 定时器执行的队列，默认是全局的队列
/// - parameter: afterDelay 定时器在创建对象后多久启动单位秒
/// - parameter: block 定时器执行的任务
+ (QYTimer *)timerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats queue:(nullable dispatch_queue_t)queue afterDelay:(NSTimeInterval)delay block:(void (^)(QYTimer *timer))block {
    QYTimer *timer = [[QYTimer alloc] initWithQueue:queue delay:delay timeInterval:interval repeats:repeats block:block];
    return timer;
}
/// 暂停定时器
- (void)suspend {
    if (self.opCount == 1 && self.gcdTimer) {
        dispatch_suspend(self.gcdTimer);
        self.opCount = 0;
    }
}
/// 从暂停到重新开启定时器，只有暂停了定时器，才需要调用此方法，否则不需要调用此方法
- (void)resume {
    if (self.opCount == 0 && self.gcdTimer) {
        dispatch_resume(self.gcdTimer);
        self.opCount = 1;
    }
}
/// 定时器作废,调用了此方法后，无法再使用其他方法，需要从新创建Timer对象
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
