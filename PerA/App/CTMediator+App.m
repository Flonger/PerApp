/*******************************************************************************\
** PerA:CTMediator+App.m
** Created by Flonger(xue@flonger.com) on 2019/4/10
**
**Copyright © 2019 flonger. All rights reserved.
\*******************************************************************************/


#import "CTMediator+App.h"
// ******************** NOTE  ************************

//TODO: 这里的两个字符串必须 hard code

//  1. 字符串 是类名 Target_xxx.h 中的 xxx 部分
NSString * const kCTMediatorTarget_News = @"News";

//  2. 字符串是 Target_xxx.h 中 定义的 Action_xxxx 函数名的 xxx 部分
NSString * const kCTMediatorActionNativTo_NewsViewController = @"NativeToNewsViewController";


NSString * const kCTMediatorTarget_App = @"App";
NSString * const kCTMediatorActionNativTo_RecordsController = @"NativeRecordsController";
NSString * const kCTMediatorActionNativTo_MyCardsController = @"NativeMyCardsController";
NSString * const kCTMediatorActionNativTo_PersonalController = @"NativePersonalController";



// ******************** NOTE  ************************

@implementation CTMediator (App)
- (UIViewController *)yt_mediator_newsViewControllerWithParams:(NSDictionary *)dict {
    
    UIViewController *viewController = [self performTarget:kCTMediatorTarget_News
                                                    action:kCTMediatorActionNativTo_NewsViewController
                                                    params:dict
                                         shouldCacheTarget:YES];
    if ([viewController isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return viewController;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        NSLog(@"%@ 未能实例化页面", NSStringFromSelector(_cmd));
        return [[UIViewController alloc] init];
    }
}

- (UIViewController *)fl_mediator_recordsControllerWithParams:(NSDictionary *)dict{
    BaseViewController *viewController = [self performTarget:kCTMediatorTarget_App
                                                    action:kCTMediatorActionNativTo_RecordsController
                                                    params:dict
                                         shouldCacheTarget:YES];
    if ([viewController isKindOfClass:[BaseViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return viewController;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        NSLog(@"%@ 未能实例化页面", NSStringFromSelector(_cmd));
        return [[UIViewController alloc] init];
    }
}
- (UIViewController *)fl_mediator_myCardsControllerWithParams:(NSDictionary *)dict{
    BaseViewController *viewController = [self performTarget:kCTMediatorTarget_App
                                                    action:kCTMediatorActionNativTo_MyCardsController
                                                    params:dict
                                         shouldCacheTarget:YES];
    if ([viewController isKindOfClass:[BaseViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return viewController;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        NSLog(@"%@ 未能实例化页面", NSStringFromSelector(_cmd));
        return [[UIViewController alloc] init];
    }
}
- (UIViewController *)fl_mediator_personalControllerWithParams:(NSDictionary *)dict{
    BaseViewController *viewController = [self performTarget:kCTMediatorTarget_App
                                                    action:kCTMediatorActionNativTo_PersonalController
                                                    params:dict
                                         shouldCacheTarget:YES];
    if ([viewController isKindOfClass:[BaseViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return viewController;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        NSLog(@"%@ 未能实例化页面", NSStringFromSelector(_cmd));
        return [[UIViewController alloc] init];
    }
}


@end
