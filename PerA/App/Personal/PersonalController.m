/*******************************************************************************\
** PerA:ViewController3.m
** Created by Flonger(xue@flonger.com) on 2019/4/2
**
**Copyright © 2019 flonger. All rights reserved.
\*******************************************************************************/


#import "PersonalController.h"

#define imgWidth kHeight(100)

@interface PersonalController ()
@property (nonatomic,strong) UIView *mainView;

@property (nonatomic,strong) UIImageView *topImg;
@property (nonatomic,strong) UILabel *titleLab;
@property (nonatomic,strong) UILabel *firstInfoLab;
@property (nonatomic,strong) UILabel *secondInfoLab;

@property (nonatomic,strong) UIButton *commitBtn;
@end

@implementation PersonalController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"个人中心";
    [self initUI];
    
    // 假设3秒后，获取到数据
    [self performSelector:@selector(afterGetData) withObject:nil afterDelay:3.0];
}

- (void)dealloc {
    NSLog(@"==========  dealloc  ==========");
}

- (void)afterGetData {
    [self.mainView tab_endAnimation];
    
    _topImg.image = [UIImage imageNamed:@"test.jpg"];
    _titleLab.text = @"Flonger";
    _firstInfoLab.text = @"艺术是要永远流传下去的永恒之美";
    _secondInfoLab.text = @"微信:longer";
    [_commitBtn setTitle:@"立即使用" forState:UIControlStateNormal];
    
    _commitBtn.layer.borderColor = UIColor.redColor.CGColor;
    _commitBtn.layer.borderWidth = 1.0;
}

#pragma mark - Init Method

- (void)initUI {
    
    self.view.backgroundColor = UIColor.whiteColor;
    self.mainView = [[UIView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.mainView];
    
    [self.mainView addSubview:self.topImg];
    [self.mainView addSubview:self.titleLab];
    [self.mainView addSubview:self.firstInfoLab];
    [self.mainView addSubview:self.secondInfoLab];
    [self.mainView addSubview:self.commitBtn];
    
    [self.mainView tab_startAnimation];
}

#pragma mark - Lazy Method

- (UIImageView *)topImg {
    if (!_topImg) {
        _topImg = [[UIImageView alloc] init];
        _topImg.frame = CGRectMake((kScreenWidth - imgWidth)/2.0, kNavigationHeight + kHeight(60), imgWidth, imgWidth);
        _topImg.layer.cornerRadius = imgWidth/2.0;
        _topImg.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _topImg;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [[UILabel alloc] init];
        _titleLab.frame = CGRectMake(0, CGRectGetMaxY(self.topImg.frame)+kHeight(30), kScreenWidth, kHeight(30));
        _titleLab.font = kFont(20);
        _titleLab.tabViewWidth = 210;
        _titleLab.textColor = UIColor.blackColor;
        _titleLab.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLab;
}

- (UILabel *)firstInfoLab {
    if (!_firstInfoLab) {
        _firstInfoLab = [[UILabel alloc] init];
        _firstInfoLab.frame = CGRectMake(0, CGRectGetMaxY(self.titleLab.frame)+kHeight(60), kScreenWidth, kHeight(20));
        _firstInfoLab.font = kFont(16);
        _firstInfoLab.textColor = UIColor.grayColor;
        _firstInfoLab.tabViewWidth = 280;
        _firstInfoLab.textAlignment = NSTextAlignmentCenter;
    }
    return _firstInfoLab;
}

- (UILabel *)secondInfoLab {
    if (!_secondInfoLab) {
        _secondInfoLab = [[UILabel alloc] init];
        _secondInfoLab.frame = CGRectMake(0, CGRectGetMaxY(self.firstInfoLab.frame)+kHeight(8), kScreenWidth, kHeight(20));
        _secondInfoLab.font = kFont(16);
        _secondInfoLab.textColor = UIColor.grayColor;
        _secondInfoLab.tabViewWidth = 260;
        _secondInfoLab.textAlignment = NSTextAlignmentCenter;
    }
    return _secondInfoLab;
}

- (UIButton *)commitBtn {
    if (!_commitBtn) {
        _commitBtn = [[UIButton alloc] init];
        _commitBtn.frame = CGRectMake(kWidth(28), CGRectGetMaxY(self.secondInfoLab.frame)+kHeight(80), kScreenWidth - kWidth(28)*2, 55);
        [_commitBtn setTitleColor:UIColor.redColor forState:UIControlStateNormal];
        _commitBtn.layer.cornerRadius = 5.0f;
        [_commitBtn.titleLabel setFont:kFont(16)];
    }
    return _commitBtn;
}

@end
