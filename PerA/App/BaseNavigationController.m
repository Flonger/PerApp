/*******************************************************************************\
** PerA:BaseNavigationController.m
** Created by Flonger(xue@flonger.com) on 2019/4/18
**
**Copyright © 2019 flonger. All rights reserved.
\*******************************************************************************/


#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    // 首页不需要隐藏tabbar
    NSString *ctrlName = NSStringFromClass([viewController class]);
    
    if ([ctrlName isEqualToString:@"PersonalController"] ||
        [ctrlName isEqualToString:@"MyCardsController"] ||
        [ctrlName isEqualToString:@"RecordsController"]) {
        
        viewController.hidesBottomBarWhenPushed = NO;
        
    }else{
        // 其他push时需要隐藏tabbar
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    // 这一句别忘记了啊
    [super pushViewController:viewController animated:animated];
}

@end
