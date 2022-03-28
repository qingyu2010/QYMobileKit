//
//  QYGCDVC.m
//  QYMobileKit_Example
//
//  Created by Peter Wen on 2022/3/20.
//  Copyright © 2022 qingyu2010. All rights reserved.
//

#import "QYThreadVC.h"

@interface QYThreadVC ()

@property(nonatomic, assign) BOOL isRunning;

@end

@implementation QYThreadVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isRunning = YES;
    // Do any additional setup after loading the view.
}

///异步常驻线程
+ (void)logThreadEntryPoint:(id)__unused object {
    @autoreleasepool {
        [[NSThread currentThread] setName:@"com.QY.ServiceThreadName"];
        
        NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
        [runLoop addPort:[NSMachPort port] forMode:NSDefaultRunLoopMode];
        [runLoop run];
    }
}

+ (NSThread *)logThread {
    static NSThread *_logThread = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _logThread = [[NSThread alloc] initWithTarget:self selector:@selector(logThreadEntryPoint:) object:nil];
        [_logThread start];
    });
    
    return _logThread;
}

#pragma mark - Test Case
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

///常驻线程执行任务
- (IBAction)runningThreadExtTask:(id)sender {
    [self performSelector:@selector(printThreadName) onThread:[[self class] logThread] withObject:nil waitUntilDone:NO];
}

#pragma mark - Private
///同步任务
- (void)syncTask {
    int randomARC = QYRandomNumber(1, 3);
    QYLog(@"sleep: %d s",randomARC);
    sleep(randomARC);
}

///打印线程名字
- (void)printThreadName {
    while (self.isRunning) {
        QYLog(@"[running thread]%@",[NSThread currentThread]);
        //500 ms
        usleep(500*1000);
    }
}

///看本对象是否释放
- (void)dealloc {
    QYLog(@"==== dealloc");
}
@end
