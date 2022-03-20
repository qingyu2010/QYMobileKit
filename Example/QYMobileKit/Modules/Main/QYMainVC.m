//
//  QYMainVC.m
//  QYMobileKit_Example
//
//  Created by Peter Wen on 2022/2/19.
//  Copyright © 2022 qingyu2010. All rights reserved.
//

#import "QYMainVC.h"

@interface QYMainVC ()

@property(nonatomic, strong) NSArray *foundationArray;
@property(nonatomic, strong) NSArray *uiKitArray;

@end

@implementation QYMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Home Page";
    [self initSourcesData];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellIdentifier"];
}

- (void)initSourcesData {
    self.foundationArray = @[@"QYFileManagerVC",@"QYTimerVC",@"QYDeviceAndBundleVC",@"QYGCDVC"];
    self.uiKitArray = @[@"QYMBProgressHUDVC"];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"Foundation";
    }
    return @"UIKit";
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return self.foundationArray.count;
    }
    return self.uiKitArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    NSString *className;
    if (indexPath.section == 0) {
        className = [self.foundationArray objectAtIndex:indexPath.row];
    } else {
        className = [self.uiKitArray objectAtIndex:indexPath.row];
    }
     
    cell.textLabel.text = className;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *className;
    if (indexPath.section == 0) {
        className = [self.foundationArray objectAtIndex:indexPath.row];
    } else {
        className = [self.uiKitArray objectAtIndex:indexPath.row];
    }
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:className];
    vc.title = className;
    [self.navigationController pushViewController:vc animated:YES];
}
@end
