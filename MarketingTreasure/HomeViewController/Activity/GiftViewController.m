//
//  GiftViewController.m
//  MarketingTreasure
//
//  Created by hanwenguang on 2018/3/15.
//  Copyright © 2018年 hanwenguang. All rights reserved.
//

#import "GiftViewController.h"

@interface GiftViewController ()
{
    UIView *_showView;
}
@end

@implementation GiftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigation_act];
    [self setImgeView];
}

- (void)setNavigation_act {
    MarketingNavigationView *backView = [[MarketingNavigationView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, TopSafeAreaHeight) withTitleString:@"春节大派送" withTitleDirection:NaviTitleDirectionLeft withNaviColor:[UIColor colorWithHexString:@"333333"]];
    
    [self.view addSubview:backView];
    __weak typeof(self) weakSelf = self;
    [backView setBackActionBlock:^{
        
        [weakSelf backAction_act];
        
    }];
}
- (void)backAction_act {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setImgeView {
    UIImage *image = [UIImage imageNamed:@"九宫格_u163"];
    CGFloat promt = 0;
    CGFloat imgH = 0;
    if (image.size.width < kScreenWidth) {
        promt = (float)(image.size.width / kScreenWidth);
        imgH = image.size.height * promt;
        
    }else {
        promt = (float)(kScreenWidth / image.size.width);
        imgH = image.size.height * promt;
    }
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, TopSafeAreaHeight, kScreenWidth, imgH)];
    imgView.image = image;
    imgView.userInteractionEnabled = YES;
    [self.view addSubview:imgView];
    
    UIButton *btnView = [UIButton buttonWithType:UIButtonTypeCustom];
    btnView.frame = CGRectMake(190.0 * promt, 370.0 * promt, 120.0 * promt, 120.0 * promt);
    btnView.backgroundColor = [UIColor clearColor];
    [btnView addTarget:self action:@selector(btnActionClick) forControlEvents:(UIControlEventTouchUpInside)];
    [imgView addSubview:btnView];
    
}

- (void)btnActionClick {
    if (!_showView) {
        [self setShowAlertView];
    }
    
}

- (void)setShowAlertView {
    CGFloat margin = 10.0f;
    UIView *showBGView = [[UIView alloc] initWithFrame:CGRectMake(30, TopSafeAreaHeight + 50.0, kScreenWidth - 60.0, 100)];
    _showView = showBGView;
    showBGView.layer.borderWidth = .8f;
    showBGView.layer.borderColor = [UIColor blackColor].CGColor;
    showBGView.layer.cornerRadius = 5.0f;
    showBGView.layer.masksToBounds = YES;
    showBGView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:showBGView];
    
    UILabel *topLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 30.0, showBGView.width, 30.0)];
    topLabel.text = @"恭喜您中奖了";
    topLabel.font = [UIFont boldSystemFontOfSize:22.0];
    topLabel.textColor = [UIColor blackColor];
    topLabel.textAlignment = NSTextAlignmentCenter;
    [showBGView addSubview:topLabel];
    
    UILabel *topLabel_2 = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(topLabel.frame) + margin, showBGView.width, 30.0)];
    topLabel_2.text = @"100M流量";
    topLabel_2.font = [UIFont boldSystemFontOfSize:22.0];
    topLabel_2.textColor = [UIColor blackColor];
    topLabel_2.textAlignment = NSTextAlignmentCenter;
    [showBGView addSubview:topLabel_2];
    
    UITextField *tfView = [[UITextField alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(topLabel_2.frame) + margin, showBGView.width - 40.0, 44.0)];
    tfView.placeholder = @"请输入您的手机号领奖";
    tfView.keyboardType = UIKeyboardTypePhonePad;
    tfView.layer.borderColor = [UIColor blackColor].CGColor;
    tfView.layer.borderWidth = 0.5;
    [showBGView addSubview:tfView];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(tfView.frame) + margin, showBGView.width, 1.0)];
    lineView.backgroundColor = [UIColor blackColor];
    [showBGView addSubview:lineView];
    
    UIButton *btnView = [UIButton buttonWithType:UIButtonTypeCustom];
    btnView.frame = CGRectMake(0, CGRectGetMaxY(lineView.frame) + margin, showBGView.width, 60.0);
    [btnView setTitle:@"立即领取" forState:(UIControlStateNormal)];
    [btnView setTitleColor:kNavigationViewBGColor forState:(UIControlStateNormal)];
    btnView.backgroundColor = [UIColor whiteColor];
    [btnView addTarget:self action:@selector(btnActionClick_get) forControlEvents:(UIControlEventTouchUpInside)];
    [showBGView addSubview:btnView];
    
    CGRect rect = showBGView.frame;
    rect.size.height = CGRectGetMaxY(btnView.frame);
    showBGView.frame = rect;
    
}
- (void)btnActionClick_get {
    [_showView removeFromSuperview];
    _showView = nil;
    GetFinishViewController *getVC = [[GetFinishViewController alloc] init];
    [self.navigationController pushViewController:getVC animated:YES];
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
