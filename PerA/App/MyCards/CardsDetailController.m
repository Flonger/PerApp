/*******************************************************************************\
** PerA:CardsDetailController.m
** Created by Flonger(xue@flonger.com) on 2019/4/17
**
**Copyright © 2019 flonger. All rights reserved.
\*******************************************************************************/


#import "CardsDetailController.h"
#import <PassKit/PassKit.h>

@interface CardsDetailController ()<PKAddPassesViewControllerDelegate>

@end

@implementation CardsDetailController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    PKAddPassButton *pkAddBtn = [[PKAddPassButton alloc] initWithAddPassButtonStyle:PKAddPassButtonStyleBlackOutline];
    pkAddBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    pkAddBtn.frame = CGRectMake(100, 100, 220, 40);
    [self.view addSubview:pkAddBtn];
    
    [pkAddBtn addTarget:self action:@selector(pkClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    PKAddPassButton *pkAddBtn2 = [[PKAddPassButton alloc] initWithAddPassButtonStyle:PKAddPassButtonStyleBlack];
    pkAddBtn2.titleLabel.font = [UIFont systemFontOfSize:12];
    pkAddBtn2.frame = CGRectMake(100, 200, 220, 40);
    [self.view addSubview:pkAddBtn2];
    
    [pkAddBtn2 addTarget:self action:@selector(pk2Click:) forControlEvents:UIControlEventTouchUpInside];

}
- (void)pkClick:(PKAddPassButton *)sender
{
    NSString *passPath = [[NSBundle mainBundle] pathForResource:@"Lollipop" ofType:@"pkpass"];
    NSData *passData = [[NSData alloc] initWithContentsOfFile:passPath];
    NSError *error = nil;
    PKPass *pass = [[PKPass alloc] initWithData:passData error:&error];
    if (error) {
        NSLog(@"创建pass 过程中发生错误,错误信息:%@", error.localizedDescription);
    }
    
    PKAddPassesViewController *vc = [[PKAddPassesViewController alloc] initWithPass:pass];
    vc.delegate = self;
    
    [self presentViewController:vc animated:YES completion:nil];
    
}
- (void)pk2Click:(PKAddPassButton *)sender
{
    
    [self.navigationController pushViewController:[[CTMediator sharedInstance] fl_mediator_addCardsControllerWithParams:nil] animated:YES];
    
}

#pragma mark -  delegate

- (void)addPassesViewControllerDidFinish:(PKAddPassesViewController *)controller
{
    NSLog(@"add pass finished");
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
