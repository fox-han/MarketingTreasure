//
//  PaymentCodeViewController.m
//  MarketingTreasure
//
//  Created by hanwenguang on 2018/3/18.
//  Copyright © 2018年 hanwenguang. All rights reserved.
//

#import "PaymentCodeViewController.h"

@interface PaymentCodeViewController ()

@end

@implementation PaymentCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHexString:@"eff3fa"];

    [self setNavigation_pay];
    [self setImgView];
}

- (void)setNavigation_pay {
    MarketingNavigationView *backView = [[MarketingNavigationView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, TopSafeAreaHeight) withTitleString:@"付款码" withTitleDirection:NaviTitleDirectionMiddle withNaviColor:kNavigationViewBGColor];
    
    [self.view addSubview:backView];
    __weak typeof(self) weakSelf = self;
    [backView setBackActionBlock:^{
        
        [weakSelf backAction_pay];
        
    }];
}
- (void)backAction_pay {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)setImgView {
    CGFloat imgHeight = 0;
    UIImage *img = [UIImage imageNamed:@"u569"];
    if (img.size.width < kScreenWidth) {
        imgHeight = img.size.height * (float)(img.size.width / kScreenWidth);
    }else {
        imgHeight = img.size.height * (float)(kScreenWidth / img.size.width);
    }
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, TopSafeAreaHeight, kScreenWidth, imgHeight)];
    imgView.image = img;
    [self.view addSubview:imgView];
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
