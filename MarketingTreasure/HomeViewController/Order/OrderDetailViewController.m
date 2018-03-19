//
//  OrderDetailViewController.m
//  MarketingTreasure
//
//  Created by hanwenguang on 2018/3/17.
//  Copyright © 2018年 hanwenguang. All rights reserved.
//

#import "OrderDetailViewController.h"
#import "OrderDetailTableViewCell.h"



@interface OrderDetailViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    CGFloat _maxHeight;
    UIButton *_selectBtn;
    UIView *_selectLineView;
}
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, copy) NSArray *tableStrArr;

@end

@implementation OrderDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHexString:@"eff3fa"];

    [self setNavigation_orderD];
    [self setTableViewAction_orderD];

}
- (void)setNavigation_orderD {
    MarketingNavigationView *backView = [[MarketingNavigationView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, TopSafeAreaHeight) withTitleString:@"订单详情" withTitleDirection:NaviTitleDirectionMiddle withNaviColor:kNavigationViewBGColor];
    
    [self.view addSubview:backView];
    __weak typeof(self) weakSelf = self;
    [backView setBackActionBlock:^{
        
        [weakSelf backAction_orderD];
        
    }];
}
- (void)backAction_orderD {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setTableViewAction_orderD {

    _tableStrArr = @[@[@{@"title":@"充值账号：", @"des":@"158 8888 6666"},
                     @{@"title":@"充值金额：", @"des":@"￥1000"},
                     @{@"title":@"首付金额：", @"des":@"￥500"},
                     @{@"title":@"分期金额：", @"des":@"￥500"},
                     @{@"title":@"分期期数：", @"des":@"12"},
                     @{@"title":@"每期应还：", @"des":@"￥45.83"},
                     @{@"title":@"优惠金额：", @"des":@"￥50"}],
                     @[@{@"title":@"订单状态：", @"des":@"待支付"},
                       @{@"title":@"交易时间：", @"des":@"2018-03-07 12:00:00"},
                       @{@"title":@"订单编号：", @"des":@"201803071110000001"}]];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, TopSafeAreaHeight, kScreenWidth, kScreenHeight - TopSafeAreaHeight) style:(UITableViewStyleGrouped)];
    _tableView.backgroundColor = [UIColor colorWithHexString:@"eff3fa"];
    _tableView.rowHeight = 50.0f;
    _tableView.tableHeaderView.height = 20.0f;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [UIView new];
    //    [_tableView registerNib:[UINib nibWithNibName:@"OrderTableViewCell" bundle:nil] forCellReuseIdentifier:@"identi_cell_order"];
    [self.view addSubview:_tableView];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *identy = @"identi_cell_orderD";
    
    OrderDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identy];
    if (!cell) {
        cell = [[[UINib nibWithNibName:@"OrderDetailTableViewCell" bundle:nil] instantiateWithOwner:nil options:nil] firstObject];
        
        cell.width = kScreenWidth;
        
    }
    
    cell.orderDDict = _tableStrArr[indexPath.section][indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *dataArr = self.tableStrArr[section];
    return dataArr.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.tableStrArr.count;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

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
