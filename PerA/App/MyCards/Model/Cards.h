//
//  Cards.h
//  PerA
//
//  Created by 薛飞龙 on 2019/4/17.
//Copyright © 2019 flonger. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, CardType) {
    CardTypeBank = 0,
    CardTypeVip,
};

@interface Cards : NSObject

@property (nonatomic, copy) NSString * cardName;
@property (nonatomic, copy) NSString * cardNum;
@property (nonatomic, copy) NSString * cardPhoto;
@property (nonatomic, copy) NSString * cardDetail;
@property (nonatomic, assign) CardType type;


@end
