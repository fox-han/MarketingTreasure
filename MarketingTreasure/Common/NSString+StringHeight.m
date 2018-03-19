//
//  NSString+StringHeight.m
//  e-RoadWiFi
//
//  Created by 沈震 on 16/9/23.
//  Copyright © 2016年 16wifi. All rights reserved.
//

#import "NSString+StringHeight.h"

@implementation NSString (StringHeight)

/**
 *  计算文本的高度
 *
 *  @param font  字体
 *  @param width 固定的宽度
 *
 *  @return 高度
 */
- (CGFloat)heightWithLabelFont:(UIFont *)font withLabelWidth:(CGFloat)width {
    
    CGFloat retHeight = 0;
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, width, 10000)];
    label.text = self;
    label.numberOfLines = 0;
    label.font = font;
    //让label通过文字设置size
    [label sizeToFit];
    //获取label 的size
    CGSize size = label.frame.size;
    retHeight = size.height;
    /*
    if (self.length == 0) {
        height = 0;
    } else {
        
        // 字体
        NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:18.f]};
        if (font) {
            attribute = @{NSFontAttributeName: font};
        }
        
        // 尺寸
        CGSize retSize = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                            options:
                          NSStringDrawingTruncatesLastVisibleLine |
                          NSStringDrawingUsesLineFragmentOrigin |
                          NSStringDrawingUsesFontLeading
                                         attributes:attribute
                                            context:nil].size;
        
        height = retSize.height;
    }
     */
    return retHeight;
    
    
}
/**
 *  计算文本的宽度
 *
 *  @param font 字体
 *
 *  @return 宽度
 */
- (CGFloat)widthWithLabelFont:(UIFont *)font {
    CGFloat retHeight = 0;
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 1000, 0)];
    label.text = self;
    label.numberOfLines = 0;
    label.font = font;
    //让label通过文字设置size
    [label sizeToFit];
    //获取label 的size
    CGSize size = label.frame.size;
    retHeight = size.width;
    /*
    //返回出去
    return size;
    if (self.length == 0) {
        retHeight = 0;
    } else {
        
        // 字体
        NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:18.f]};
        if (font) {
            attribute = @{NSFontAttributeName: font};
        }
        
        // 尺寸
        CGSize retSize = [self boundingRectWithSize:CGSizeMake(MAXFLOAT, 0)
                                            options:
                          NSStringDrawingTruncatesLastVisibleLine |
                          NSStringDrawingUsesLineFragmentOrigin |
                          NSStringDrawingUsesFontLeading
                                         attributes:attribute
                                            context:nil].size;
        
        retHeight = retSize.width;
    }
    */
    
    return retHeight;
}

@end
