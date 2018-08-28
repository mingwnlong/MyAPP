//
//  UILabel+Color.m
//  MyApp
//
//  Created by ming on 2018/8/7.
//  Copyright © 2018年 ming. All rights reserved.
//

#import "UILabel+Color.h"
#import <objc/runtime.h>

@implementation UILabel (Color)

//定义常亮  必须是C语言字符串
static char  *CloudoxKey = "CloudoxKey";

- (void)setCloudox:(NSString *)cloudox{
    /*
     objc_AssociationPolicy参数使用的策略：
     
     OBJC_ASSOCIATION_ASSIGN;            //assign策略
     OBJC_ASSOCIATION_COPY_NONATOMIC;    //copy策略
     OBJC_ASSOCIATION_RETAIN_NONATOMIC;  // retain策略
     
     OBJC_ASSOCIATION_RETAIN;
     OBJC_ASSOCIATION_COPY;
     */
    /*
     关联方法：
     objc_setAssociatedObject(id object, const void *key, id value, objc_AssociationPolicy policy);
     参数：
     * id object 给哪个对象的属性赋值
     const void *key 属性对应的key
     id value  设置属性值为value
     objc_AssociationPolicy policy  使用的策略，是一个枚举值，和copy，retain，assign是一样的，手机开发一般都选择NONATOMIC
     */
    
    objc_setAssociatedObject(self, CloudoxKey, cloudox, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    
}
- (NSString *)cloudox{
    
    return objc_getAssociatedObject(self, CloudoxKey);
}


@end
