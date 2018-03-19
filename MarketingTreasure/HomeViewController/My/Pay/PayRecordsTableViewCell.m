//
//  PayRecordsTableViewCell.m
//  MarketingTreasure
//
//  Created by hanwenguang on 2018/3/18.
//  Copyright © 2018年 hanwenguang. All rights reserved.
//

#import "PayRecordsTableViewCell.h"

@interface PayRecordsTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *leftImgView;

@property (weak, nonatomic) IBOutlet UILabel *title;

@property (weak, nonatomic) IBOutlet UILabel *desTitle;

@end


@implementation PayRecordsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setPayRecordsDict:(NSDictionary *)payRecordsDict {
    _payRecordsDict = payRecordsDict;
    
    _leftImgView.image = [UIImage imageNamed:_payRecordsDict[@"image"]];
    
    NSString *string = _payRecordsDict[@"textColor"];
    
    if ([string integerValue] == 0) {
        _title.textColor = [UIColor blackColor];
    }else {
        _title.textColor = [UIColor orangeColor];
    }
    
    _title.text = _payRecordsDict[@"title"];
    
    _desTitle.text = _payRecordsDict[@"time"];
    
    
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
