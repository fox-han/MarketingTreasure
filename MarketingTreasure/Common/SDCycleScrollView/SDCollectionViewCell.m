//
//  SDCollectionViewCell.m
//  SDCycleScrollView
//
//  Created by aier on 15-3-22.
//  Copyright (c) 2015年 GSD. All rights reserved.
//


/*
 
 *********************************************************************************
 *
 * 🌟🌟🌟 新建SDCycleScrollView交流QQ群：185534916 🌟🌟🌟
 *
 * 在您使用此自动轮播库的过程中如果出现bug请及时以以下任意一种方式联系我们，我们会及时修复bug并
 * 帮您解决问题。
 * 新浪微博:GSD_iOS
 * Email : gsdios@126.com
 * GitHub: https://github.com/gsdios
 *
 * 另（我的自动布局库SDAutoLayout）：
 *  一行代码搞定自动布局！支持Cell和Tableview高度自适应，Label和ScrollView内容自适应，致力于
 *  做最简单易用的AutoLayout库。
 * 视频教程：http://www.letv.com/ptv/vplay/24038772.html
 * 用法示例：https://github.com/gsdios/SDAutoLayout/blob/master/README.md
 * GitHub：https://github.com/gsdios/SDAutoLayout
 *********************************************************************************
 
 */


#import "SDCollectionViewCell.h"
#import "UIView+SDExtension.h"

@implementation SDCollectionViewCell
{
    __weak UILabel *_titleLabel;
    __weak UILabel *_typeLabel;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupImageView];
        [self setupTitleLabel];
        [self setupTypeLabel];
    }
    
    return self;
}

- (void)setTitleLabelBackgroundColor:(UIColor *)titleLabelBackgroundColor
{
    _titleLabelBackgroundColor = titleLabelBackgroundColor;
    _titleLabel.backgroundColor = titleLabelBackgroundColor;
}

- (void)setTitleLabelTextColor:(UIColor *)titleLabelTextColor
{
    _titleLabelTextColor = titleLabelTextColor;
    _titleLabel.textColor = titleLabelTextColor;
}

- (void)setTitleLabelTextFont:(UIFont *)titleLabelTextFont
{
    _titleLabelTextFont = titleLabelTextFont;
    _titleLabel.font = titleLabelTextFont;
}

- (void)setTypeLabelBackgroundColor:(UIColor *)typeLabelBackgroundColor
{
    _typeLabelBackgroundColor = typeLabelBackgroundColor;
    _typeLabel.backgroundColor = _typeLabelBackgroundColor;
}

- (void)setTypeLabelTextColor:(UIColor *)typeLabelTextColor
{
    _typeLabelTextColor = typeLabelTextColor;
    _typeLabel.textColor = _typeLabelTextColor;
}

- (void)setTypeLabelTextFont:(UIFont *)typeLabelTextFont
{
    _titleLabelTextFont = typeLabelTextFont;
    _typeLabel.font = _titleLabelTextFont;
}



- (void)setupImageView
{
    UIImageView *imageView = [[UIImageView alloc] init];
    _imageView = imageView;
    _imageView.contentMode =UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:imageView];
}

- (void)setupTitleLabel
{
    UILabel *titleLabel = [[UILabel alloc] init];
    _titleLabel = titleLabel;
    _titleLabel.hidden = YES;
    [self.contentView addSubview:titleLabel];
}

- (void)setupTypeLabel
{
    UILabel *typeLabel = [[UILabel alloc] init];
    _typeLabel = typeLabel;
    _typeLabel.hidden = YES;
    _typeLabel.layer.borderColor = kUserNameBuleColor.CGColor;
    _typeLabel.layer.borderWidth = 1;
    _typeLabel.layer.cornerRadius = 5;
    _typeLabel.layer.masksToBounds = YES;
    _typeLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:typeLabel];
}

- (void)setTitle:(NSString *)title
{
    _title = [title copy];
    _titleLabel.text = [NSString stringWithFormat:@"   %@", title];
    if (_titleLabel.hidden) {
        _titleLabel.hidden = NO;
    }
}

//新增左侧
- (void)setType:(NSString *)type
{
    _type = [type copy];
    _typeLabel.text = type;
    if (_typeLabel.hidden) {
        _typeLabel.hidden = NO;
    }
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (self.onlyDisplayText) {
        _typeLabel.frame = CGRectMake(0, SYRealValue(8), SXRealValue(50), self.bounds.size.height-SYRealValue(16));
        _titleLabel.frame = CGRectMake(SXRealValue(50), 0, self.bounds.size.width-SXRealValue(60), self.bounds.size.height);
    } else {
        _imageView.frame = self.bounds;
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        CGFloat titleLabelW = self.sd_width;
        CGFloat titleLabelH = _titleLabelHeight;
        CGFloat titleLabelX = 0;
        CGFloat titleLabelY = self.sd_height - titleLabelH;
        _titleLabel.frame = CGRectMake(titleLabelX, titleLabelY, titleLabelW, titleLabelH);
    }
}

@end
