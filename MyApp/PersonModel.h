//
//  PersonModel.h
//  MyApp
//
//  Created by ming on 2018/8/7.
//  Copyright © 2018年 ming. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"

@interface PersonModel : NSObject

//@property(nonatomic, strong) NSString * name;
//@property(nonatomic, assign) NSInteger age;
//@property(nonatomic, strong) NSString * descrip;
//@property(nonatomic, strong) NSString *ID;
//
//@property(nonatomic, strong) NSString *address;
//@property(nonatomic, strong) NSString *dogName;


@property(nonatomic, strong) NSString * nameKey;
@property(nonatomic, strong) NSString * infoKey;
@property(nonatomic, assign) NSInteger ageKey;
@property(nonatomic, strong) NSArray * users;


@end
