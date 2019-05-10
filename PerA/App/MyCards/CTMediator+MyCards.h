/*******************************************************************************\
** PerA:CTMediator+MyCards.h
** Created by Flonger(xue@flonger.com) on 2019/4/10
**
**Copyright © 2019 flonger. All rights reserved.
\*******************************************************************************/


#import <CTMediator/CTMediator.h>

@interface CTMediator (MyCards)
- (UIViewController *)fl_mediator_addCardsControllerWithParams:(NSDictionary *)dict;
- (UIViewController *)fl_mediator_cardDetailControllerWithParams:(NSDictionary *)dict;

@end
