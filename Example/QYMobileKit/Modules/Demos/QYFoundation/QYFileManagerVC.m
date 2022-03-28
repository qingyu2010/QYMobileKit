//
//  QYFileManagerVC.m
//  QYMobileKit_Example
//
//  Created by Peter Wen on 2022/2/19.
//  Copyright © 2022 qingyu2010. All rights reserved.
//

#import "QYFileManagerVC.h"


@interface QYFileManagerVC ()

@end

@implementation QYFileManagerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    QYLog(@"%@",[QYDataConverter stringWithDate:[NSDate date]]);
    NSString *str = @"abc";
    NSString *hexString = [QYDataConverter hexStringWithData:[QYDataConverter dataWithString:str]];
    QYLog(@"hex: %@",hexString);
    
    NSData *data = [QYDataConverter dataWithHexString:hexString];
    NSString *ss = [QYDataConverter stringWithData:data];
    QYLog(@"ss: %@",ss);
}





@end
