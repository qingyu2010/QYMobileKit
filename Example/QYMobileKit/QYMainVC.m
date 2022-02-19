//
//  QYMainVC.m
//  QYMobileKit_Example
//
//  Created by Peter Wen on 2022/2/19.
//  Copyright © 2022 qingyu2010. All rights reserved.
//

#import "QYMainVC.h"

@interface QYMainVC ()

@property(strong) NSArray *sourcesArray;

@end

@implementation QYMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Home Page";
    [self initSourcesData];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellIdentifier"];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)initSourcesData {
    self.sourcesArray = @[@"QYTimerVC"];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.sourcesArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    
    NSString *className = [self.sourcesArray objectAtIndex:indexPath.row];
    cell.textLabel.text = className;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *className = [self.sourcesArray objectAtIndex:indexPath.row];
    UIViewController *vc = [[NSClassFromString(className) alloc] init];
    vc.title = className;
    [self.navigationController pushViewController:vc animated:YES];
}
@end
