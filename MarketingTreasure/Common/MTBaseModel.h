//
//  MTBaseModel.h
//  MarketingTreasure
//
//  Created by hanwenguang on 2018/3/18.
//  Copyright © 2018年 hanwenguang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTBaseModel : NSObject

- (id)initWithDictionary:(NSDictionary *)dic;

- (void)setAttributes:(NSDictionary *)dic;

@property (nonatomic,copy) NSDictionary *map;


@end
