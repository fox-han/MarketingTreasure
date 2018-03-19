//
//  OrderTableViewCell.m
//  MarketingTreasure
//
//  Created by hanwenguang on 2018/3/17.
//  Copyright © 2018年 hanwenguang. All rights reserved.
//

#import "OrderTableViewCell.h"

@interface OrderTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *leftImgView;

@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *desLabel;

@property (weak, nonatomic) IBOutlet UILabel *payState;

@end

/*
  @{@"title":@"", @"time":@"赠送时间:2018-03-03 12:20:00", @"image":@"u957", @"money":@"100M", @"payState":@"2"}
 */
@implementation OrderTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setOrderDict:(NSDictionary *)orderDict {
    _orderDict = orderDict;
    _leftImgView.image = [UIImage imageNamed:orderDict[@"image"]];
    _moneyLabel.text = _orderDict[@"money"];
    
    if (![_orderDict[@"title"] isEqualToString:@""]) {
        _titleLabel.text = _orderDict[@"title"];
        _desLabel.text = _orderDict[@"time"];
    }else {
        _titleLabel.text = _orderDict[@"time"];
    }
    
    if ([_orderDict[@"payState"] isEqualToString:@"0"]) {
        _payState.text = @"待支付";
    }else if ([_orderDict[@"payState"] isEqualToString:@"1"]) {
        _payState.text = @"已完成";
    }else if ([_orderDict[@"payState"] isEqualToString:@"2"]) {
        _payState.text = @"充值成功";
    }
    
    
    
}





- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
