//
//  NextView.m
//  MyApp
//
//  Created by ming on 2018/8/13.
//  Copyright © 2018年 ming. All rights reserved.
//

#import "NextView.h"

@implementation NextView

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
     
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(80, 80, 50, 50);
        
        button.backgroundColor = [UIColor groupTableViewBackgroundColor];
        
        [button addTarget:self action:@selector(resopn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
    return self;
}
-(void)resopn:(UIButton *)sender
{
    //发送事件时：
    [self routerEventWithName:@"点击了" userInfo:nil];
    
        NSLog(@"发送事件");
    
    
}



@end
