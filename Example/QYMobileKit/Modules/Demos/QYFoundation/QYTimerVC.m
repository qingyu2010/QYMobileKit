//
//  QYTimerVC.m
//  QYMobileKit_Example
//
//  Created by Peter Wen on 2022/2/19.
//  Copyright © 2022 qingyu2010. All rights reserved.
//

#import "QYTimerVC.h"

///对比测试系统的定时器和自定义定时器
@interface QYTimerVC ()
///系统定时器
@property (nonatomic, strong) NSTimer *sysTimer;
///自定义定时器
@property (nonatomic, strong) QYTimer *qyTimer;
@end

@implementation QYTimerVC


- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - system timer
- (IBAction)startNSTimer:(id)sender {
    QYLog(@"begin Timer");
    //block方式的NSTimer不会导致强引用self
    self.sysTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
        QYLog(@"%@",[NSThread currentThread]);
    }];
}

/// 死循环模拟卡住UI，测试是否影响主线程开辟的定时器
- (IBAction)blockUI:(id)sender {
    while (1) {
    }
}

#pragma mark - QYTimer
- (IBAction)startQYTimer:(id)sender {
    QYLog(@"begin Timer");
    self.qyTimer = [QYTimer timerWithTimeInterval:1.0 repeats:YES block:^(QYTimer * _Nonnull timer) {
        QYLog(@"%@",[NSThread currentThread]);
    }];
}

///暂停定时器
- (IBAction)QYSuspend:(id)sender {
    [self.qyTimer suspend];
}

///重新启动定时器
- (IBAction)QYResume:(id)sender {
    [self.qyTimer resume];
}

///看本对象是否释放
- (void)dealloc {
    if (self.sysTimer) {
        [self.sysTimer invalidate];
    }
    if (self.qyTimer) {
        [self.qyTimer invalidate];
    }
    QYLog(@"==== dealloc");
}
@end
