//
//  HomeViewController.m
//  MarketingTreasure
//
//  Created by hanwenguang on 2018/3/14.
//  Copyright © 2018年 hanwenguang. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()<SDCycleScrollViewDelegate, UITableViewDelegate, UITableViewDataSource>
{
    CGFloat _maxViewY;
    
    
}
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, copy) NSArray *tableImgArr;

@property (nonatomic, copy) NSArray *tableStrArr;

@end

@implementation HomeViewController

//- (NSMutableArray *)tabelImgArr {
//    if (!_tableImgArr) {
//        _tableImgArr = [NSMutableArray new];
//    }
//    return _tableImgArr;
//}
CGFloat _imgHeight = 0;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.hidden = YES;
    [self setNavigation];
    [self scrollViewTopView];
    [self setFourBtn];
    [self setTableViewAction];
    
}

- (void)setNavigation {
    MarketingNavigationView *backView = [[MarketingNavigationView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, TopSafeAreaHeight) withTitleString:@"华夏良子" withTitleDirection:NaviTitleDirectionMiddle withNaviColor:kNavigationViewBGColor];
    
    [self.view addSubview:backView];
    __weak typeof(self) weakSelf = self;
    [backView setBackActionBlock:^{
       
        [weakSelf backAction];
        
    }];
}

- (void)scrollViewTopView {
    UIImage *image_1 = [UIImage imageNamed:@"u32"];
    UIImage *image_2 = [UIImage imageNamed:@"u34"];


    SDCycleScrollView *topViewScroll = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, TopSafeAreaHeight, kScreenWidth, 150.0) delegate:self placeholderImage:[UIImage imageNamed:@"u32"]];
    
    [topViewScroll setClickItemOperationBlock:^(NSInteger currentIndex) {
                
    }];
    topViewScroll.localizationImageNamesGroup = @[image_1, image_2];
    topViewScroll.showPageControl = YES;
    topViewScroll.autoScroll = YES;
    [self.view addSubview:topViewScroll];
    _maxViewY = CGRectGetMaxY(topViewScroll.frame);
    // 左上角
    UIImage *img = [UIImage imageNamed:@"logo_u36"];
    CGFloat promt = 0.5;

    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, img.size.width * promt, img.size.height * promt)];
    imgView.image = img;
    [topViewScroll addSubview:imgView];
}



- (void)setFourBtn {
    UIView *btnView = [[UIView alloc] initWithFrame:CGRectMake(0, _maxViewY, kScreenWidth, 100)];
    btnView.backgroundColor = [UIColor whiteColor];
    NSArray *btnStringArr = @[@"活动", @"充值", @"订单", @"我的"];
    NSArray *btnImgArr = @[@"u131", @"u135", @"u137", @"u133"];
    CGFloat topMargin = 10.0f;
    CGFloat btnWidth = (kScreenWidth - 60.0 - 30.0 * 3) / btnStringArr.count;
    for (int i = 0; i < btnStringArr.count; i ++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(30.0 + i * (btnWidth + 30.0), topMargin, btnWidth, btnWidth);
        btn.tag = 9999 + i;
        [btn setImage:[UIImage imageNamed:btnImgArr[i]] forState:(UIControlStateNormal)];
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [btnView addSubview:btn];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, btnWidth + topMargin, btnWidth, 30.0)];
        label.centerX = btn.centerX;
        label.text = btnStringArr[i];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor blackColor];
        [btnView addSubview:label];
    }
    CGRect newRect = btnView.frame;
    newRect.size.height = btnWidth + 30.0 + topMargin;
    btnView.frame = newRect;
    _maxViewY = CGRectGetMaxY(btnView.frame);
    [self.view addSubview:btnView];
}

- (void)btnAction:(UIButton *)sender {
    if (sender.tag - 9999 == 0) {
        // 活动
        ActivityViewController *acVC = [[ActivityViewController alloc] init];
        [self.navigationController pushViewController:acVC animated:YES];
    }else if (sender.tag - 9999 == 1) {
        // 充值
        PrepaidViewController *preVC = [[PrepaidViewController alloc] init];
        [self.navigationController pushViewController:preVC animated:YES];

    }else if (sender.tag - 9999 == 2) {
        // 订单
        OrderViewController *orderVC = [[OrderViewController alloc] init];
        [self.navigationController pushViewController:orderVC animated:YES];
    }else if (sender.tag - 9999 == 3) {
        // 我的
        MyViewController *orderVC = [[MyViewController alloc] init];
        [self.navigationController pushViewController:orderVC animated:YES];
    }
}

- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setTableViewAction {
    
    _tableStrArr = @[@"见面有礼，新人专享", @"充值有礼，惊喜不断", @"会员续费，倾情回归"];
    
    self.tableImgArr = @[@"u45", @"u47", @"u49"];
    CGFloat topMargin = 10.0f;
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, _maxViewY + topMargin, kScreenWidth, kScreenHeight - _maxViewY) style:(UITableViewStylePlain)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [UIView new];
    [self.view addSubview:_tableView];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *identy = @"identi_cell";

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
    return _imgHeight + 30.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    GiftViewController *actitvityVC = [[GiftViewController alloc] init];
    [self.navigationController pushViewController:actitvityVC animated:YES];
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
