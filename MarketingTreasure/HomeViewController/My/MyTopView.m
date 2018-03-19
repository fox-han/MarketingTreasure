//
//  MyTopView.m
//  MarketingTreasure
//
//  Created by hanwenguang on 2018/3/17.
//  Copyright © 2018年 hanwenguang. All rights reserved.
//

#import "MyTopView.h"
#import "PaymentCodeViewController.h"
#import "PayRecordsViewController.h"
#import "CouponsViewController.h"
#import "IntegralViewController.h"


@interface MyTopView ()
{
    
}
@property (weak, nonatomic) IBOutlet UIButton *qrCode;

@property (weak, nonatomic) IBOutlet UIButton *cardBalance;

@property (weak, nonatomic) IBOutlet UIButton *cardIntegral;

@property (weak, nonatomic) IBOutlet UIButton *coupons;

@property (weak, nonatomic) IBOutlet UIImageView *BGImgView;

@end


@implementation MyTopView

- (void)awakeFromNib {
    [super awakeFromNib];

    self.backgroundColor = [UIColor clearColor];
    UIImage *img = [UIImage imageNamed:@"u527"];
    CGFloat promtValue = 0;
    if (img.size.width < kScreenWidth) {
        promtValue = (float)(img.size.width / kScreenWidth);
    }else {
        promtValue = (float)(kScreenWidth / img.size.width);
    }
    _qrCode.frame = CGRectMake(kScreenWidth - 10 - 60 * promtValue - 60 * promtValue, 70 * promtValue + 20, 60 * promtValue, 60 * promtValue);
    
    _BGImgView.frame = CGRectMake(20, 20, kScreenWidth - 40, img.size.height * promtValue);
    _BGImgView.layer.cornerRadius = 10.0f;
    _BGImgView.layer.masksToBounds = YES;
    _cardBalance.frame = CGRectMake((20 + 65) * promtValue, (200) * promtValue + 20, 180 * promtValue, 130 * promtValue);
    
    _cardIntegral.frame = CGRectMake(CGRectGetMaxX(_cardBalance.frame) + 20 , (200) * promtValue + 20, 180 * promtValue, 130 * promtValue);
//
    _coupons.frame = CGRectMake(CGRectGetMaxX(_cardIntegral.frame) + 20, (200) * promtValue + 20, 180 * promtValue, 130 * promtValue);
    
}


- (IBAction)qrCodeA:(UIButton *)sender {
    PaymentCodeViewController *orderVC = [[PaymentCodeViewController alloc] init];
    [self.viewController.navigationController pushViewController:orderVC animated:YES];
}

- (IBAction)cardBalance:(UIButton *)sender {
    PayRecordsViewController *pareVC = [[PayRecordsViewController alloc] init];
    [self.viewController.navigationController pushViewController:pareVC animated:YES];
}

- (IBAction)cardIntegralA:(UIButton *)sender {
    IntegralViewController *pareVC = [[IntegralViewController alloc] init];
    [self.viewController.navigationController pushViewController:pareVC animated:YES];
}

- (IBAction)couponsA:(UIButton *)sender {
    
    CouponsViewController *couVC = [[CouponsViewController alloc] init];
    [self.viewController.navigationController pushViewController:couVC animated:YES];

}




@end
