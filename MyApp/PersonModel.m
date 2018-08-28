
//
//  PersonModel.m
//  MyApp
//
//  Created by ming on 2018/8/7.
//  Copyright © 2018年 ming. All rights reserved.
//

#import "PersonModel.h"

@implementation PersonModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    
    return @{
             // 模型属性: JSON key, MJExtension 会自动将 JSON 的 key 替换为你模型中需要的属性
             @"ID":@"id",
             @"descrip":@"description",
             @"address":@"address.province",
             @"dogName":@"address.family[2].dog"
      
             };

}
+ (NSDictionary *)mj_objectClassInArray{
    
    return @{
             // 模型属性: JSON key, MJExtension 会自动将 JSON 的 key 替换为你模型中需要的属性
             @"users":@"User"
             };
}

+ (NSString *)mj_replacedKeyFromPropertyName121:(NSString *)propertyName
{
    // propertyName 是你属性名, 你把属性名格式化成对应字典中 key, 返回就可以了
    
//    NSMutableString *key = [NSMutableString string];
//    // 遍历propertyName的所有字符
//    for (NSInteger i = 0; i < propertyName.length; i++) {
//        unichar c = [propertyName characterAtIndex:i];
//        if (c >= 'A' && c <= 'Z') { // 大写字母
//            [key appendFormat:@"_%c", c + ('a' - 'A')];
//        } else { // 非大写字母
//            [key appendFormat:@"%c", c];
//        }
//    }
//    return key;
    // 其实 MJ的框架里已经实现了这个方法, 你只需一句代码:请跟着我心中默默念一句: 卧槽...
    return [propertyName mj_underlineFromCamel];
}

@end
