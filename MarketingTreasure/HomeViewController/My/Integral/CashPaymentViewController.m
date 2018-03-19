//
//  CashPaymentViewController.m
//  MarketingTreasure
//
//  Created by hanwenguang on 2018/3/18.
//  Copyright © 2018年 hanwenguang. All rights reserved.
//

#import "CashPaymentViewController.h"

@interface CashPaymentViewController ()<UITextFieldDelegate>
{
    UITextField *_textField;
}
@end

@implementation CashPaymentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigation_cash];
    [self setSubView];
}

- (void)setNavigation_cash {
    MarketingNavigationView *backView = [[MarketingNavigationView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, TopSafeAreaHeight) withTitleString:@"积分兑换" withTitleDirection:NaviTitleDirectionMiddle withNaviColor:kNavigationViewBGColor];
    
    [self.view addSubview:backView];
    __weak typeof(self) weakSelf = self;
    [backView setBackActionBlock:^{
        
        [weakSelf backAction_cash];
        
    }];
}
- (void)backAction_cash {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setSubView {
    
    CGFloat margin = 10.0f;
    UIView *bgView = [UIView new];
    bgView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bgView];
    
    
    UILabel *firstL = [[UILabel alloc] initWithFrame:CGRectMake(margin, 20, 100.0, 20.0)];
    firstL.text = @"充值号码：";
    firstL.textColor = [UIColor blackColor];
    firstL.font = [UIFont systemFontOfSize:17.0];
    [bgView addSubview:firstL];
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(firstL.frame) + 20.0, 0, 150, 30.0)];
    textField.centerY = firstL.centerY;
    textField.delegate = self;
    _textField = textField;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChang) name:UITextFieldTextDidChangeNotification object:nil];
    textField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    textField.layer.borderWidth = .8f;
    [bgView addSubview:textField];
    
    UIView *linView_bottom_1 = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(firstL.frame) + 20.0, kScreenWidth, 1.0)];
    linView_bottom_1.backgroundColor = [UIColor blackColor];
    [bgView addSubview:linView_bottom_1];
    
    UILabel *secondL = [[UILabel alloc] initWithFrame:CGRectMake(margin, CGRectGetMaxY(linView_bottom_1.frame) + 20.0, 100.0, 20.0)];
    secondL.text = @"兑换奖品：";
    secondL.textColor = [UIColor blackColor];
    secondL.font = [UIFont systemFontOfSize:17.0];
    [bgView addSubview:secondL];
    
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(secondL.frame) + 20.0, 0, 150, 20.0)];
    textLabel.centerY = secondL.centerY;
    textLabel.text = self.model.title;
    textLabel.textColor = [UIColor redColor];
    [bgView addSubview:textLabel];
    
    UIView *linView_bottom_2 = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(secondL.frame) + 20.0, kScreenWidth, 1.0)];
    linView_bottom_2.backgroundColor = [UIColor blackColor];
    [bgView addSubview:linView_bottom_2];
    
    UILabel *thirdL = [[UILabel alloc] initWithFrame:CGRectMake(margin, CGRectGetMaxY(linView_bottom_2.frame) + 20.0, 100.0, 20.0)];
    thirdL.text = @"支付积分：";
    thirdL.textColor = [UIColor blackColor];
    thirdL.font = [UIFont systemFontOfSize:17.0];
    [bgView addSubview:thirdL];
    
    UILabel *textLabel_3 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(thirdL.frame) + 20.0, 0, 150, 20.0)];
    textLabel_3.centerY = thirdL.centerY;
    textLabel_3.text = [NSString stringWithFormat:@"%@ %@", self.model.des, self.model.integal];
    textLabel_3.textColor = [UIColor orangeColor];
    [bgView addSubview:textLabel_3];
    
    UIView *linView_bottom_3 = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(thirdL.frame) + 20.0, kScreenWidth, 1.0)];
    linView_bottom_3.backgroundColor = [UIColor blackColor];
    [bgView addSubview:linView_bottom_3];
    
    bgView.frame = CGRectMake(0, 20 + TopSafeAreaHeight, kScreenWidth, CGRectGetMaxY(linView_bottom_3.frame));
    
    
    UIButton *payOK = [UIButton buttonWithType:UIButtonTypeCustom];
    payOK.frame = CGRectMake(margin * 2, kScreenHeight - 60.0, kScreenWidth - margin * 4, 40.0);
    [payOK addTarget:self action:@selector(payOKAction) forControlEvents:(UIControlEventTouchUpInside)];
    payOK.layer.cornerRadius = 5.0f;
    payOK.layer.masksToBounds = YES;
    payOK.backgroundColor = kNavigationViewBGColor;
    [payOK setTitle:@"确认支付" forState:(UIControlStateNormal)];
    payOK.titleLabel.font = [UIFont systemFontOfSize:20.0];
    [self.view addSubview:payOK];
    
}

- (void)payOKAction {
    if (_textField.text.length > 11 || _textField.text.length < 11) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        view.backgroundColor = [UIColor colorWithHexString:@"000000" withAlpha:.5f];
        UILabel *showAlert = [[UILabel alloc] initWithFrame:CGRectMake(40, 0, kScreenWidth - 80, 100)];
        showAlert.backgroundColor = [UIColor whiteColor];
        showAlert.textAlignment = NSTextAlignmentCenter;
        showAlert.layer.cornerRadius = 5.0f;
        showAlert.layer.masksToBounds = YES;
        showAlert.centerY = view.centerY - 50.0f;
        showAlert.text = @"请填写正确的手机号码！";
        showAlert.textColor = [UIColor blackColor];
        showAlert.font = [UIFont systemFontOfSize:18.0];
        [view addSubview:showAlert];
        
        [[UIApplication sharedApplication].keyWindow addSubview:view];
        [UIView animateWithDuration:2.0 animations:^{
            showAlert.alpha = 0;
        } completion:^(BOOL finished) {
            [view removeFromSuperview];
        }];
        return;
    }
    
    for (UIViewController *myVC in self.navigationController.viewControllers) {
        if ([myVC isKindOfClass:[MyViewController class]]) {
            [self.navigationController popToViewController:myVC animated:YES];
        }
    }
    
    
}

- (void)textChang {
//    if (_textField.text.length > 11 || _textField.text.length < 11) {
//        return;
//    }
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
