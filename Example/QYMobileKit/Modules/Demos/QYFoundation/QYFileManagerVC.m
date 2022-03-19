//
//  QYFileManagerVC.m
//  QYMobileKit_Example
//
//  Created by Peter Wen on 2022/2/19.
//  Copyright © 2022 qingyu2010. All rights reserved.
//

#import "QYFileManagerVC.h"
#import <QYMobileKit/QYDeviceUtilities.h>
#import <QYMobileKit/QYBundleUtilities.h>

@interface QYFileManagerVC ()

@end

@implementation QYFileManagerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSString *tt = [NSBundle displayNameForQY];
    NSLog(@"%@",tt);
    tt = [NSBundle shortVersionStringForQY];
    NSLog(@"%@",tt);
    tt = [NSBundle versionForQY];
    NSLog(@"%@",tt);
    tt = [NSBundle identifierForQY];
    NSLog(@"%@",tt);
}





@end
