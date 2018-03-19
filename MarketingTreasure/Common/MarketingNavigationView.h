//
//  MarketingNavigationView.h
//  MarketingTreasure
//
//  Created by hanwenguang on 2018/3/14.
//  Copyright © 2018年 hanwenguang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, NaviTitleDirection) {
    /**
     *  left
     */
    NaviTitleDirectionLeft = 0,
    /**
     *  middle
     */
    NaviTitleDirectionMiddle
};

@interface MarketingNavigationView : UIView
/**
 *  返回点击事件
 */
@property (nonatomic, copy) void(^BackActionBlock)(void);

@property (nonatomic, strong) UIButton *backClearBtn;

@property (nonatomic, strong) UILabel *title;
/**
 *  背景色修改
 */
@property (nonatomic, assign) BOOL backGroundColor;

@property (nonatomic, strong) UIView *barView;

- (instancetype)initWithFrame:(CGRect)frame withTitleString:(NSString *)titleString withTitleDirection:(NSInteger)direction withNaviColor:(UIColor *)color;


@end
