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
    NSError *parseError = nil;
    NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingFragmentsAllowed error:&parseError];
    NSLog(@"response: %@",dic);
    BOOL isJson = [NSJSONSerialization isValidJSONObject:dic];
}

///NSURLConnection 异步请求
- (IBAction)asynchronousRequest:(id)sender {
    
}
@end
