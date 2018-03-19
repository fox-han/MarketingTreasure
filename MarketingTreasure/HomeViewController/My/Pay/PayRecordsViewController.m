//
//  PayRecordsViewController.m
//  MarketingTreasure
//
//  Created by hanwenguang on 2018/3/18.
//  Copyright © 2018年 hanwenguang. All rights reserved.
//

#import "PayRecordsViewController.h"
#import "PayRecordsTableViewCell.h"

@interface PayRecordsViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    
}
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, copy) NSArray *tableStrArr;
@end

@implementation PayRecordsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHexString:@"eff3fa"];
    
    [self setNavigation_re];
    [self setTableViewAction_re];
    
}
- (void)setNavigation_re {
    MarketingNavigationView *backView = [[MarketingNavigationView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, TopSafeAreaHeight) withTitleString:@"消费记录" withTitleDirection:NaviTitleDirectionMiddle withNaviColor:kNavigationViewBGColor];
    
    [self.view addSubview:backView];
    __weak typeof(self) weakSelf = self;
    [backView setBackActionBlock:^{
        
        [weakSelf backAction_re];
        
    }];
}
- (void)backAction_re {
    [self.navigationController popViewControllerAnimated:YES];
}




- (void)setTableViewAction_re {
    
    _tableStrArr = @[@{@"title":@"1000元",
                       @"time":@"充值时间:2018-03-07 12:00:00",
                       @"image":@"u799",
                       @"textColor":@"0"
                       },
                     @{@"title":@"200元",
                       @"time":@"消费时间:2018-03-07 12:00:00",
                       @"image":@"u360",
                       @"textColor":@"1"
                       },
                     @{@"title":@"300元",
                       @"time":@"消费时间:2018-03-07 12:00:00",
                       @"image":@"u360",
                       @"textColor":@"1"
                       }];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, TopSafeAreaHeight, kScreenWidth, kScreenHeight - TopSafeAreaHeight) style:(UITableViewStyleGrouped)];
    _tableView.backgroundColor = [UIColor colorWithHexString:@"eff3fa"];
    _tableView.rowHeight = 105.0f;
    _tableView.tableHeaderView.height = 20.0f;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [UIView new];
    //    [_tableView registerNib:[UINib nibWithNibName:@"OrderTableViewCell" bundle:nil] forCellReuseIdentifier:@"identi_cell_order"];
    [self.view addSubview:_tableView];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *identy = @"identi_cell_pay";
    
    PayRecordsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identy];
    if (!cell) {
        cell = [[[UINib nibWithNibName:@"PayRecordsTableViewCell" bundle:nil] instantiateWithOwner:nil options:nil] firstObject];
        
        cell.width = kScreenWidth;
    }
    
    cell.payRecordsDict = _tableStrArr[indexPath.section];
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
