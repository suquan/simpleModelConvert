//
//  SugarModel.m
//  MY字典转模型
//
//  Created by 苏正权 on 16/3/10.
//  Copyright © 2016年 苏正权. All rights reserved.
//

#import "SugarModel.h"

@implementation SugarModel
+ (NSDictionary *)objectClassInArray
{
    return @{
             @"statuses" : @"SugarStatues",
             @"ads" : @"SugarADs",
             };
}
@end
