//
//  CouponsTableViewCell.m
//  MarketingTreasure
//
//  Created by hanwenguang on 2018/3/18.
//  Copyright © 2018年 hanwenguang. All rights reserved.
//

#import "CouponsTableViewCell.h"

@interface CouponsTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation CouponsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setCouponsDict:(NSDictionary *)couponsDict {
    _couponsDict = couponsDict;
    
    NSInteger index = [_couponsDict[@"state"] integerValue];
    
    if (index == 0) {
        
    }else if (index == 1) {
        
    }else {
        
    }
    _imgView.image = [UIImage imageNamed:_couponsDict[@"image"]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
