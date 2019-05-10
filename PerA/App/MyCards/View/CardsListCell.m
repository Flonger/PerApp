//
//  CardsListCell.m
//  PerA
//
//  Created by 薛飞龙 on 2019/4/17.
//Copyright © 2019 flonger. All rights reserved.
//

#import "CardsListCell.h"

@interface CardsListCell ()
@property (nonatomic, strong) UIView * backView;

@property (nonatomic, strong) UILabel * title;

@property (nonatomic, strong) UILabel * time;

@property (nonatomic, strong) UIView * line;


@end

@implementation CardsListCell
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setUpCell
{
    self.accessoryType = UITableViewCellAccessoryNone;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.contentView.backgroundColor = BackColor;
    [self initUI];
}
- (void)initUI
{
    _title = [UILabel new];
    _title.font = SYSTEMFONT(CL(20));
    _title.textColor = UIColorFromRGB(0x494446);
    _title.text = @"姓名";
    [self addSubview:_title];

    
    
    _time = [UILabel new];
    _time.font = SYSTEMFONT(CL(20));
    _time.textColor = UIColorFromRGB(0x494446);
    _time.text = @"时间";
    _time.textAlignment = NSTextAlignmentRight;
    _time.whc_WidthAuto();
    [self addSubview:_time];

    
    
    
    
    _line = [UIView new];
    [_line setBackgroundColor:UIColorFromRGB(0xdddddd)];
    [self addSubview:_line];

}
- (void)layoutSubviews {
    [super layoutSubviews];
    [_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(CL(15));
        make.height.mas_equalTo(CL(90));
        make.width.mas_equalTo(CL(248-34));
    }];
    [_time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-CL(15));
        make.height.mas_equalTo(CL(90));
    }];
    [_line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(CL(15));
        make.bottom.equalTo(self.mas_bottom).offset(-0.5);
        make.height.mas_equalTo(0.5);
        make.right.mas_equalTo(-CL(15));
    }];
}


- (void)loadCellWith:(Cards *)data
{
    _title.text = data.cardName;
    _time.text = data.cardDetail;
}

@end
