//
//  NSString+StringHeight.h
//  e-RoadWiFi
//
//  Created by 沈震 on 16/9/23.
//  Copyright © 2016年 16wifi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (StringHeight)

/**
 *  计算文本的高度
 *
 *  @param font  字体
 *  @param width 固定的宽度
 *
 *  @return 高度
 */
- (CGFloat)heightWithLabelFont:(UIFont *)font withLabelWidth:(CGFloat)width;

/**
 *  计算文本的宽度
 *
 *  @param font 字体
 *
 *  @return 宽度
 */
- (CGFloat)widthWithLabelFont:(UIFont *)font;

@end
