//
//  MyPrivilegeViewController.m
//  MarketingTreasure
//
//  Created by hanwenguang on 2018/3/18.
//  Copyright © 2018年 hanwenguang. All rights reserved.
//

#import "MyPrivilegeViewController.h"
#import "MyPrivilegeTableViewCell.h"


@interface MyPrivilegeViewController ()<UITableViewDelegate, UITableViewDataSource>
{
   
}
@property (nonatomic, strong) UITableView *tableView;


@property (nonatomic, copy) NSArray *tableStrArr;
@end

@implementation MyPrivilegeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHexString:@"eff3fa"];

    [self setNavigation_myPri];
    [self setTableViewAction_myPri];
    
}
- (void)setNavigation_myPri {
    MarketingNavigationView *backView = [[MarketingNavigationView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, TopSafeAreaHeight) withTitleString:@"我的会员" withTitleDirection:NaviTitleDirectionMiddle withNaviColor:kNavigationViewBGColor];
    
    [self.view addSubview:backView];
    __weak typeof(self) weakSelf = self;
    [backView setBackActionBlock:^{
        
        [weakSelf backAction_myPri];
        
    }];
}
- (void)backAction_myPri {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)setTableViewAction_myPri {
    
    _tableStrArr = @[@{@"title":@"充值满1000元立即享8折优惠",
                       @"des":@"储值",
                       @"image":@"u853",
                       },
                     @{@"title":@"消费送积分",
                       @"des":@"积分",
                       @"image":@"u349",
                       },
                     @{@"title":@"店铺优惠券定期推送",
                       @"des":@"优惠券",
                       @"image":@"u871",
                       },
                     @{@"title":@"爱奇艺季卡免费看",
                       @"des":@"爱奇艺",
                       @"image":@"u435",
                       }];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, TopSafeAreaHeight, kScreenWidth, kScreenHeight - TopSafeAreaHeight) style:(UITableViewStyleGrouped)];
    _tableView.backgroundColor = [UIColor colorWithHexString:@"eff3fa"];
    _tableView.rowHeight = 128.0f;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [UIView new];
    [self.view addSubview:_tableView];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *identy = @"identi_cell_provi";
    
    MyPrivilegeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identy];
    if (!cell) {
        cell = [[[UINib nibWithNibName:@"MyPrivilegeTableViewCell" bundle:nil] instantiateWithOwner:nil options:nil] firstObject];
        
        cell.width = kScreenWidth;
    }
    
    cell.myPivilegeDict = _tableStrArr[indexPath.section];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.tableStrArr.count;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 40.0f)];
    view.backgroundColor = [UIColor clearColor];
    if (section == 0) {
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 0, 80.0, 40.0)];
        label.text = @"权益说明";
        label.textColor = kNavigationViewBGColor;
        label.textAlignment = NSTextAlignmentLeft;
        [view addSubview:label];
        
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth - 20 - 10, 10, 20, 20)];
        imgView.image = [UIImage imageNamed:@"u848"];
        [view addSubview:imgView];
        
        UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        rightBtn.frame = CGRectMake(kScreenWidth - imgView.width - 10 - 60, 0, 60, 40);
        [rightBtn addTarget:self action:@selector(btnActionW) forControlEvents:(UIControlEventTouchUpInside)];
        [rightBtn setTitle:@"等级说明" forState:(UIControlStateNormal)];
        [rightBtn setTitleColor:kNavigationViewBGColor forState:(UIControlStateNormal)];
        rightBtn.titleLabel.font = [UIFont systemFontOfSize:14.0];
        [view addSubview:rightBtn];
    }
    
    return view;
}
- (void)btnActionW {
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.0001;
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
