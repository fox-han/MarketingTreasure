//
//  PrepaidViewController.m
//  MarketingTreasure
//
//  Created by hanwenguang on 2018/3/15.
//  Copyright © 2018年 hanwenguang. All rights reserved.
//

#import "PrepaidViewController.h"

@interface PrepaidViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    CGFloat _imgHeight;
}
@property (nonatomic, strong) UITableView *tableView;


@property (nonatomic, copy) NSArray *tableStrArr;

@end

@implementation PrepaidViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _imgHeight = 0;
    [self setNavigation_pre];
    [self setTableViewAction_pre];
}

- (void)setNavigation_pre {
    MarketingNavigationView *backView = [[MarketingNavigationView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, TopSafeAreaHeight) withTitleString:@"会员充值" withTitleDirection:NaviTitleDirectionMiddle withNaviColor:kNavigationViewBGColor];
    
    [self.view addSubview:backView];
    __weak typeof(self) weakSelf = self;
    [backView setBackActionBlock:^{
        
        [weakSelf backAction_pre];
        
    }];
}
- (void)backAction_pre {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setTableViewAction_pre {
    
    _tableStrArr = @[@{@"title":@"消费8折，单单有礼", @"des":@"充值满1000元即可享受银牌会员权益", @"image":@"u1081", @"money":@"1000元"},
                     @{@"title":@"消费75折，积分翻倍", @"des":@"充值满2000元即可享受金牌会员权益", @"image":@"u535", @"money":@"2000元"},
                     @{@"title":@"消费7折，爱奇艺免费畅看一年", @"des":@"充值满2000元即可享受白金会员权益", @"image":@"u1107", @"money":@"5000元"}];
    
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, TopSafeAreaHeight, kScreenWidth, kScreenHeight - TopSafeAreaHeight) style:(UITableViewStyleGrouped)];
    _tableView.backgroundColor = [UIColor colorWithHexString:@"eff3fa"];
    _tableView.rowHeight = 142;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [UIView new];
    [_tableView registerNib:[UINib nibWithNibName:@"TestTableViewCell" bundle:nil] forCellReuseIdentifier:@"identi_cell_pre"];
    [self.view addSubview:_tableView];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *identy = @"identi_cell_pre";
    
    TestTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identy];
    if (!cell) {
        cell = [[[UINib nibWithNibName:@"TestTableViewCell" bundle:nil] instantiateWithOwner:nil options:nil] lastObject];

        cell.width = kScreenWidth;
        cell.height = 142;
    }
    
    cell.preDict = _tableStrArr[indexPath.section];
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
