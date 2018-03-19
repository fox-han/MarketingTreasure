//
//  CouponsViewController.m
//  MarketingTreasure
//
//  Created by hanwenguang on 2018/3/18.
//  Copyright © 2018年 hanwenguang. All rights reserved.
//

#import "CouponsViewController.h"
#import "CouponsTableViewCell.h"


@interface CouponsViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    CGFloat _maxHeight;
    UIButton *_selectBtn;
    UIView *_selectLineView;
}
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, copy) NSArray *tableStrArr;
@end

@implementation CouponsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHexString:@"eff3fa"];
    
    [self setNavigation_cou];
    [self setTopBtnsAction_co];
    [self setTableViewAction_co];
}



- (void)setNavigation_cou {
    MarketingNavigationView *backView = [[MarketingNavigationView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, TopSafeAreaHeight) withTitleString:@"会员充值" withTitleDirection:NaviTitleDirectionMiddle withNaviColor:kNavigationViewBGColor];
    
    [self.view addSubview:backView];
    __weak typeof(self) weakSelf = self;
    [backView setBackActionBlock:^{
        
        [weakSelf backAction_cou];
        
    }];
}
- (void)backAction_cou {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setTopBtnsAction_co {
    
    NSArray *topTitleArr = @[@"可使用", @"已使用", @"已过期"];
    CGFloat leftMargin = 20.0;
    CGFloat btnW = (kScreenWidth - 3)/topTitleArr.count;
    for (int i = 0; i < topTitleArr.count; i ++) {
        UIButton *btnT = [UIButton buttonWithType:UIButtonTypeCustom];
        btnT.frame = CGRectMake(i * btnW + i, leftMargin + TopSafeAreaHeight, btnW, 50.0);
        [btnT setTitle:topTitleArr[i] forState:(UIControlStateNormal)];
        [btnT setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        btnT.titleLabel.font = [UIFont boldSystemFontOfSize:18];
        btnT.tag = 5000 + i;
        [btnT setTitleColor:kNavigationViewBGColor forState:(UIControlStateSelected)];
        btnT.highlighted = NO;
        [btnT addTarget:self action:@selector(topBtnActoin_co:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.view addSubview:btnT];
        
        UIView *linViewVer = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(btnT.frame), 0, 1, btnT.height - leftMargin)];
        linViewVer.backgroundColor = [UIColor blackColor];
        linViewVer.centerY = btnT.centerY;
        [self.view addSubview:linViewVer];
        
        if (i == 0) {
            UIView *linView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(btnT.frame), btnT.width - 20.0, 2.0)];
            linView.backgroundColor = kNavigationViewBGColor;
            linView.centerX = btnT.centerX;
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
- (void)topBtnActoin_co:(UIButton *)sender {
    if (sender == _selectBtn) {
        return;
    }
    NSInteger index = sender.tag - 5000;
    
    if (index == 0) {
        _tableStrArr = @[@{@"image":@"u251",
                           @"state":@"0"},
                         @{@"image":@"u251",
                           @"state":@"0"}];
        
    }else if (index == 1) {
        _tableStrArr = @[];
        
    }else if (index == 2) {
        _tableStrArr = @[];
        
    }
    [self.tableView reloadData];
    
    _selectBtn.selected = NO;
    
    sender.selected = YES;
    
    _selectBtn = sender;
    
    _selectLineView.centerX = sender.centerX;
    
}


- (void)setTableViewAction_co {
    
    _tableStrArr = @[@{@"image":@"u251",
                       @"state":@"0"},
                     @{@"image":@"u251",
                       @"state":@"0"}];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, _maxHeight, kScreenWidth, kScreenHeight - TopSafeAreaHeight) style:(UITableViewStyleGrouped)];
    _tableView.backgroundColor = [UIColor colorWithHexString:@"eff3fa"];
//    _tableView.rowHeight = 105.0f;
    _tableView.tableHeaderView.height = 20.0f;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [UIView new];
    //    [_tableView registerNib:[UINib nibWithNibName:@"OrderTableViewCell" bundle:nil] forCellReuseIdentifier:@"identi_cell_order"];
    [self.view addSubview:_tableView];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *identy = @"identi_cell_cou";
    
    CouponsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identy];
    if (!cell) {
        cell = [[[UINib nibWithNibName:@"CouponsTableViewCell" bundle:nil] instantiateWithOwner:nil options:nil] firstObject];
        
        cell.width = kScreenWidth;
    }
    if (self.tableStrArr.count > 0) {
        cell.couponsDict = _tableStrArr[indexPath.section];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.tableStrArr.count;
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
