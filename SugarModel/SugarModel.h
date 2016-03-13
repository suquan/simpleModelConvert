//
//  SugarModel.h
//  MY字典转模型
//
//  Created by 苏正权 on 16/3/10.
//  Copyright © 2016年 苏正权. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SugarADs.h"
#import "SugarStatues.h"

@interface SugarModel : NSObject

@property(nonatomic,strong)NSArray *statuses;
@property(nonatomic,strong)NSArray *ads;
@property(nonatomic,copy)NSString *totalNumber;
@property(nonatomic,copy)NSString *previousCursor;
@property(nonatomic,copy)NSString *nextCursor;

@end
