//
//  GroupModel.h
//  MyApp
//
//  Created by ming on 2018/8/9.
//  Copyright © 2018年 ming. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RoomModel;


@interface GroupModel : NSObject

@property (nonatomic, copy) NSMutableArray<RoomModel *> *roomgroup;
@property (nonatomic, copy) NSMutableArray *group;
@property (nonatomic, copy) NSString *room;
@property (nonatomic, copy) NSMutableArray *deviceDetail;


@end


@interface RoomModel : NSObject

@property (nonatomic, copy) NSString *deviceName;
@property (nonatomic, copy) NSString *deviceStatus;
@property (nonatomic, copy) NSString *deviceID;
@property (nonatomic, copy) NSString *address;

@end
