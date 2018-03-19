//
//  OrderDetailTableViewCell.m
//  MarketingTreasure
//
//  Created by hanwenguang on 2018/3/17.
//  Copyright © 2018年 hanwenguang. All rights reserved.
//

#import "OrderDetailTableViewCell.h"

@interface OrderDetailTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *leftTitle;

@property (weak, nonatomic) IBOutlet UILabel *rightDes;



@end

@implementation OrderDetailTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setOrderDDict:(NSDictionary *)orderDDict {
    _orderDDict = orderDDict;
    
    _leftTitle.text = _orderDDict[@"title"];
    _rightDes.text = _orderDDict[@"des"];
}





- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
