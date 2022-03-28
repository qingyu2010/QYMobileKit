//
//  QYDeviceAndBundleVC.m
//  QYMobileKit_Example
//
//  Created by Peter Wen on 2022/3/19.
//  Copyright © 2022 qingyu2010. All rights reserved.
//

#import "QYDeviceInfoVC.h"

@interface QYDeviceInfoVC ()

@property(nonatomic, strong) IBOutlet UILabel *deviceInfoLab;

@property(nonatomic, strong) IBOutlet UILabel *appInfoLab;

@end

@implementation QYDeviceInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *deviceIdentifier = [UIDevice currentDevice].identifierForQY;
    NSString *deviceIdentifier2 = [UIDevice currentDevice].identifierWithSeparatorForQY;
    self.deviceInfoLab.text = [NSString stringWithFormat:@"Identifier:\n%@\n%@",deviceIdentifier,deviceIdentifier2];
    
    NSString *displayName = [NSBundle displayNameForQY];
    NSString *shortVersion = [NSBundle shortVersionStringForQY];
    NSString *version = [NSBundle versionForQY];
    NSString *appId = [NSBundle identifierForQY];
    self.appInfoLab.text = [NSString stringWithFormat:@"displayName:\n%@\nshortVersion:\n%@\nversion:\n%@\nappid:\n%@\n",displayName,shortVersion,version,appId];
}

@end
