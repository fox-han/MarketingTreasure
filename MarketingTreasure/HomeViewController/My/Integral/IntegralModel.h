//
//  IntegralModel.h
//  MarketingTreasure
//
//  Created by hanwenguang on 2018/3/18.
//  Copyright © 2018年 hanwenguang. All rights reserved.
//

#import "MTBaseModel.h"

@interface IntegralModel : MTBaseModel
/*
@"title":@"400积分",
@"des":@"兑换爱奇艺月卡",
@"image":@"u360",
@"content":@"赠送时间: 2018-03-07 12:00:00",
@"state":@"1",
@"integal":@"积分",
*/
@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *des;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, copy) NSString *state;

@property (nonatomic, copy) NSString *integal;



@end
