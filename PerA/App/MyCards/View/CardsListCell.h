//
//  CardsListCell.h
//  PerA
//
//  Created by 薛飞龙 on 2019/4/17.
//Copyright © 2019 flonger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cards.h"
#import "TABBaseTableViewCell.h"

@interface CardsListCell : UITableViewCell
- (void)setUpCell;
- (void)loadCellWith:(Cards *)data;
@end
