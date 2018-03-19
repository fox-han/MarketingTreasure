//
//  ActivityViewController.m
//  MarketingTreasure
//
//  Created by hanwenguang on 2018/3/14.
//  Copyright © 2018年 hanwenguang. All rights reserved.
//

#import "ActivityViewController.h"

@interface ActivityViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    CGFloat _imgHeight;
}
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, copy) NSArray *tableImgArr;

@property (nonatomic, copy) NSArray *tableStrArr;

@end

@implementation ActivityViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    _imgHeight = 0;
    [self setNavigation_GIFT];
    [self setTableViewAction_gift];
}

- (void)setNavigation_GIFT {
    MarketingNavigationView *backView = [[MarketingNavigationView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, TopSafeAreaHeight) withTitleString:@"最新活动" withTitleDirection:NaviTitleDirectionMiddle withNaviColor:kNavigationViewBGColor];
    
    [self.view addSubview:backView];
    __weak typeof(self) weakSelf = self;
    [backView setBackActionBlock:^{
        
        [weakSelf backAction_gift];
        
    }];
}
- (void)backAction_gift {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setTableViewAction_gift {
    
    _tableStrArr = @[@"充值送礼，100%中奖", @"会员积分，永久有效，超值兑换", @"9999个免单机会，能免则免", @"VIP充值，享受更多折扣，折上折"];
    
    self.tableImgArr = @[@"u307", @"u315", @"u319", @"u317"];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, TopSafeAreaHeight + 10, kScreenWidth, kScreenHeight - TopSafeAreaHeight) style:(UITableViewStylePlain)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [UIView new];
    [self.view addSubview:_tableView];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *identy = @"identi_cell_g";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identy];
    UIImage *img = [UIImage imageNamed:_tableImgArr[indexPath.row]];

    if (img.size.width < kScreenWidth) {
        
        _imgHeight = img.size.height * (float)(img.size.width / kScreenWidth);
    }else {
        _imgHeight = img.size.height * (float)(kScreenWidth / img.size.width);
    }
    UIImageView *imgView;
    UILabel *label;
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identy];
        imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, _imgHeight)];
        imgView.userInteractionEnabled = YES;
        [cell.contentView addSubview:imgView];
        
        label = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(imgView.frame), kScreenWidth - 40.0, 30.0)];
        label.userInteractionEnabled = YES;
        label.textAlignment = NSTextAlignmentLeft;
        label.textColor = [UIColor blackColor];
        [cell.contentView addSubview:label];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    imgView.image = img;

    label.text = _tableStrArr[indexPath.row];

   
    
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tableImgArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return _imgHeight + 50.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 20.0f;
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
