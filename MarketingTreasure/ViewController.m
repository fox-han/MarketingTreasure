//
//  ViewController.m
//  MarketingTreasure
//
//  Created by hanwenguang on 2018/3/14.
//  Copyright © 2018年 hanwenguang. All rights reserved.
//

#import "ViewController.h"
#import "HomeViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)homeVCAction:(UIButton *)sender {
    
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    
    [self.navigationController pushViewController:homeVC animated:YES];
//    [self presentViewController:homeVC animated:YES completion:nil];
    
}

- (IBAction)newUser:(id)sender {
    // 新客
}
- (IBAction)oldNoCard:(id)sender {
    // 老客（未办卡）
}

- (IBAction)olduserInstallmentNo:(id)sender {
    // 老客（办卡未分期
}

- (IBAction)olduserInstallmented:(id)sender {
    // 老客（办卡已分期）
}
- (IBAction)olduserDue:(id)sender {
    // 老客（办卡未分期）即将到期
}

- (IBAction)olduserDueToHasIn:(id)sender {
    // 老客（办卡已分期）即将到期
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
