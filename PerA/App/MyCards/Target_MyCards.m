//
//  Target_MyCards.m
//  PerA
//
//  Created by 薛飞龙 on 2019/4/10.
//Copyright © 2019 flonger. All rights reserved.
//

#import "Target_MyCards.h"
#import "AddCardsController.h"
@implementation Target_MyCards

- (BaseViewController *)Action_NativeAddCardsController:(NSDictionary *)params{
    AddCardsController * acc = [[AddCardsController alloc] init];
    
    return acc;
}

@end
