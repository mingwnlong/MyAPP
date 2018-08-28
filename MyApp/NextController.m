
//
//  NextController.m
//  MyApp
//
//  Created by ming on 2018/8/9.
//  Copyright © 2018年 ming. All rights reserved.
//

#import "NextController.h"
#import "GroupModel.h"
#import <MJExtension.h>
#import "NextView.h"

typedef enum : NSInteger {
    kBLGoodsDetailTicketEvent,
    kBLGoodsDetailPromotionEvent,
    kBLGoodsDetailScoreEvent,
    kBLGoodsDetailTargetAddressEvent,
    kBLGoodsDetailServiceEvent,
    kBLGoodsDetailSKUSelectionEvent
    
} ButtonType ;



@interface NextController ()
@property (nonatomic,strong)NSMutableArray *dataArray;
@property (nonatomic,strong)NSDictionary <NSString *, NSInvocation *> *eventStrategy;
@end

@implementation NextController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArray= [NSMutableArray array];
    
    NSArray *arr =@[
                    @{
                        @"roomgroup":@[
                                      @{
                                          @"device_name":@"海尔",
                                          @"address": @"客厅电视机",
                                          @"device_id": @"c6f7cd61-245f-46fc-8e81-1e32a0f38cd6",
                                          @"device_status":@"0"
                                      },
                                      @{
                                          @"device_name": @"乐视",
                                          @"address": @"餐厅电视机",
                                          @"device_id": @"7c756f4a-d3cf-492a-817b-92311f6ea34b",
                                          @"device_status": @"0"
                                       }
                                      ],
                        @"room": @"厨房"
                    },
                    @{
                        @"roomgroup": @[
                                     @{
                                          @"device_name": @"海尔",
                                          @"address": @"客厅电视机",
                                          @"device_id": @"784ec8cd-723d-44bc-a6cc-3ae78022e6e9",
                                          @"device_status": @"0"
                                      }
                                      ],
                        @"room": @"客厅"
                    },
                    @{
                        @"roomgroup": @[
                                      @{
                                          @"device_name": @"乐视",
                                          @"address": @"餐厅电视机",
                                          @"device_id": @"3d141e71-95ce-4e04-845a-9f0a455d37c2",
                                          @"device_status": @"0"
                                      }
                                      ],
                        @"room": @"阳台"
                    }
                 ];

//    NextView *vc=  [[NextView alloc]initWithFrame:Frame(10, 10, 300, 300)];
//    
//    vc.backgroundColor = [UIColor grayColor];
//    [self.view addSubview:vc];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(80, 80, 50, 50);
    
    button.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    [button addTarget:self action:@selector(createInvocationWithSelector:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
  //  [self mjExctinoModel:arr];
    
}
-(void)createInvocationWithSelector:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    //发送事件时：
    [sender routerEventWithName:@"点击了" userInfo:nil];
    
    NSLog(@"发送事件");
    
    
}


- (NSDictionary <NSString *, NSInvocation *> *)eventStrategy
{
    if (_eventStrategy == nil) {
        _eventStrategy = @{
//                           kBLGoodsDetailTicketEvent:[self createInvocationWithSelector:@selector(ticketEvent:)],
//                           kBLGoodsDetailPromotionEvent:[self createInvocationWithSelector:@selector(promotionEvent:)],
//                           kBLGoodsDetailScoreEvent:[self createInvocationWithSelector:@selector(scoreEvent:)],
//                           kBLGoodsDetailTargetAddressEvent:[self createInvocationWithSelector:@selector(targetAddressEvent:)],
//                           kBLGoodsDetailServiceEvent:[self createInvocationWithSelector:@selector(serviceEvent:)],
//                           kBLGoodsDetailSKUSelectionEvent:[self createInvocationWithSelector:@selector(skuSelectionEvent:)],
                           };
    }
    return _eventStrategy;
}


-(void)mjExctinoModel:(NSArray *)arr
{
    [RoomModel mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"deviceID":@"device_id",
                 @"deviceName":@"device_name",
                 @"deviceStatus":@"device_status",
                 };
    }];

    
    NSMutableArray *modelArray = [NSMutableArray array];

    for (NSDictionary *dict in arr)
    {
        GroupModel * model = [GroupModel mj_objectWithKeyValues:dict];
        
        for (NSDictionary *deviceDic in model.roomgroup)
        {
            RoomModel *rommModel = [RoomModel mj_objectWithKeyValues:deviceDic];
            
            [modelArray addObject:rommModel];
        }
        
        [self.dataArray addObject:model];
    }
    
    
     NSLog(@"第一层 %@",modelArray);
    
     NSLog(@"第二层 %@",self.dataArray);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end


























