//
//  Target_App.m
//  PerA
//
//  Created by 薛飞龙 on 2019/4/10.
//Copyright © 2019 flonger. All rights reserved.
//

#import "Target_App.h"
#import "RecordsController.h"
#import "MyCardsController.h"
#import "PersonalController.h"

@implementation Target_App
/**
 *  返回 NewsViewController 实例
 *
 *  @param params 要传给 NewsViewController 的参数
 */
- (UIViewController *)Action_NativeToNewsViewController:(NSDictionary *)params {
    MyCardsController *newsVC = [[MyCardsController alloc] init];
    
    if ([params valueForKey:@"newsID"]) {
//        newsVC.newsID = params[@"newsID"];
    }
    
    return newsVC;
}

- (BaseViewController *)Action_NativeRecordsController:(NSDictionary *)params{
    RecordsController *recordVC = [[RecordsController alloc] init];
    return recordVC;
}
- (BaseViewController *)Action_NativeMyCardsController:(NSDictionary *)params{
    MyCardsController *myCardsVC = [[MyCardsController alloc] init];
    return myCardsVC;
}
- (BaseViewController *)Action_NativePersonalController:(NSDictionary *)params{
    PersonalController *personalVC = [[PersonalController alloc] init];
    return personalVC;
}


@end
