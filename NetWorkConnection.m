//
//  NetWorkConnection.m
//  SunCard
//
//  Created by aa on 2016/11/8.
//  Copyright © cc. All rights reserved.
//

#import "NetWorkConnection.h"
#import <AFNetworking.h>
@implementation NetWorkConnection

#pragma mark - 创建请求者
+(AFHTTPSessionManager *)manager
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // 声明上传的是json格式的参数，需要你和后台约定好，不然会出现后台无法获取到你上传的参数问题
    manager.requestSerializer = [AFJSONRequestSerializer serializer]; // 上传JSON格式
    // 声明获取到的数据格式
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer]; // AFN不会解析,数据是data，需要自己解析
    manager.responseSerializer = [AFJSONResponseSerializer serializer]; // AFN会JSON解析返回的数据
    manager.requestSerializer.timeoutInterval = kTimeOutInterval;
//  [manager.requestSerializer setValue:[NSString stringWithFormat:@"Bearer %@",token] forHTTPHeaderField:@"Authorization"];
    NSString *token = [Cg_LoginUser_Tool sharedLogin].getToken; //登录时候返回token
    NSLog(@"token====%@",token);

    if (token.length ==0) {
        token = @"";
    }
    [manager.requestSerializer setValue:[NSString stringWithFormat:@"Bearer %@",token] forHTTPHeaderField:@"Authorization"];
    
    // 个人建议还是自己解析的比较好，有时接口返回的数据不合格会报3840错误，大致是AFN无法解析返回来的数据
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
//    [manager.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];

    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html",@"image",@"application/x-www-form-urlencoded",nil];
    NSString *vStr = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    NSString *userAgmeng = [NSString stringWithFormat:@"%@/%@ (%@; iOS %@; Scale/%0.2f)", [[NSBundle mainBundle] infoDictionary][(__bridge NSString *)kCFBundleExecutableKey] ?: [[NSBundle mainBundle] infoDictionary][(__bridge NSString *)kCFBundleIdentifierKey], [[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"] ?: [[NSBundle mainBundle] infoDictionary][(__bridge NSString *)kCFBundleVersionKey], [[UIDevice currentDevice] model], [[UIDevice currentDevice] systemVersion], [[UIScreen mainScreen] scale]];
    [manager.requestSerializer setValue:[NSString stringWithFormat:@"%@ CaogenMessenger/%@",userAgmeng,vStr] forHTTPHeaderField:@"User-Agent"];
    
    return manager;
}
+ (void)getURL:(NSString *)URLString param:(NSDictionary *)param Success:(SuccessBlock)success fail:(AFNErrorBlock)fail{
    [NetWorkConnection reachabilityStatus:^(id responseObject) {
        if ([responseObject isEqualToString:@"无可用网络"]) {
            [SVProgressHUD showErrorWithStatus:@"请检查网络是否连接正常"];
            return ;
            
        }
    }];
    // 创建请求类
    AFHTTPSessionManager *manager = [self manager];
    NSString *path = [NSString stringWithFormat:@"%@%@",BaseUrl,URLString];
    [manager GET:path parameters:param progress:^(NSProgress * _Nonnull downloadProgress) {
        // 这里可以获取到目前数据请求的进度
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 请求成功
        if(responseObject){
//            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            success(responseObject,YES);
        } else {
            success(@{@"msg":@"暂无数据"}, NO);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 请求失败
        fail(error);
    }];
}

+ (void)postURL:(NSString *)urlString param:(NSDictionary *)param success:(SuccessBlock)success fail:(AFNErrorBlock)fail
{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];

    [NetWorkConnection reachabilityStatus:^(id responseObject) {
        if ([responseObject isEqualToString:@"无可用网络"]) {
            [SVProgressHUD showErrorWithStatus:@"请检查网络是否连接正常"];
            [user setObject:@"0" forKey:@"networkking"];
            [user synchronize];
            return;
        }else{
            [user setObject:@"1" forKey:@"networkking"];
            [user synchronize];
            
        }
    }];

    // 创建请求类
    AFHTTPSessionManager *manager = [self manager];
    NSString *path = [NSString stringWithFormat:@"%@%@",BaseUrl,urlString];

    
    [manager POST:path parameters:param progress:^(NSProgress * _Nonnull uploadProgress) {
        // 这里可以获取到目前数据请求的进度
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 请求成功
        if(responseObject){
            success(responseObject,YES);
        } else {
            success(@{@"msg":@"暂无数据"}, NO);

        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 请求失败
        fail(error);

    }];

}

// 上传
+ (void)uploadPost:(NSString *)urlString parameters:(id)parameters UploadImage:(UIImage *)image success:(SuccessBlock)successs failure:(AFNErrorBlock)fail{
    AFHTTPSessionManager *manager = [self manager];
    NSString *path = [NSString stringWithFormat:@"%@%@",BaseUrl,urlString];
    [manager POST:path parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
        NSString *fileName = [NSString stringWithFormat:@"%@.png",[formatter stringFromDate:[NSDate date]]];
        NSData *data = UIImageJPEGRepresentation(image, 0.7);
        [formData appendPartWithFileData:data name:@"uploadimage" fileName:fileName mimeType:@"image/jpeg"];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 请求成功
        if(responseObject){
            successs(responseObject,YES);
        } else {
            successs(@{@"msg":@"暂无数据"}, NO);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (fail) {
            fail(error);
        }
    }];
}

// 网络监测
+ (void)reachabilityStatus:(void (^)(id responseObject))netStatus
{
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {

            case AFNetworkReachabilityStatusUnknown:

                if (netStatus) {
                    netStatus(@"未知网络");
                }
                break;

            case AFNetworkReachabilityStatusNotReachable:

                if (netStatus) {
                    netStatus(@"无可用网络");
                }
                break;

            case AFNetworkReachabilityStatusReachableViaWiFi:

                if (netStatus) {
                    netStatus(@"当前Wifi网络");
                }
                break;

            case AFNetworkReachabilityStatusReachableViaWWAN:

                if (netStatus) {
                    netStatus(@"正在使用蜂窝网络");
                }
                break;

            default:

                break;

        }

    }];
    [manager startMonitoring];
}


@end
