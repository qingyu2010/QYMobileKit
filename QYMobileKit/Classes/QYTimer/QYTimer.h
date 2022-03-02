//
//  QYTimer.h
//  QYMobileKit_Example
//
//  Created by Peter Wen on 2022/3/2.
//  Copyright © 2022 qingyu2010. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/*系统NSTimer存在以下缺陷
 在主线程开辟的定时器容易受UI影响导致丢失部分定时任务；
 在子线程开辟的定时器虽然不受UI影响，但是需要开启子线程的runloop，比较麻烦；
 固基于GCD的timer封装使用方便的定时器
 */
@interface QYTimer : NSObject

/// 工厂方法创建定时器对象，不需要考虑子线程问题，不需要手动开启，默认创建对象后马上开启定时器。
/// - parameter:  interval 定时器间隔
/// - parameter: repeats 是否循环执行
/// - parameter: block 定时器执行的任务，在子线程执行
+ (QYTimer *)timerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(QYTimer *timer))block;

/// 工厂方法创建定时器对象，不需要考虑子线程问题，不需要手动开启。
/// - parameter:  interval 定时器间隔
/// - parameter: repeats 是否循环执行
/// - parameter: queue 定时器执行的队列，默认是全局的队列
/// - parameter: delayTime 定时器在创建对象后多久启动单位秒
/// - parameter: block 定时器执行的任务
+ (QYTimer *)timerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats queue:(nullable dispatch_queue_t)queue delay:(double)delayTime block:(void (^)(QYTimer *timer))block;
/// 定时器作废
- (void)invalidate;

@end

NS_ASSUME_NONNULL_END
