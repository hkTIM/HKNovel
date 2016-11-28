//
//  AppDelegate.m
//  HKNovel
//
//  Created by 黄坤 on 2016/11/9.
//  Copyright © 2016年 黄坤. All rights reserved.
//

#import "AppDelegate.h"
#import "HRootVC.h"
#import "MMDrawerController.h"
@interface AppDelegate ()<UITabBarControllerDelegate>
@property (nonatomic, assign) NSUInteger lastSelectedIndex;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //创建窗口
    self.window =[[UIWindow alloc]init];
    //设置窗口大小
    self.window.frame=[UIScreen mainScreen].bounds;
    // tabBar 控制器设置
    HRootVC *tabBarVC=[[HRootVC alloc]init];
    tabBarVC.delegate=self;
    //设置根控制器
    self.window.rootViewController=tabBarVC;
    //设置窗口为主窗口显示
    [self.window makeKeyAndVisible];
    return YES;
}
-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    if (tabBarController.selectedIndex== self.lastSelectedIndex) {
        
    }
    // 记录目前选中的索引
    self.lastSelectedIndex = tabBarController.selectedIndex;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
