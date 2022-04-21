//
//  QYHttpRequestVC.m
//  QYMobileKit_Example
//
//  Created by Peter Wen on 2022/4/20.
//  Copyright © 2022 qingyu2010. All rights reserved.
//

#import "QYHttpRequestVC.h"
#import "QYServerURL.h"

@interface QYHttpRequestVC ()

@property(nonatomic, strong) NSURLConnection *conn;

@end

@implementation QYHttpRequestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

///NSURLConnection 同步请求
///需要配置下面权限
///<key>NSAppTransportSecurity</key>
///<dict>
///    <key>NSAllowsArbitraryLoads</key>
///    <true/>
///</dict>
- (IBAction)synchronousRequest:(id)sender {
    NSURL *url = [NSURL URLWithString:GetWeatherInfo];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSHTTPURLResponse *response = nil;
    NSError *error = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
  
    NSDictionary *dic = [QYDataConverter jsonObjectWithData:data];
    NSLog(@"response: %@",dic);
    
}

///NSURLConnection 异步请求
- (IBAction)asynchronousRequest:(id)sender {
    NSURL *url = [NSURL URLWithString:GetWeatherInfo];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        
        NSDictionary *dic = [QYDataConverter jsonObjectWithData:data];
        NSLog(@"response: %@",dic);
    }];
}


@end
