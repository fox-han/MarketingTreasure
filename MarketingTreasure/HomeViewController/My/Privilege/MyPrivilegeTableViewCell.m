//
//  MyPrivilegeTableViewCell.m
//  MarketingTreasure
//
//  Created by hanwenguang on 2018/3/18.
//  Copyright © 2018年 hanwenguang. All rights reserved.
//

#import "MyPrivilegeTableViewCell.h"

@interface MyPrivilegeTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@property (weak, nonatomic) IBOutlet UILabel *titleL;

@property (weak, nonatomic) IBOutlet UILabel *imgDes;

@end


@implementation MyPrivilegeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setMyPivilegeDict:(NSDictionary *)myPivilegeDict {
    
    _myPivilegeDict = myPivilegeDict;
    
    _imgView.image = [UIImage imageNamed:_myPivilegeDict[@"image"]] ;
    _titleL.text = _myPivilegeDict[@"title"];
    _imgDes.text = _myPivilegeDict[@"des"];
    
    
    
    
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
