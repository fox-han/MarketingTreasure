//
//  MTBaseModel.m
//  MarketingTreasure
//
//  Created by hanwenguang on 2018/3/18.
//  Copyright © 2018年 hanwenguang. All rights reserved.
//

#import "MTBaseModel.h"

@implementation MTBaseModel
- (id)initWithDictionary:(NSDictionary*)dic {
    
    if (self = [super init]) {
        
        [self setAttributes:dic];
    }
    return self;
}

//为model中的属性赋值的方法 --> 设置set方法
- (void)setAttributes:(NSDictionary*)dic{
    
    //1.设置key和属性名相同的变量
    //将字典中的数据取出填充至model对象上
    for (NSString *key in dic) {
        //2.拼接各个属性的 set方法名
        NSString *a = [[key substringToIndex:1] uppercaseString];
        NSString *methodName = [NSString stringWithFormat:@"set%@%@:",a,[key substringFromIndex:1]];
        
        //3.将字符串转换成方法 获得各个属性的set 方法
        SEL method = NSSelectorFromString(methodName);
        
        //4.判断是否响应此方法
        if ([self respondsToSelector:method]) {
            
            //一些非线程调用（NSObject的Category方法）即在当前线程执行，注意它们会阻塞当前线程（包括UI线程）：
            //            [self performSelector:method withObject:[dic objectForKey:key]];
            [self performSelectorOnMainThread:method withObject:[dic objectForKey:key] waitUntilDone:[NSThread isMainThread]];
        }
    }
    //5.设置特殊属性名的set方法名 设置key和属性名不同的变量
    for (NSString *key in self.map) {
        
        NSString *methodName = [self.map objectForKey:key];
        
        SEL method = NSSelectorFromString(methodName);
        
        if ([self respondsToSelector:method]) {
            /*
             [self performSelectorOnMainThread:<#(SEL)#> withObject:<#(id)#> waitUntilDone:<#(BOOL)#>]
             在主线程中运行方法，wait表示是否阻塞这个方法的调用，如果为YES则等待主线程中运行方法结束。一般可用于在子线程中调用UI方法。
             */
            [self performSelectorOnMainThread:method withObject:[dic objectForKey:key] waitUntilDone:[NSThread isMainThread]];
        }
    }
}
@end
