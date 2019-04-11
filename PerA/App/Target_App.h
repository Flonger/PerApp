//
//  Target_App.h
//  PerA
//
//  Created by 薛飞龙 on 2019/4/10.
//Copyright © 2019 flonger. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Target_App : NSObject
#warning 如果 Target_XXX 中的 Action_XXX 方法名变了。 CTMediator+XXXActions.m 中的字符串也必须得一起变


/**
 *  返回 NewsViewController 实例
 *
 *  @param params 要传给 NewsViewController 的参数
 */
- (UIViewController *)Action_NativeToNewsViewController:(NSDictionary *)params;


- (BaseViewController *)Action_NativeRecordsController:(NSDictionary *)params;
- (BaseViewController *)Action_NativeMyCardsController:(NSDictionary *)params;
- (BaseViewController *)Action_NativePersonalController:(NSDictionary *)params;


@end
