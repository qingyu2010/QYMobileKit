//
//  QYSocketVC.m
//  QYMobileKit_Example
//
//  Created by Peter Wen on 2022/4/15.
//  Copyright © 2022 qingyu2010. All rights reserved.
//

#import "QYSocketVC.h"

#include<sys/socket.h>
#include<string.h>
#include<arpa/inet.h>
#include<netinet/in.h>
#include<unistd.h>

@interface QYSocketVC ()

@end

@implementation QYSocketVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)startUDPService:(id)sender {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        int sock = socket(AF_INET, SOCK_DGRAM, 0);
        if (sock < 0) {
            perror("socket");
            return;
        }
        struct sockaddr_in local;
        local.sin_family = AF_INET;
        local.sin_port = htons(8888);
        local.sin_addr.s_addr = htonl(INADDR_ANY);
        if (bind(sock, (struct sockaddr*)&local, sizeof(local)) < 0) {
            perror("bind");
            return;
        }
        char buf[1024];
        struct sockaddr_in client;
        socklen_t len = sizeof(client);
        char *msg = "hava a good day";
        while (1) {
            int r = recvfrom(sock, buf, sizeof(buf)-1, 0, (struct sockaddr *)&client, &len);
            if (r < 0) {
                perror("recvfrom");
            } else {
                buf[r] = 0;
                printf("[%s : %d]#  %s\n",inet_ntoa(client.sin_addr), ntohs(client.sin_port),buf);
                if (sendto(sock, msg, strlen(msg), 0, (struct sockaddr*)&client, len)) {
                    perror("sendto");
                }
            }
        }
        close(sock);
    });
}

#define BUFLEN 512
- (IBAction)startUDPClient:(id)sender {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        struct sockaddr_in si_other;
        int slen = sizeof(si_other);
        char message[BUFLEN];
        strcpy(message, "wenqinglin");
        int sock = socket(AF_INET, SOCK_DGRAM, 0);
        if (sock < 0) {
            perror("socket");
            return;
        }
    
        memset((char *) &si_other, 0, sizeof(si_other));
        si_other.sin_family = AF_INET;
        si_other.sin_port = htons(8888);
            
        if (inet_aton("192.168.31.222", &si_other.sin_addr) == 0)
        {
            perror("inet_aton");
            return;
        }
        
        while (1) {
            if (sendto(sock, message, strlen(message) , 0 , (struct sockaddr *) &si_other, slen) ==-1)
            {
                perror("sendto()");
            }
        }
        close(sock);
    });
}


- (IBAction)startTCPService:(id)sender {
    
}


- (IBAction)startTCPClient:(id)sender {
    
}
@end
