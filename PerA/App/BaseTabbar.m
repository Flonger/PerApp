/*******************************************************************************\
** PerA:BaseTabbar.m
** Created by Flonger(xue@flonger.com) on 2019/4/18
**
**Copyright © 2019 flonger. All rights reserved.
\*******************************************************************************/


#import "BaseTabbar.h"
#import "WHGradientHelper.h"
#import "BaseNavigationController.h"
@interface BaseTabbar ()<AxcAE_TabBarDelegate>
@property(nonatomic, strong)UIImageView *imgV;
@end

@implementation BaseTabbar

- (void)viewDidLoad {
    [super viewDidLoad];
    // 添加子VC
    [self addChildViewControllers];
}
- (void)addChildViewControllers{
    // 创建选项卡的数据 想怎么写看自己，这块我就写笨点了
    NSArray <NSDictionary *>*VCArray =
    @[@{@"vc":[[BaseNavigationController alloc]
               initWithRootViewController:[[CTMediator sharedInstance] fl_mediator_recordsControllerWithParams:nil]],@"normalImg":@"home",@"selectImg":@"home_h",@"itemTitle":@"记录"},
      @{@"vc":[[BaseNavigationController alloc]
               initWithRootViewController:[[CTMediator sharedInstance] fl_mediator_myCardsControllerWithParams:nil]],@"normalImg":@"love",@"selectImg":@"love_h",@"itemTitle":@"我的卡"},
      @{@"vc":[[BaseNavigationController alloc]
               initWithRootViewController:[[CTMediator sharedInstance] fl_mediator_personalControllerWithParams:nil]],@"normalImg":@"user",@"selectImg":@"user_h",@"itemTitle":@"个人中心"}];
    // 1.遍历这个集合
    // 1.1 设置一个保存构造器的数组
    NSMutableArray *tabBarConfs = @[].mutableCopy;
    // 1.2 设置一个保存VC的数组
    NSMutableArray *tabBarVCs = @[].mutableCopy;
    [VCArray enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        // 2.根据集合来创建TabBar构造器
        AxcAE_TabBarConfigModel *model = [AxcAE_TabBarConfigModel new];
        // 3.item基础数据三连
        model.itemTitle = [obj objectForKey:@"itemTitle"];
        model.selectImageName = [obj objectForKey:@"selectImg"];
        model.normalImageName = [obj objectForKey:@"normalImg"];
        // 4.设置单个选中item标题状态下的颜色
        model.selectColor = [UIColor orangeColor];
        
        // 备注 如果一步设置的VC的背景颜色，VC就会提前绘制驻留，优化这方面的话最好不要这么写
        // 示例中为了方便就在这写了
        UIViewController *vc = [obj objectForKey:@"vc"];
        vc.view.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.f
                                                  green:arc4random()%255/255.f
                                                   blue:arc4random()%255/255.f alpha:1];
        // 5.将VC添加到系统控制组
        [tabBarVCs addObject:vc];
        // 5.1添加构造Model到集合
        [tabBarConfs addObject:model];
    }];
    // 5.2 设置VCs -----
    // 一定要先设置这一步，然后再进行后边的顺序，因为系统只有在setViewControllers函数后才不会再次创建UIBarButtonItem，以免造成遮挡
    // 大意就是一定要让自定义TabBar遮挡住系统的TabBar
    self.viewControllers = tabBarVCs;
    //////////////////////////////////////////////////////////////////////////
    // 注：这里方便阅读就将AE_TabBar放在这里实例化了 使用懒加载也行
    // 6.将自定义的覆盖到原来的tabBar上面
    // 这里有两种实例化方案：
    // 6.1 使用重载构造函数方式：
    //    self.axcTabBar = [[AxcAE_TabBar alloc] initWithTabBarConfig:tabBarConfs];
    // 6.2 使用Set方式：
    self.axcTabBar = [AxcAE_TabBar new] ;
    self.axcTabBar.tabBarConfig = tabBarConfs;
    // 7.设置委托
    self.axcTabBar.delegate = self;
    // 8.添加覆盖到上边
    [self.tabBar addSubview:self.axcTabBar];
    [self addLayoutTabBar]; // 10.添加适配
}
// 9.实现代理，如下：
- (void)axcAE_TabBar:(AxcAE_TabBar *)tabbar selectIndex:(NSInteger)index{
    // 通知 切换视图控制器
    [self setSelectedIndex:index];
    // 自定义的AE_TabBar回调点击事件给TabBarVC，TabBarVC用父类的TabBarController函数完成切换
}
- (void)setSelectedIndex:(NSUInteger)selectedIndex{
    [super setSelectedIndex:selectedIndex];
    if(self.axcTabBar){
        self.axcTabBar.selectIndex = selectedIndex;
    }
}

// 10.添加适配
- (void)addLayoutTabBar{
    // 使用重载viewDidLayoutSubviews实时计算坐标 （下边的 -viewDidLayoutSubviews 函数）
    // 能兼容转屏时的自动布局
}
- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.axcTabBar.frame = self.tabBar.bounds;
    [self.axcTabBar viewDidLayoutItems];
    // DEMO 混合使用渐变色工具
    /******************************************************************************/
    // 也需要重新适配布局
    self.imgV.frame = self.tabBar.bounds;
}

- (UIImageView *)imgV{
    if (!_imgV) {
        _imgV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
        CGRect frame = self.tabBar.bounds;
        frame.size.width = [UIScreen mainScreen].bounds.size.height; // 直接设置最大，因为这个渐变色框架不会重绘，转屏后无法适配
        _imgV.frame = frame;
        [self.axcTabBar.backgroundImageView addSubview:_imgV]; // 添加上去
//        [WHGradientHelper addGradientChromatoAnimation:_imgV];
    }
    return _imgV;
}
/******************************************************************************/


@end
