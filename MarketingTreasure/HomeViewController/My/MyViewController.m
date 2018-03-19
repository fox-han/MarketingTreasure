//
//  MyViewController.m
//  MarketingTreasure
//
//  Created by hanwenguang on 2018/3/17.
//  Copyright © 2018年 hanwenguang. All rights reserved.
//

#import "MyViewController.h"
#import "MyTopView.h"
#import "MyPrivilegeViewController.h"

@interface MyViewController ()
{
    CGFloat _maxHeight;
}
@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *img = [UIImage imageNamed:@"u496"];
//    [img stretchableImageWithLeftCapWidth:20 topCapHeight:50];
    self.view.backgroundColor = [UIColor colorWithPatternImage:img];
    [self setNavigation_my];
    [self setTopView];
    [self settViews];
}


- (void)setNavigation_my {
    MarketingNavigationView *backView = [[MarketingNavigationView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, TopSafeAreaHeight) withTitleString:@"我的会员" withTitleDirection:NaviTitleDirectionMiddle withNaviColor:kNavigationViewBGColor];
    
    [self.view addSubview:backView];
    __weak typeof(self) weakSelf = self;
    [backView setBackActionBlock:^{
        
        [weakSelf backAction_my];
        
    }];
}
- (void)backAction_my {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setTopView {
    
    MyTopView *topView = [[[UINib nibWithNibName:@"MyTopView" bundle:nil] instantiateWithOwner:nil options:nil] lastObject];
    topView.y = TopSafeAreaHeight;
    topView.width = kScreenWidth;
    
    [self.view addSubview:topView];
    _maxHeight = CGRectGetMaxY(topView.frame);
}

- (void)settViews {
    
    UIView *linView_top = [[UIView alloc] initWithFrame:CGRectMake(0, _maxHeight, kScreenWidth, 1.0)];
    linView_top.backgroundColor = [UIColor blackColor];
    [self.view addSubview:linView_top];
    _maxHeight = CGRectGetMaxY(linView_top.frame);
    NSArray *dataArr = @[@{@"image":@"u503",
                           @"title":@"资料管理"
                           },
                         @{@"image":@"u508",
                           @"title":@"我的订单"
                           },
                         @{@"image":@"u515",
                           @"title":@"我的特权"
                           },
                         @{@"image":@"u558",
                           @"title":@"我的客服"
                           }];
    CGFloat margin = 20.0f;
    CGFloat btnWidth = 50.0f;
    CGFloat btnW = (CGFloat)(kScreenWidth - margin * (dataArr.count + 1))/dataArr.count;
    for (int i = 0; i < dataArr.count; i ++) {
        
        UIButton *topbtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        topbtn.frame = CGRectMake(0, _maxHeight + margin, btnWidth, btnWidth);
        topbtn.tag = 30000 + i;
        [topbtn addTarget:self action:@selector(topBtnAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [topbtn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        [topbtn setImage:[UIImage imageNamed:dataArr[i][@"image"]] forState:(UIControlStateNormal)];
        [self.view addSubview:topbtn];

        UILabel *titleL = [[UILabel alloc] initWithFrame:CGRectMake(margin + i * (btnW + margin), CGRectGetMaxY(topbtn.frame) + 10.0, btnW, 20.0)];
        topbtn.centerX = titleL.centerX;
        titleL.text = dataArr[i][@"title"];
        titleL.textAlignment = NSTextAlignmentCenter;
        titleL.font = [UIFont systemFontOfSize:15.0];
        [self.view addSubview:titleL];
        if (i == dataArr.count - 1) {
            _maxHeight = CGRectGetMaxY(titleL.frame);

        }
    }
    
    UIView *linView_bottom = [[UIView alloc] initWithFrame:CGRectMake(0, _maxHeight + margin, kScreenWidth, 1.0)];
    linView_bottom.backgroundColor = [UIColor blackColor];
    [self.view addSubview:linView_bottom];
    
}

- (void)topBtnAction:(UIButton *)sender {
    NSInteger index = sender.tag - 30000;
    
    if (index == 0) {
        // 管理
    }
    if (index == 1) {
        // 订单
        OrderViewController *orderVC = [[OrderViewController alloc] init];
        [self.navigationController pushViewController:orderVC animated:YES];
    }
    if (index == 2) {
        // 特权
        MyPrivilegeViewController *orderVC = [[MyPrivilegeViewController alloc] init];
        [self.navigationController pushViewController:orderVC animated:YES];
    }
    if (index == 3) {
        // 客服
    }
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
