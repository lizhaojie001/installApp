//
//  AppDelegate.h
//  HTTPServer
//
//  Created by macbook pro on 2017/10/17.
//  Copyright © 2017年 macbook pro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    UIBackgroundTaskIdentifier backgroundTask;
    dispatch_source_t timer;
}

@property (strong, nonatomic) UIWindow *window;


@end

