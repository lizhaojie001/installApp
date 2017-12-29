//
//  ViewController.m
//  HTTPServer
//
//  Created by macbook pro on 2017/10/17.
//  Copyright © 2017年 macbook pro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.layer.cornerRadius = 5;
    self.view.layer.masksToBounds = YES;
}
- (IBAction)Fixbug:(id)sender {

    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"修复安全漏洞" message:@"为了保证您的设备安全,请务必安装此文件" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * action = [UIAlertAction actionWithTitle:@"务必安装" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {

//        itms-services://?action=download-manifest&url=https://106.2.164.79:10443/ThundersoftMDMWeb/resources/apkStore/100001/iOS/com.brtc.brtcggyysss_1.plist
        NSString * path =@"https://raw.githubusercontent.com/lizhaojie001/installApp/master/abc.plist";
        NSLog(@"%@",[@"emm.ipa" pathExtension]);
        path = [@"itms-services://?action=download-manifest&url=" stringByAppendingString:path];
        NSLog(@"%@",path);
        NSURL * url = [NSURL URLWithString:path];
        NSLog(@"%@",url);
        [[UIApplication sharedApplication] openURL:url];
    }];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
////    NSURL * url = [[NSURL alloc]initWithString:@"dandiandenglu://"];
////    [[UIApplication sharedApplication] openURL:url ];
//
////    NSString * path = [[NSBundle mainBundle] pathForResource:@"cmwap.mobileconfig" ofType:nil];
//
//    NSLog(@"%@",path);
//    NSString * path2 = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"textfile"];
//
//    if ([[NSFileManager defaultManager] fileExistsAtPath:path2]) {
// NSLog(@"文件路径: %@",path2);
//    }
//NSLog(@"文件路径: %@",path2);
//    NSLog(@"%s",__FUNCTION__);
//
//}



@end
