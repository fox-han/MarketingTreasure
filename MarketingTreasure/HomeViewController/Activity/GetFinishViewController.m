//
//  GetFinishViewController.m
//  MarketingTreasure
//
//  Created by hanwenguang on 2018/3/14.
//  Copyright © 2018年 hanwenguang. All rights reserved.
//

#import "GetFinishViewController.h"

@interface GetFinishViewController ()
{
    CGFloat _maxViewY;
}
@end

@implementation GetFinishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setNavigation_get];
    [self setTopImgView];
}
- (void)setNavigation_get {
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, TopStatusHeight, 100, (TopSafeAreaHeight - TopStatusHeight))];
    titleLabel.centerX = self.view.centerX;
    titleLabel.text = @"充值有礼";
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.font = [UIFont systemFontOfSize:18];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:titleLabel];
    
    UIButton *topBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    topBtn.frame = CGRectMake(kScreenWidth - 60, TopStatusHeight, 60, (TopSafeAreaHeight - TopStatusHeight));
    [topBtn setTitle:@"完成" forState:(UIControlStateNormal)];
    [topBtn addTarget:self action:@selector(backAction) forControlEvents:(UIControlEventTouchUpInside)];

    [topBtn setTitleColor:kNavigationViewBGColor forState:(UIControlStateNormal)];
    [self.view addSubview:topBtn];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, TopSafeAreaHeight - 1, kScreenWidth, 1.0)];
    lineView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:lineView];
    _maxViewY = CGRectGetMaxY(lineView.frame);
}
- (void)backAction_get {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setTopImgView {
    CGFloat margin = 10.0;
    UIImage *image = [UIImage imageNamed:@"dasai_succ"];
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake((kScreenWidth - image.size.width)/2, _maxViewY + margin * 2, image.size.width, image.size.width)];
    imgView.image = image;
    [self.view addSubview:imgView];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(imgView.frame) + margin, kScreenWidth, 30.0)];
    titleLabel.centerX = self.view.centerX;
    titleLabel.text = @"提交成功";
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.font = [UIFont systemFontOfSize:18];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:titleLabel];
    
    NSArray *contentArr = @[@"您的订单已提交成功，如果24小时仍未到账", @"请致电运营商客服热线进行核实", @"移动用户请拔打 10086", @"联通用户请拨打 10010", @"电信用户请拔打 10000"];
    for (int i = 0; i < contentArr.count; i ++) {
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(titleLabel.frame) + 20.0 + i * 20, kScreenWidth, 20.0)];
        label.centerX = self.view.centerX;
        label.text = contentArr[i];
        label.textColor = [UIColor lightGrayColor];
        label.font = [UIFont systemFontOfSize:15];
        label.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:label];
        if (i == contentArr.count - 1) {
            _maxViewY = CGRectGetMaxY(label.frame);
        }
    }
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(30, _maxViewY + 10.0, kScreenWidth - 60, 44.0);
    [backBtn setTitle:@"返回" forState:(UIControlStateNormal)];
    backBtn.layer.cornerRadius = 5.0f;
    backBtn.layer.masksToBounds = YES;
    backBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    backBtn.backgroundColor = kNavigationViewBGColor;
    [backBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [backBtn addTarget:self action:@selector(backAction) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:backBtn];
    
    
}
- (void)backAction {
    
    for (UIViewController *vc in self.navigationController.viewControllers) {
        if ([vc isKindOfClass:[HomeViewController class]]) {
            
            [self.navigationController popToViewController:vc animated:YES];
        }
    }
    
}




/*
 您的订单已提交成功，如果24小时仍未到账
 请致电运营商客服热线进行核实
 移动用户请拔打 10086
 联通用户请拨打 10010
 电信用户请拔打 10000
 */


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
