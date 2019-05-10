//
//  Target_MyCards.h
//  PerA
//
//  Created by 薛飞龙 on 2019/4/10.
//Copyright © 2019 flonger. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Target_MyCards : NSObject
- (BaseViewController *)Action_NativeAddCardsController:(NSDictionary *)params;
- (BaseViewController *)Action_NativeCardsDetailController:(NSDictionary *)params;

@end
