//
//  JDAlertView.m
//  HaoJuDian
//
//  Created by ming on 16/7/19.
//  Copyright © 2016年 陈义德. All rights reserved.
//

#import "JDAlertView.h"
#define TIP_ALERT_FONTSIZE 15.0

#define TIP_ALERT_WIDTH 200.0

#define TIP_ALERT_PADDING_WIDTH 30.0

#define TIP_ALERT_PADDING_HEIGHT 10.0

@interface JDAlertView ()
@property(strong, nonatomic) NSTimer *timer;

@end
@implementation JDAlertView

+(JDAlertView *)sharedAlert
{
    static JDAlertView *tipAlert;
    
    static dispatch_once_t  onceToken;
    dispatch_once(&onceToken, ^{
        
        
       tipAlert = [[self alloc] init];
        
    });

    return tipAlert;
}

-(void)createTip:(NSString *)tipStr
{

    [self reset];
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    CGSize size = [self calculateTextHeightWithTipString:tipStr andFontSize:TIP_ALERT_FONTSIZE];
    
    _tipLabel = [[UILabel alloc] init];
    
    [_tipLabel setWidth:size.width + TIP_ALERT_PADDING_WIDTH * 2];
    
    [_tipLabel setHeight:size.height + TIP_ALERT_PADDING_HEIGHT * 2];
    
    [_tipLabel setCenter:CGPointMake(ScreenWidth / 2, ScreenHeight / 2)];
    
    _tipLabel.text = tipStr;
    
    _tipLabel.textAlignment = NSTextAlignmentCenter;
    
    _tipLabel.font = JDFont(TIP_ALERT_FONTSIZE);
    
    _tipLabel.textColor = [UIColor whiteColor];
    
    _tipLabel.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
    
    _tipLabel.layer.masksToBounds = YES;
    
    _tipLabel.layer.cornerRadius = 5.0;
    
    _tipLabel.numberOfLines = 0;
    
    [window addSubview:_tipLabel];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(reset) userInfo:nil repeats:YES];


}


- (void)reset {
    
    [self.timer invalidate];
    
    [_tipLabel removeFromSuperview];
    
    _tipLabel = nil;
}


- (CGSize)calculateTextHeightWithTipString:(NSString *)tipStr andFontSize:(CGFloat)fontSize {
    
    NSDictionary * textDic = [NSDictionary dictionaryWithObjectsAndKeys:JDFont(fontSize), NSFontAttributeName, nil];
    
    CGRect rect = [tipStr boundingRectWithSize:CGSizeMake(TIP_ALERT_WIDTH, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:textDic context:nil];
    
    return rect.size;
}








@end
