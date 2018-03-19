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

- (void)pushNewVC:(NSString *)index {
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    homeVC.oldOrNewUser = index;
    [self.navigationController pushViewController:homeVC animated:YES];
}

- (IBAction)homeVCAction:(UIButton *)sender {
    [self pushNewVC:@"1"];
}

- (IBAction)newUser:(id)sender {
    // 新客
    [self pushNewVC:@"0"];
}
- (IBAction)oldNoCard:(id)sender {
    // 老客（未办卡）
    [self pushNewVC:@"1"];
}

- (IBAction)olduserInstallmentNo:(id)sender {
    // 老客（办卡未分期)
    [self pushNewVC:@"1"];
}

- (IBAction)olduserInstallmented:(id)sender {
    // 老客（办卡已分期）
    [self pushNewVC:@"1"];
}
- (IBAction)olduserDue:(id)sender {
    // 老客（办卡未分期）即将到期
    [self pushNewVC:@"1"];
}

- (IBAction)olduserDueToHasIn:(id)sender {
    // 老客（办卡已分期）即将到期
    [self pushNewVC:@"1"];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
