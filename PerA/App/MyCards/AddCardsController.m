/*******************************************************************************\
** PerA:AddCardsController.m
** Created by Flonger(xue@flonger.com) on 2019/4/10
**
**Copyright © 2019 flonger. All rights reserved.
\*******************************************************************************/


#import "AddCardsController.h"
#import "Cards.h"


@interface AddCardsController ()

@end

@implementation AddCardsController
{
    JQFMDB *_db;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpUI];
}

- (void)setUpUI{
    Cards * card = [[Cards alloc] init];
    card.cardNum = @"00000000";
    card.cardName = @"世纪联华";
    card.cardPhoto = @"/user/user/user/user.jpg";
    card.type = CardTypeVip;
    card.cardDetail = @"世纪联华的会员卡";
    
    if (!_db) {
        _db = [JQFMDB shareDatabase:@"testcards.sqlite"];
    }
    if (![_db jq_isExistTable:@"cardlist"]) {
        [_db jq_createTable:@"cardlist" dicOrModel:[Cards class]];
    }
    
    [_db jq_insertTable:@"cardlist" dicOrModel:card];
}

@end
