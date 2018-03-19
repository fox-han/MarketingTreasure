//
//  UIColor+ZSKNColor.h
//  ZSKRepositoryFrameWork
//
//  Created by hanwenguang on 17/6/28.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (ZSKNColor)

+ (UIColor *)colorWithHexString:(NSString *)hex;

+ (UIColor *)colorWithHexString:(NSString *)hex withAlpha:(CGFloat)alpha;


@end
