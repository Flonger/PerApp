/*******************************************************************************\
** PerA:CTMediator+MyCards.m
** Created by Flonger(xue@flonger.com) on 2019/4/10
**
**Copyright © 2019 flonger. All rights reserved.
\*******************************************************************************/


#import "CTMediator+MyCards.h"
NSString * const kCTMediatorTarget_MyCards = @"MyCards";
NSString * const kCTMediatorActionNativTo_AddCardsController = @"NativeAddCardsController";
NSString * const kCTMediatorActionNativTo_cardDetailController = @"NativeCardsDetailController";

@implementation CTMediator (MyCards)
- (UIViewController *)fl_mediator_addCardsControllerWithParams:(NSDictionary *)dict{
    UIViewController *viewController = [self performTarget:kCTMediatorTarget_MyCards
                                                    action:kCTMediatorActionNativTo_AddCardsController
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

- (UIViewController *)fl_mediator_cardDetailControllerWithParams:(NSDictionary *)dict{
    UIViewController *viewController = [self performTarget:kCTMediatorTarget_MyCards
                                                    action:kCTMediatorActionNativTo_cardDetailController
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
