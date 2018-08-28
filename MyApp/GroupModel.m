//
//  GroupModel.m
//  MyApp
//
//  Created by ming on 2018/8/9.
//  Copyright © 2018年 ming. All rights reserved.
//

#import "GroupModel.h"

@implementation GroupModel

+(NSDictionary *)mj_objectClassInArray{
 
    
    return @{
             @"roomgroup":[RoomModel class],
             };
    
    
}




@end


@implementation RoomModel

@end
