//
//  QYMdnsVC.m
//  QYMobileKit_Example
//
//  Created by Peter Wen on 2022/4/13.
//  Copyright © 2022 qingyu2010. All rights reserved.
//

#import "QYMdnsVC.h"
#include <arpa/inet.h>

@interface QYMdnsVC ()<NSNetServiceBrowserDelegate,NSNetServiceDelegate>

@property(nonatomic,strong) NSNetService *service;
@property(nonatomic,strong) NSNetServiceBrowser *serviceBrowser;
///客服端扫描到的service
@property(nonatomic,strong) NSNetService *findService;
@end

@implementation QYMdnsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - NetService
///开启mdns，无论是服务端还是客户端都需要配置mdns的权限，在info文件里配置mdns全线：
///<key>NSBonjourServices</key>
///<array>
///    <string>_wled._tcp</string>
///</array>
- (IBAction)startServiceMdns:(id)sender {
    if (!self.service) {
        QYLog(@"%s:%@",__FUNCTION__,@"start mdns publish");
        self.service = [[NSNetService alloc] initWithDomain:@"local." type:@"_wled._tcp" name:@"WE_iPhone" port:5353];
        NSData *data = [NSNetService dataFromTXTRecordDictionary:@{@"exData":[@"ProductType_1234&VID_1532&PID_030D&EID_0000&NAME_Gillian_T8_Peter\\MAC_34D7EB515FFE" dataUsingEncoding:NSUTF8StringEncoding],@"mac":[@"34D7EB515FFE" dataUsingEncoding:NSUTF8StringEncoding]}];
        [self.service setTXTRecordData:data];
        self.service.delegate = self;
        [self.service publish];
    }
}
- (IBAction)stopServiceMdns:(id)sender {
    [self.service stop];
    self.service = nil;
}
- (void)netServiceWillPublish:(NSNetService *)sender {
    QYLog(@"%s",__FUNCTION__);
}

- (void)netServiceDidPublish:(NSNetService *)sender {
    QYLog(@"%s",__FUNCTION__);
}
- (void)netService:(NSNetService *)sender didNotPublish:(NSDictionary<NSString *, NSNumber *> *)errorDict {
    QYLog(@"%s",__FUNCTION__);
    QYLog(@"error: %@",errorDict);
}
- (void)netServiceDidStop:(NSNetService *)sender {
    NSNetService *service = sender;
    QYLog(@"%s serviceName:",__FUNCTION__,service.name);
}



#pragma mark - NetServiceBrowser
- (IBAction)startClientMdns:(id)sender {
    if (!self.serviceBrowser) {
        self.serviceBrowser = [[NSNetServiceBrowser alloc] init];
        [self.serviceBrowser scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        self.serviceBrowser.delegate = self;
        [self.serviceBrowser searchForServicesOfType:@"_wled._tcp" inDomain:@"local."];
    }
    
}
- (IBAction)stopClientMdns:(id)sender {
    [self.serviceBrowser stop];
    self.serviceBrowser = nil;
}
- (void)netServiceBrowser:(NSNetServiceBrowser *)browser didFindService:(NSNetService *)service moreComing:(BOOL)moreComing {
    NSString *serviceName = service.name;
    NSLog(@"%s serviceName: %@",__FUNCTION__,serviceName);
    if (serviceName.length > 0) {
        self.findService = service;
        service.delegate = self;
        [service startMonitoring];
        [service resolveWithTimeout:2.0];
    }
}
- (void)netServiceBrowser:(NSNetServiceBrowser *)browser didNotSearch:(NSDictionary<NSString *, NSNumber *> *)errorDict {
    QYLog(@"%s",__FUNCTION__);
}
- (void)netServiceBrowserDidStopSearch:(NSNetServiceBrowser *)browser {
    QYLog(@"%s",__FUNCTION__);
}
///解析扫描到的服务的ip地址和端口
- (void)netServiceDidResolveAddress:(NSNetService *)sender {
    NSNetService *service = sender;
    if (service.addresses.firstObject) {
        struct sockaddr_in *addr = (struct sockaddr_in *)(service.addresses.firstObject.bytes);
        NSString *ip = [NSString stringWithUTF8String:inet_ntoa(addr->sin_addr)];
        NSInteger port = ntohs(addr->sin_port);
        QYLog(@"%s ip:%@ port: %d",__FUNCTION__,ip,port);
        [service stopMonitoring];
    }
}
///解析mdns的广播数据
- (void)netService:(NSNetService *)sender didUpdateTXTRecordData:(NSData *)data {
    NSNetService *service = sender;
    NSDictionary *dict = [NSNetService dictionaryFromTXTRecordData:data];
    QYLog(@"%s serviceName:%@ data: %@",__FUNCTION__,service.name,dict);
}
- (void)netService:(NSNetService *)sender didAcceptConnectionWithInputStream:(NSInputStream *)inputStream outputStream:(NSOutputStream *)outputStream {
    QYLog(@"%s",__FUNCTION__);
}
@end
