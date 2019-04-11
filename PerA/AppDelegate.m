//
//  AppDelegate.m
//  PerA
//
//  Created by 薛飞龙 on 2019/4/2.
//  Copyright © 2019 flonger. All rights reserved.
//

#import "AppDelegate.h"
#import "CYLTabBarController.h"

@interface AppDelegate ()
@property (nonatomic, strong) CYLTabBarController * tabBarController;
@end

@implementation AppDelegate

- (void)customizeTabBarForController:(CYLTabBarController *)tabBarController {
    
    NSDictionary *dict1 = @{
                            CYLTabBarItemTitle : @"记录",
                            CYLTabBarItemImage : @"home",
                            CYLTabBarItemSelectedImage : @"home_h",
                            };
    NSDictionary *dict2 = @{
                            CYLTabBarItemTitle : @"我的卡",
                            CYLTabBarItemImage : @"love",
                            CYLTabBarItemSelectedImage : @"love_h",
                            };
    NSDictionary *dict3 = @{
                            CYLTabBarItemTitle : @"个人中心",
                            CYLTabBarItemImage : @"user",
                            CYLTabBarItemSelectedImage : @"user_h",
                            };
    
    NSArray *tabBarItemsAttributes = @[ dict1, dict2, dict3 ];
    tabBarController.tabBarItemsAttributes = tabBarItemsAttributes;
}
- (void)setupViewControllers {
    UIViewController *firstNavigationController = [[UINavigationController alloc]
                                                   initWithRootViewController:[[CTMediator sharedInstance] fl_mediator_recordsControllerWithParams:nil]];
    
    UIViewController *secondNavigationController = [[UINavigationController alloc]
                                                    initWithRootViewController:[[CTMediator sharedInstance] fl_mediator_myCardsControllerWithParams:nil]];
    UIViewController *thirdNavigationController = [[UINavigationController alloc]
                                                    initWithRootViewController:[[CTMediator sharedInstance] fl_mediator_personalControllerWithParams:nil]];
    
    CYLTabBarController *tabBarController = [[CYLTabBarController alloc] init];
    [self customizeTabBarForController:tabBarController];
    [tabBarController setViewControllers:@[
                                           firstNavigationController,
                                           secondNavigationController,
                                           thirdNavigationController
                                           ]];
    self.tabBarController = tabBarController;
}

- (void)setDefultTABViewAnimated{
    // 设置TABAnimated相关属性
    [[TABViewAnimated sharedAnimated] initWithBinAnimation];
    // demo选择普通模式的时候，将属性切回了普通模式
    // 目前两种模式在不同视图上可以切换
    [TABViewAnimated sharedAnimated].isUseTemplate = YES;
    // 设置全局圆角
    [TABViewAnimated sharedAnimated].animatedCornerRadius = 3.f;
//    [TABViewAnimated sharedAnimated].animatedColor = kColor(0x23eeee);
    // 设置全局模版，有内置模版
    // 注意，模版一定要按照规矩来，继承自TABBaseTableViewCell,TABBaseCollectionViewCell
    // 模版的初衷是另写一个新的cell，如果你用项目中用到的cell，也不是不可以，只是会在cell内产生耦合
    [TABViewAnimated sharedAnimated].templateTableViewCell = [TABBaseTableViewCell class];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self setDefultTABViewAnimated];
    [self setupViewControllers];
    [self.window setRootViewController:self.tabBarController];
    return YES;
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
