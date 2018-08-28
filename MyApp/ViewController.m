//
//  ViewController.m
//  MyApp
//
//  Created by ming on 2018/5/22.
//  Copyright © 2018年 ming. All rights reserved.
//

#import "ViewController.h"
#import "Tools.h"
#import "PersonModel.h"
#import "UILabel+Color.h"
#import "NextController.h"
#import "UIResponder+Routor.h"

@interface ViewController ()<UIResponderStandardEditActions>


@property (nonatomic,strong)UIButton *alpayBtn;

@property (nonatomic,strong)UIButton *wxBtn;

@property (nonatomic,strong)UIButton *commpltBtn;

@property (nonatomic,strong)UIButton *selectBtn;

@property(nonatomic,assign)NSInteger selectIndex;

@property (nonatomic,strong)NSDictionary *eventProxy;

@property (nonatomic ,assign) int i;
@property (nonatomic ,assign) int number;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"到货";
    self.eventProxy = [NSDictionary new];
    self.view.backgroundColor = [UIColor whiteColor];
     UILabel *label = [[UILabel alloc] init];
     [label setCloudox:@"123456"];
    
    [self.view addSubview:label];
    
    NSLog(@"~~~~~~~~`:%@",label.cloudox);
    
    UIImageView *alipayIMG = [JDTools allocImageView:Frame(10, GineY(100), 100, 40)image:[UIImage imageNamed:@"alipay233"]];
    [self.view addSubview:alipayIMG];
    
    [UIView animateWithDuration:0.1 delay:1
         usingSpringWithDamping:0.5
          initialSpringVelocity:1.0
                        options:UIViewAnimationOptionCurveEaseIn  animations:^{
        
    } completion:^(BOOL finished) {
        
    }];
    

    
 [self creatView];
}
#pragma mark - event response
//响应事件时：
- (void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo{
    
    // 如果需要让事件继续往上传递，则调用下面的语句
//    NSInvocation *invocation = eventName;//= self.eventStrategy[eventName];
//    [invocation setArgument:&userInfo atIndex:2];
//    [invocation invoke];
    
    
    NSLog(@"eventName%@",eventName);
    
    [super routerEventWithName:eventName userInfo:nil];
    
}


- (void)creatView{
    
//    UILabel *alpayLab =[JDTools allocLabel:@"支付宝支付" font:JDFont(16)
//                                 textColor:[UIColor orangeColor]
//                                     frame:Frame(10, GineY(100), 100, 16)
//                             textAlignment:NSTextAlignmentLeft];
//    [self.view addSubview:alpayLab];
//    UILabel *wxLab =[JDTools allocLabel:@"微信支付" font:JDFont(16)
//                              textColor:[UIColor orangeColor]
//                                  frame:Frame(10,ViewBelow(alpayLab)+20, 100, 16)
//                          textAlignment:NSTextAlignmentLeft];
//    [self.view addSubview:wxLab];
    
    UIImageView *alipayIMG = [JDTools allocImageView:Frame(10, GineY(100), 100, 40)image:[UIImage imageNamed:@"alipay233"]];
    [self.view addSubview:alipayIMG];
    
    UIImageView *wxPlayIMG = [JDTools allocImageView:Frame(10,ViewBelow(alipayIMG)+20, 100, 40)image:[UIImage imageNamed:@"wechatpay233"]];
    [self.view addSubview:wxPlayIMG];
    
    _alpayBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _alpayBtn .frame = Frame(ViewRight(alipayIMG)+20, 0, GineX(40), GineY(40));;
    _alpayBtn.centerY = alipayIMG.centerY;
    [_alpayBtn setImage:[UIImage imageNamed:@"selected_default"] forState:UIControlStateNormal];
    [_alpayBtn setImage:[UIImage imageNamed:@"selected_cart"] forState:UIControlStateSelected];
    [_alpayBtn addTarget:self action:@selector(pay:) forControlEvents:UIControlEventTouchUpInside];
    _alpayBtn.tag = 10;
    [self.view addSubview:_alpayBtn];
    
    
    _wxBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _wxBtn .frame = Frame(ViewRight(wxPlayIMG)+20, 0, GineX(40), GineY(40));
    _wxBtn.centerY = wxPlayIMG.centerY;
    [_wxBtn setImage:[UIImage imageNamed:@"selected_default"] forState:UIControlStateNormal];
    [_wxBtn setImage:[UIImage imageNamed:@"selected_cart"] forState:UIControlStateSelected];
    [_wxBtn addTarget:self action:@selector(pay:) forControlEvents:UIControlEventTouchUpInside];
    _wxBtn.tag = 11;
    [self.view addSubview:_wxBtn];
    
    
    
    _commpltBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _commpltBtn .frame = Frame(10, ViewBelow(wxPlayIMG)+30, ScreenWidth -20, GineY(40));
    [_commpltBtn setTitle:@"支付" forState:UIControlStateNormal];
    [_commpltBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _commpltBtn.backgroundColor = [UIColor orangeColor];
    _commpltBtn.layer.masksToBounds = YES;
    _commpltBtn.layer.cornerRadius = 5;
    [_commpltBtn addTarget:self action:@selector(commit:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_commpltBtn];
    
    
}

- (void)pay:(UIButton *)sender{
    
    [self.navigationController pushViewController:[NextController new] animated:YES];
    

    _selectIndex = sender.tag;
    
}
- (void)commit:(UIButton *)sender{
    
    NSLog(@"~~~selextIndex%ld",_selectIndex);
    if (_selectIndex !=10 &&_selectIndex !=11) {
        
        return   JDAlert(@"请选择支付方式");
    }
    if (_selectIndex ==10) {
        
        JDAlert(@"支付宝支付");
        
        [self alipaPayWay];
    }else{
        
        JDAlert(@"微信支付");
        [self wxPayWay];
    }
    
    
}
- (void)alipaPayWay{
                   //http://192.168.1.119:8080/wubangyi/AliPay/pay
    NSString *url =@"http://192.168.1.119:8080/wubangyi/AliPay/pay";
    [NetWorkConnection getURL:url param:nil Success:^(id responseObject, BOOL success) {
        if (success ==true) {
            
            NSString * str = responseObject[@"payInfo"];
            
            // NOTE: 调用支付结果开始支付    Scheme:支付宝是通过这个白名单返回应用的
            [[AlipaySDK defaultService] payOrder:str fromScheme:AlipayUrlSchems callback:^(NSDictionary *resultDic)
             {
                 if ([resultDic[@"resultStatus"] integerValue] == 9000){
                     [[JDAlertView sharedAlert]createTip:@"支付成功"];
                     
                 }else{
                     [[JDAlertView sharedAlert]createTip:@"支付失败"];
                 }
                 
             }];
            
        }
       
    } fail:^(NSError *error) {
        
    }];
    
    
    
    
    
}

- (void)wxPayWay{
    
    NSString *url =@"http://192.168.1.119:8080/wubangyi/WxPay/pay";
    [NetWorkConnection getURL:url param:nil Success:^(id responseObject, BOOL success) {
        //if ([responseObject[@"Status"]isEqualToString:@"success"]) {
        if (success ==true) {
            
            NSDictionary *dataDcit=(NSDictionary *) responseObject;
            NSMutableString *stamp  = [dataDcit objectForKey:@"timestamp"];
            PayReq* request             = [[PayReq alloc] init];
            request.partnerId           = [dataDcit objectForKey:@"partnerid"];
            request.prepayId            = [dataDcit objectForKey:@"prepayid"];
            request.nonceStr            = [dataDcit objectForKey:@"noncestr"];
            request.timeStamp           = stamp.intValue;
            request.package             = [dataDcit objectForKey:@"package"];
            request.sign                = [dataDcit objectForKey:@"sign"];
            
            //调起微信客户端 支付
            [WXApi sendReq:request];
            
        }
        
        //}
        
    } fail:^(NSError *error) {
        JDAlert(@"请求失败");
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
