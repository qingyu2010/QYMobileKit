//
//  QYTimerVC.m
//  QYMobileKit_Example
//
//  Created by Peter Wen on 2022/2/19.
//  Copyright © 2022 qingyu2010. All rights reserved.
//

#import "QYTimerVC.h"
#import <QYMobileKit/QYTimer.h>

@interface QYTimerVC ()

@property (nonatomic, strong) NSTimer *sysTimer;
@property (nonatomic, strong) QYTimer *qyTimer;
@end

@implementation QYTimerVC


- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)startNSTimer:(id)sender {
    NSLog(@"begin Timer");
    self.sysTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
        NSLog(@"%@",[NSThread currentThread]);
    }];
}

- (IBAction)startQYTimer:(id)sender {
    NSLog(@"begin Timer");
    self.qyTimer = [QYTimer timerWithTimeInterval:1.0 repeats:YES block:^(QYTimer * _Nonnull timer) {
        NSLog(@"%@",[NSThread currentThread]);
    }];
}
- (IBAction)blockUI:(id)sender {
    while (1) {
        
    }
}

- (void)dealloc {
    if (self.sysTimer) {
        [self.sysTimer invalidate];
    }
    if (self.qyTimer) {
        [self.qyTimer invalidate];
    }
    NSLog(@"==== dealloc");
}
@end
