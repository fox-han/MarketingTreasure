//
//  IntegralTableViewCell.m
//  MarketingTreasure
//
//  Created by hanwenguang on 2018/3/18.
//  Copyright © 2018年 hanwenguang. All rights reserved.
//

#import "IntegralTableViewCell.h"


@interface IntegralTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *desLabel;

@property (weak, nonatomic) IBOutlet UILabel *contentlabel;

@property (weak, nonatomic) IBOutlet UILabel *integalLabel;



@end


@implementation IntegralTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setModel:(IntegralModel *)model {
    _model = model;
    
    _imgView.image = [UIImage imageNamed:_model.image];
    
    _titleLabel.text = _model.title;
    
    _desLabel.text = _model.des;
    
    _contentlabel.text = _model.content;

    _integalLabel.text = _model.integal;
    
    NSInteger index = [_model.state integerValue];
    if (index == 0) {
        _titleLabel.textColor = [UIColor blackColor];
    }else if (index == 1) {
        _titleLabel.textColor = [UIColor orangeColor];
    }else if (index == 2) {
        _desLabel.textColor = [UIColor redColor];
    }
    
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
