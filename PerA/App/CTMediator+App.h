/*******************************************************************************\
** PerA:CTMediator+App.h
** Created by Flonger(xue@flonger.com) on 2019/4/10
**
**Copyright © 2019 flonger. All rights reserved.
\*******************************************************************************/


#import <CTMediator/CTMediator.h>
#import <UIKit/UIKit.h>

@interface CTMediator (App)
- (UIViewController *)yt_mediator_newsViewControllerWithParams:(NSDictionary *)dict;
- (UIViewController *)fl_mediator_recordsControllerWithParams:(NSDictionary *)dict;
- (UIViewController *)fl_mediator_myCardsControllerWithParams:(NSDictionary *)dict;
- (UIViewController *)fl_mediator_personalControllerWithParams:(NSDictionary *)dict;

@end
