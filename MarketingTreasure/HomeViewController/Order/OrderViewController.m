//
//  OrderViewController.m
//  MarketingTreasure
//
//  Created by hanwenguang on 2018/3/16.
//  Copyright © 2018年 hanwenguang. All rights reserved.
//

#import "OrderViewController.h"
#import "OrderTableViewCell.h"
#import "OrderDetailViewController.h"

@interface OrderViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    CGFloat _maxHeight;
    UIButton *_selectBtn;
    UIView *_selectLineView;
}
@property (nonatomic, strong) UITableView *tableView;


@property (nonatomic, copy) NSArray *tableStrArr;

@end

@implementation OrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _maxHeight = 0;
    self.view.backgroundColor = [UIColor colorWithHexString:@"eff3fa"];
    [self setNavigation_order];
    [self setTopBtnsAction];
    [self setTableViewAction_order];
}

- (void)setNavigation_order {
    MarketingNavigationView *backView = [[MarketingNavigationView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, TopSafeAreaHeight) withTitleString:@"我的订单" withTitleDirection:NaviTitleDirectionMiddle withNaviColor:kNavigationViewBGColor];
    
    [self.view addSubview:backView];
    __weak typeof(self) weakSelf = self;
    [backView setBackActionBlock:^{
        
        [weakSelf backAction_order];
        
    }];
}
- (void)backAction_order {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setTopBtnsAction {
    
    NSArray *topTitleArr = @[@"全部", @"待支付", @"已完成"];
    CGFloat leftMargin = 20.0;
    CGFloat btnW = (kScreenWidth - 3)/topTitleArr.count;
    for (int i = 0; i < topTitleArr.count; i ++) {
        UIButton *btnT = [UIButton buttonWithType:UIButtonTypeCustom];
        btnT.frame = CGRectMake(i * btnW + i, leftMargin + TopSafeAreaHeight, btnW, 50.0);
        [btnT setTitle:topTitleArr[i] forState:(UIControlStateNormal)];
        [btnT setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        btnT.titleLabel.font = [UIFont boldSystemFontOfSize:18];
        btnT.tag = 1000 + i;
        [btnT setTitleColor:kNavigationViewBGColor forState:(UIControlStateSelected)];
        btnT.highlighted = NO;
        [btnT addTarget:self action:@selector(topBtnActoin:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.view addSubview:btnT];
        
        UIView *linViewVer = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(btnT.frame), 0, 1, btnT.height - leftMargin)];
        linViewVer.backgroundColor = [UIColor blackColor];
        linViewVer.centerY = btnT.centerY;
        [self.view addSubview:linViewVer];
        
        
        
        if (i == 0) {
            UIView *linView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(btnT.frame), btnT.width - 20.0, 2.0)];
            linView.backgroundColor = kNavigationViewBGColor;
            linView.centerX = btnT.centerX;
            linView.tag = 2000 + i;
            linView.hidden = YES;
            [self.view addSubview:linView];
            btnT.selected = YES;
            _selectBtn = btnT;
            linView.hidden = NO;
            _selectLineView = linView;
        }
        if (i == topTitleArr.count - 1) {
            _maxHeight = CGRectGetMaxY(btnT.frame);
        }
    }
    UIView *linView_bottom = [[UIView alloc] initWithFrame:CGRectMake(0, _maxHeight + 10.0, kScreenWidth, 1.0)];
    linView_bottom.backgroundColor = [UIColor blackColor];
    [self.view addSubview:linView_bottom];
    _maxHeight = CGRectGetMaxY(linView_bottom.frame);
    
}
- (void)setTableViewAction_order {
    
    _tableStrArr = @[@{@"title":@"首付:￥500，分期:￥500", @"time":@"下单时间:2018-03-07 12:00:00", @"image":@"u799", @"money":@"1000元", @"payState":@"0"},
                     @{@"title":@"首付:￥1000，分期:￥0", @"time":@"下单时间:2018-03-05 15:00:00", @"image":@"u799", @"money":@"1000元",  @"payState":@"1"},
                     @{@"title":@"", @"time":@"赠送时间:2018-03-03 12:20:00", @"image":@"u957", @"money":@"100M", @"payState":@"2"}];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, _maxHeight, kScreenWidth, kScreenHeight - _maxHeight) style:(UITableViewStyleGrouped)];
    _tableView.backgroundColor = [UIColor colorWithHexString:@"eff3fa"];
    _tableView.rowHeight = 142;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [UIView new];
//    [_tableView registerNib:[UINib nibWithNibName:@"OrderTableViewCell" bundle:nil] forCellReuseIdentifier:@"identi_cell_order"];
    [self.view addSubview:_tableView];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *identy = @"identi_cell_order";
    
    OrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identy];
    if (!cell) {
        cell = [[[UINib nibWithNibName:@"OrderTableViewCell" bundle:nil] instantiateWithOwner:nil options:nil] lastObject];
        
        cell.width = kScreenWidth;
//        cell.height = 142;
    }
    
    cell.orderDict = _tableStrArr[indexPath.section];
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
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    OrderDetailViewController *detailVC = [[OrderDetailViewController alloc] init];
    [self.navigationController pushViewController:detailVC animated:YES];
    
}

- (void)topBtnActoin:(UIButton *)sender {
    if (sender == _selectBtn) {
        return;
    }
    NSInteger index = sender.tag - 1000;
    
    if (index == 0) {
        _tableStrArr = @[@{@"title":@"首付:￥500，分期:￥500", @"time":@"下单时间:2018-03-07 12:00:00", @"image":@"u799", @"money":@"1000元", @"payState":@"0"},
                         @{@"title":@"首付:￥1000，分期:￥0", @"time":@"下单时间:2018-03-05 15:00:00", @"image":@"u799", @"money":@"1000元",  @"payState":@"1"},
                         @{@"title":@"", @"time":@"赠送时间:2018-03-03 12:20:00", @"image":@"u957", @"money":@"100M", @"payState":@"2"}];
    }else if (index == 1) {
        _tableStrArr = @[@{@"title":@"首付:￥500，分期:￥500", @"time":@"下单时间:2018-03-07 12:00:00", @"image":@"u799", @"money":@"1000元", @"payState":@"0"}];
    }else if (index == 2) {
        _tableStrArr = @[@{@"title":@"首付:￥1000，分期:￥0", @"time":@"下单时间:2018-03-05 15:00:00", @"image":@"u799", @"money":@"1000元",  @"payState":@"1"},
                         @{@"title":@"", @"time":@"赠送时间:2018-03-03 12:20:00", @"image":@"u957", @"money":@"100M", @"payState":@"2"}];
    }
    [self.tableView reloadData];
    
    _selectBtn.selected = NO;
    
    sender.selected = YES;
    
    _selectBtn = sender;
   
    _selectLineView.centerX = sender.centerX;
    
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
