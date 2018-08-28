//
//  Tools.h
//  MyApp
//
//  Created by ming on 2018/5/22.
//  Copyright © 2018年 ming. All rights reserved.
//

#ifndef Tools_h
#define Tools_h

#import <AlipaySDK/AlipaySDK.h>
static NSString *const  AlipayUrlSchems  = @"MyApp";

//合作身份者id，以2088开头的16位纯数字
static NSString *const  AppID       = @"2018052260202230";

//收款支付宝账号  -->商家唯一标识符  默认不传
static NSString *const  SellerID       = @"";

//商户私钥，自助生成
static NSString *const  PartnerPrivKey = @"";

//支付宝支付结果回调页面
static NSString *const  AliPay_Back_URL = @"";

//支付宝端统一创建订单接口
static NSString *const   CreatAlipay_Order  =@"";


/*
 alipay_sdk=alipay-sdk-java-3.0.52.ALL&app_id=2017081108146028&biz_content=%7B%22out_trade_no%22%3A%2220180520010101001%22%2C%22product_code%22%3A%22QUICK_MSECURITY_PAY%22%2C%22subject%22%3A%22XXX%E6%94%AF%E4%BB%98%E8%AE%A2%E5%8D%95%22%2C%22timeout_express%22%3A%2230m%22%2C%22total_amount%22%3A%22888.88%22%7D&charset=UTF-8&format=json&method=alipay.trade.app.pay¬ify_url=http%3A%2F%2Flocalhost%3A8080%2Fwubangyi%2Fapp%2Fali%2FpayNotify&sign=E7QGacjyLkNpVG7MUp6jOloHzKVgE7LahuhimsyMNOSzCr1UbTCa%2FYdL4wnK%2FTv5Ooh%2BCy3jgDIIDkuVtEJ20ANfO1g6ehsKf3czTGabzgbH%2FsHHEq0cm5AmUaTlN2yz6XKuUhu9WYAsjMGlBR3Vj82BiXNvD9c%2B7B%2Fgh70r05PvJ1GgMDr3iRdT25czjJ7QBKsRW%2FBFSBgr49jt2f8lgMwyJ%2F0mGSG6osyYRpTLcSdHJPBjfZGVdMcAbnRySnyFS%2FK6sLh7LGh1E9Vg2fpTFejjCve9a%2FwW1ZQavD5lB9PtjWqlX%2F8z5miBmwlEzNGzUy5sR1e575%2B0njwYMrQcrA%3D%3D&sign_type=RSA2×tamp=2018-05-23+16%3A53%3A04&version=1.0
 
 
 */

#pragma mark ------------------------------------------ 微信支付---------------------------------------------------------

#import "WXApi.h"

//微信APP端统一创建订单接口
static NSString *const   CreatWx_Order  =@"";

//微信支付结果回调页面
static NSString *const  WxPay_Back_URL  = @"";

//获取服务器端支付数据地址（商户自定义）
static NSString *const  SP_URL         = @"";

//微信应用appID
static NSString *const  WX_AppID       = @"wx0c12bee6b0cf607c";

//可使用APPID的开发者中心获取AppSecret。
static NSString *const  WX_AppSecret   = @"";

//微信支付分配的商户号
static NSString *const  MCH_ID         = @"";

//安全校验码（MD5）密钥,平台设置的“API密钥”，为了安全，请设置为以数字和字母组成的32字符串。
static NSString *const  WX_PartnerKey  = @"";




#endif /* Tools_h */
