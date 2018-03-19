//
//  IntegralViewController.m
//  MarketingTreasure
//
//  Created by hanwenguang on 2018/3/18.
//  Copyright © 2018年 hanwenguang. All rights reserved.
//

#import "IntegralViewController.h"
#import "IntegDetailViewController.h"

@interface IntegralViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *tableStrArr;

@end

@implementation IntegralViewController
- (NSMutableArray *)tableStrArr {
    if (!_tableStrArr) {
        _tableStrArr = [NSMutableArray new];
    }
    return _tableStrArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kBGViewBackCOlor;
    [self setNavigation_myInteg];
    [self setDataModel];
    [self setTableViewAction_myin];
}

- (void)setNavigation_myInteg {
    MarketingNavigationView *backView = [[MarketingNavigationView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, TopSafeAreaHeight) withTitleString:@"积分明细" withTitleDirection:NaviTitleDirectionMiddle withNaviColor:kNavigationViewBGColor];
    
    [self.view addSubview:backView];
    __weak typeof(self) weakSelf = self;
    [backView setBackActionBlock:^{
        
        [weakSelf backAction_myin];
        
    }];
}
- (void)backAction_myin {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setDataModel {
    NSArray *dataArr = @[@{@"title":@"1000积分",
                           @"des":@"充值活动",
                           @"image":@"u349",
                           @"content":@"赠送时间: 2018-03-07 12:00:00",
                           @"state":@"0",
                           @"integal":@""
                           },
                         @{@"title":@"200积分",
                           @"des":@"兑换100M流量",
                           @"image":@"u360",
                           @"content":@"赠送时间: 2018-03-07 12:00:00",
                           @"state":@"1",
                           @"integal":@""
                           },
                         @{@"title":@"400积分",
                           @"des":@"兑换爱奇艺月卡",
                           @"image":@"u360",
                           @"content":@"赠送时间: 2018-03-07 12:00:00",
                           @"state":@"1",
                           @"integal":@""
                           }];
    for (NSDictionary *dict in dataArr) {
        IntegralModel *model = [[IntegralModel alloc] initWithDictionary:dict];
        [self.tableStrArr addObject:model];
    }
}


- (void)setTableViewAction_myin {
    
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, TopSafeAreaHeight, kScreenWidth, kScreenHeight - TopSafeAreaHeight) style:(UITableViewStyleGrouped)];
    _tableView.backgroundColor = [UIColor colorWithHexString:@"eff3fa"];
    _tableView.rowHeight = 108.0f;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [UIView new];
    [self.view addSubview:_tableView];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *identy = @"identi_cell_inte";
    
    IntegralTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identy];
    if (!cell) {
        cell = [[[UINib nibWithNibName:@"IntegralTableViewCell" bundle:nil] instantiateWithOwner:nil options:nil] firstObject];
        
        cell.width = kScreenWidth;
    }
    
    cell.model = _tableStrArr[indexPath.section];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.tableStrArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.0001;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    IntegDetailViewController *inteDTVC = [[IntegDetailViewController alloc] init];
    [self.navigationController pushViewController:inteDTVC animated:YES];
    
    
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
