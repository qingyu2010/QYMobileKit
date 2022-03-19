//
//  QYFileManagerVC.m
//  QYMobileKit_Example
//
//  Created by Peter Wen on 2022/2/19.
//  Copyright © 2022 qingyu2010. All rights reserved.
//

#import "QYFileManagerVC.h"
#import <QYMobileKit/QYFoundation.h>

@interface QYFileManagerVC ()

@end

@implementation QYFileManagerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    

    NSLog(@"begin task");
    dispatch_queue_t queue = QYCreateConcurrentQueue("test");
    dispatch_async(queue, ^{
        
        sleep(2);
        NSLog(@"---%@",[NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        
        sleep(2);
        NSLog(@"---%@",[NSThread currentThread]);
    });
    NSLog(@"end task");
}





@end
