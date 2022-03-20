//
//  QYGCDVC.m
//  QYMobileKit_Example
//
//  Created by Peter Wen on 2022/3/20.
//  Copyright © 2022 qingyu2010. All rights reserved.
//

#import "QYGCDVC.h"

@interface QYGCDVC ()

@end

@implementation QYGCDVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

///group执行一组同步任务
///对于dispatch_group_t，添加到组里的每一个任务必须是同步的才有效
- (IBAction)dispatchGroupExeSyncTask:(id)sender {
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t concurrent = QYCreateConcurrentQueue("concurrent");
    //组里每一个任务必须是同步的
    dispatch_group_async(group, concurrent, ^{
        [self syncTask];
        QYLog(@"[task1]%@",[NSThread currentThread]);
    });
    //组里每一个任务必须是同步的
    dispatch_group_async(group, concurrent, ^{
        [self syncTask];
        QYLog(@"[task2]%@",[NSThread currentThread]);
    });
    dispatch_group_notify(group, concurrent, ^{
        QYLog(@"[finish]%@",[NSThread currentThread]);
    });
}

///group执行一组异步任务
///semaphore可以解决几个异步任务完成后再执行next的功能
- (IBAction)semaphoreExeAsyncTask:(id)sender {
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    dispatch_queue_t concurrent = QYCreateConcurrentQueue("concurrent");
    //task1
    dispatch_async(concurrent, ^{
        QYLog(@"begin task1");
        sleep(2);
        QYLog(@"finish task1");
        dispatch_semaphore_signal(semaphore);
    });
    
    //task2
    dispatch_async(concurrent, ^{
        QYLog(@"begin task2");
        sleep(3);
        QYLog(@"finish task2");
        dispatch_semaphore_signal(semaphore);
    });
    //5秒超时后跳过
    dispatch_semaphore_wait(semaphore, QYCreateDispatchTime(5.0));
    //永久等待
    //dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    //5秒超时后跳过
    dispatch_semaphore_wait(semaphore, QYCreateDispatchTime(5.0));
    QYLog(@"all finish");
}

- (IBAction)testTask:(id)sender {
    
}

#pragma mark - Private
///同步任务
- (void)syncTask {
    int randomARC = QYRandomNumber(1, 3);
    QYLog(@"sleep: %d s",randomARC);
    sleep(randomARC);
}

@end
