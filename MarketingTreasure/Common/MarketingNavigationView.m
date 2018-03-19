//
//  MarketingNavigationView.m
//  MarketingTreasure
//
//  Created by hanwenguang on 2018/3/14.
//  Copyright © 2018年 hanwenguang. All rights reserved.
//

#import "MarketingNavigationView.h"

@interface MarketingNavigationView ()
{
    UIColor *_color;
    
    NSInteger _direction;
}

@property (nonatomic, copy) NSString *titleString;
// 标题
@property (nonatomic, assign) CGFloat titleWidth;
// 返回
@property (nonatomic, strong) UIButton *backBtn;

@end

@implementation MarketingNavigationView

- (instancetype)initWithFrame:(CGRect)frame withTitleString:(NSString *)titleString withTitleDirection:(NSInteger)direction withNaviColor:(UIColor *)color
{
    CGRect selfFrame = frame;
    selfFrame.size.height = TopSafeAreaHeight;
    if (self = [super initWithFrame:selfFrame])  {
        _color = color;
        _direction = direction;
        self.titleString = titleString;
        [self setNavigationViewAction];
    }
    return self;
}
- (void)setBackGroundColor:(BOOL)backGroundColor {
    if (backGroundColor) {
        _barView.backgroundColor = [UIColor whiteColor];
        _title.textColor = [UIColor colorWithHexString:@"999999"];
        [_backBtn setImage:[UIImage imageNamed:@"u120"] forState:UIControlStateNormal];
    }else {
        
    }
}
- (void)setNavigationViewAction {
    _barView = [[UIView alloc] initWithFrame:self.bounds];
    _barView.userInteractionEnabled = YES;
    _barView.backgroundColor = _color;
    [self addSubview:_barView];
    
    //返回
    _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _backBtn.frame = CGRectMake(kBackBtnXValue, TopStatusHeight+2, kBackBtnWidth, 40);
    [_backBtn setImage:[UIImage imageNamed:@"return"] forState:(UIControlStateNormal)];

    _backBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    [_barView addSubview:_backBtn];
    CGFloat btnWidth = 60.0f;
    if (self.titleString == nil || [self.titleString isEqualToString:@""]) {
        //
    }else {
        CGFloat titleWidth = [self widthForlabel:self.titleString font:kTitleFontSize(22.0)];
        if (titleWidth > kScreenWidth - 80) {
            titleWidth = kScreenWidth - 80;
        }
        //标题
        _title = [[UILabel alloc] initWithFrame:(CGRectMake(CGRectGetMaxX(_backBtn.frame) + 40.0, TopStatusHeight, titleWidth, 44))];
        _title.text = self.titleString;
        _title.textColor = [UIColor whiteColor];
        _title.font = kTitleFontSize(22.0);
        _title.textAlignment = NSTextAlignmentLeft;
        _title.centerY = _backBtn.centerY;
        if (_direction == NaviTitleDirectionLeft) {
//            btnWidth += titleWidth;
        }else if (_direction == NaviTitleDirectionMiddle) {
            _title.centerX = self.centerX;
        }
        [_barView addSubview:_title];
//        btnWidth = self.title.width + 30.0;
    }
    
    _backClearBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _backClearBtn.frame = CGRectMake(0, TopStatusHeight, btnWidth, 44);
    [_backClearBtn addTarget:self action:@selector(backNaviAction) forControlEvents:(UIControlEventTouchUpInside)];
    _backClearBtn.backgroundColor = [UIColor clearColor];
    [self addSubview:_backClearBtn];
}

- (void)backNaviAction {
    if (self.BackActionBlock) {
        self.BackActionBlock ();
    }
}

- (CGFloat)widthForlabel:(NSString *)string font:(UIFont *)font
{
    if (!string || [string isEqualToString:@""]) {
        return 0;
    }
    
    return [string boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size.width;
}

@end
