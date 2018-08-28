
//
//  UIResponder+Routor.m
//  MyApp
//
//  Created by ming on 2018/8/13.
//  Copyright © 2018年 ming. All rights reserved.
//

#import "UIResponder+Routor.h"


@implementation UIResponder (Routor)
- (void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo
{
    // 如果需要让事件继续往上传递，则调用下面的语句
    // [super routerEventWithName:eventName userInfo:userInfo];
    [[self nextResponder] routerEventWithName:eventName userInfo:userInfo];
}


@end
