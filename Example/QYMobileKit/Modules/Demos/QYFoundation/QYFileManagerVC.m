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
    
    
     NSString *  str1 = @"str1";
    QYLog(@"%@",str1);
    QYLogConfig(NO);
    str1 = @"st";
    QYLog(@"%@",str1);
}





@end
