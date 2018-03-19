
//
//  TestTableViewCell.m
//  MarketingTreasure
//
//  Created by hanwenguang on 2018/3/16.
//  Copyright © 2018年 hanwenguang. All rights reserved.
//

#import "TestTableViewCell.h"

@interface TestTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *leftImgView;

@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *desLabel;
@property (weak, nonatomic) IBOutlet UIImageView *rightImgView;

@end

@implementation TestTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setPreDict:(NSDictionary *)preDict {
    _preDict = preDict;
    
    _titleLabel.text = _preDict[@"title"];
    _moneyLabel.text = _preDict[@"money"];
    _desLabel.text = _preDict[@"des"];
    _rightImgView.image = [UIImage imageNamed:_preDict[@"image"]];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
