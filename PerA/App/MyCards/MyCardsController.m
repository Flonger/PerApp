/*******************************************************************************\
** PerA:ViewController2.m
** Created by Flonger(xue@flonger.com) on 2019/4/2
**
**Copyright © 2019 flonger. All rights reserved.
\*******************************************************************************/


#import "MyCardsController.h"
#import "Target_MyCards.h"
#import "AddCardsController.h"
#import "CardsListCell.h"
#import "Cards.h"

#import "ViewController.h"

@interface MyCardsController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) NSMutableArray * dataArray;

@end

@implementation MyCardsController
{
    JQFMDB *_db;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"我的卡";
    [self initUI];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    [_dataArray removeAllObjects];
//    [self.tableView reloadData];
//    
//    [self.tableView tab_startAnimation];
//    [self performSelector:@selector(getData) withObject:nil afterDelay:2.0];
}


- (void)initUI{
    [self.view addSubview:self.tableView];
    [self.tableView tab_startAnimation];
    [self performSelector:@selector(getData) withObject:nil afterDelay:2.0];
}

- (UIView *)addBtn{
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, CL(80))];
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"添加卡片" forState:(UIControlStateNormal)];
    [btn setTitleColor:RedColor forState:(UIControlStateNormal)];
    btn.frame = CGRectMake(CL(15), CL(20), kScreenWidth - CL(30), CL(40));
    [view addSubview:btn];
    ViewBorderRadius(btn, CL(5), 1, RedColor);
    [[btn rac_signalForControlEvents:(UIControlEventTouchUpInside)] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [self.navigationController pushViewController:[[CTMediator sharedInstance] fl_mediator_addCardsControllerWithParams:nil] animated:YES];
    }];
    
    return view;
}

- (void)getData{
    
    _dataArray = [NSMutableArray array];
    if (!_db) {
        _db = [JQFMDB shareDatabase:@"testcards.sqlite"];
    }
    [_db jq_inDatabase:^{
        _dataArray = [_db jq_lookupTable:@"cardlist" dicOrModel:[Cards class] whereFormat:nil];
        [self.tableView reloadData];
    }];
    
    [self.tableView tab_endAnimation];

}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.emptyDataSetDelegate = self;
        _tableView.emptyDataSetSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[CardsListCell class] forCellReuseIdentifier:@"CardsListCell"];
        
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        
        _tableView.tableFooterView = [self addBtn];
        CGFloat h = kNavigationHeight;
        CGFloat safe = kSafeAreaHeight;
        _tableView.frame = CGRectMake(0, h, kScreenWidth, kScreenHeight - h - safe);
        
        TABAnimatedObject *tabAnimated = [[TABAnimatedObject alloc] init];
        tabAnimated.animatedCount = 10;
        tabAnimated.isNest = YES;
        _tableView.tabAnimated = tabAnimated;
    }
    return _tableView;
}
//=================================================================
//                       UITableViewDelegate
//=================================================================
#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *rid=@"CardsListCell";
    
    CardsListCell *cell=[tableView dequeueReusableCellWithIdentifier:rid];
    
    [cell setUpCell];
    
    if (!tableView.tabAnimated.isAnimating) {
        [cell loadCellWith:_dataArray[indexPath.row]];

    }
    
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.navigationController pushViewController:[[CTMediator sharedInstance] fl_mediator_cardDetailControllerWithParams:nil] animated:YES];

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CL(90);
}


#pragma mark - DZNEmptyDataSetSource Methods
- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView
{
    NSString *text = nil;
    UIFont *font = nil;
    UIColor *textColor = nil;
    
    NSMutableDictionary *attributes = [NSMutableDictionary new];
    
    text = NSLocalizedString(@"暂无卡片",nil);
    font = SYSTEMFONT(14);
    textColor = Color_9;
    
    if (!text) {
        return nil;
    }
    
    if (font) [attributes setObject:font forKey:NSFontAttributeName];
    if (textColor) [attributes setObject:textColor forKey:NSForegroundColorAttributeName];
    
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}
- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView
{
    
    return UIIMAGE(@"dl");
}
#pragma mark - DZNEmptyDataSetDelegate Methods
- (BOOL)emptyDataSetShouldDisplay:(UIScrollView *)scrollView{
    return YES;
}

- (BOOL)emptyDataSetShouldAllowTouch:(UIScrollView *)scrollView
{
    return YES;
}

- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView
{
    return YES;
}

- (BOOL)emptyDataSetShouldAnimateImageView:(UIScrollView *)scrollView
{
    return YES;
}
- (void)emptyDataSet:(UIScrollView *)scrollView didTapView:(UIView *)view
{
    
    //    [self getData];
}


@end
