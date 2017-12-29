//
//  AppDelegate.m
//  HTTPServer
//
//  Created by macbook pro on 2017/10/17.
//  Copyright © 2017年 macbook pro. All rights reserved.
//

#import "AppDelegate.h"
#import "HTTPServer.h"
#import "NSLogger.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [[HTTPServer sharedHTTPServer] start];
   LoggerSetViewerHost(NULL, (CFStringRef)@"192.168.7.248", (UInt32)55555);
    sleep(1.0);
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.

//    NSLog(@"应用进入后天%s",__FUNCTION__);
//    backgroundTask = [application beginBackgroundTaskWithExpirationHandler: ^{
//        dispatch_async(dispatch_get_main_queue(), ^{
//            if (backgroundTask != UIBackgroundTaskInvalid)
//            {
//                NSLog(@"后台任务超时%s",__FUNCTION__);
//                if([[HTTPServer sharedHTTPServer] state]!=0){
//                    [[HTTPServer sharedHTTPServer] stop];
//                }
//                [application endBackgroundTask:backgroundTask];
//                backgroundTask = UIBackgroundTaskInvalid;
//            }
//        });
//    }];
//
////开启后天任务
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        [NSThread sleepForTimeInterval:360];
//        NSLog(@"Time remanining: %f",[application backgroundTimeRemaining]);
//        dispatch_async(dispatch_get_main_queue(), ^{
//            if (backgroundTask != UIBackgroundTaskInvalid) {
//                if (([[HTTPServer sharedHTTPServer] state] !=0)) {
//                    [[HTTPServer sharedHTTPServer] stop];
//                }
//                [application endBackgroundTask:backgroundTask];
//                backgroundTask = UIBackgroundTaskInvalid;
//            }
//        });
//    });

//    if (timer==NULL) {
//        timer =dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0));
//        dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1ull * NSEC_PER_SEC, 0);
//        dispatch_source_set_event_handler(timer, ^{
//            NSLog(@"任务正在进行中%s",__FUNCTION__);
//            
//        });
//        dispatch_resume(timer);
//    }


    BOOL backgroundAccepted = [[UIApplication sharedApplication] setKeepAliveTimeout:600 handler:^{
        [self backgroundHandler];
    }];

    if (backgroundAccepted) {
        NSLog(@"后台模式开启");
    }
    [self backgroundHandler];

}
-(void)backgroundHandler{
    UIApplication *app = [UIApplication sharedApplication];
    backgroundTask = [app beginBackgroundTaskWithExpirationHandler:^{
        [app endBackgroundTask:backgroundTask];
        backgroundTask = UIBackgroundTaskInvalid;
    }];

    dispatch_async(dispatch_get_global_queue(0, 0), ^{

    });
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    [[HTTPServer sharedHTTPServer] stop];
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
