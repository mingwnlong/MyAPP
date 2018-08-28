//
//  JDAlertView.h
//  HaoJuDian
//
//  Created by ming on 16/7/19.
//  Copyright © 2016年 陈义德. All rights reserved.
//
/*
 
   封装 提示框
 */
#import <Foundation/Foundation.h>

@interface JDAlertView : NSObject

@property(strong, nonatomic) UILabel *tipLabel;

+ (JDAlertView *)sharedAlert;

- (void)createTip:(NSString *)tipStr;

@end
