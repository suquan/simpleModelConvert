//
//  SugarStatues.h
//  MY字典转模型
//
//  Created by 苏正权 on 16/3/10.
//  Copyright © 2016年 苏正权. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Sugaruser.h"

@interface SugarStatues : NSObject

@property(nonatomic,copy)NSString *text;
@property(nonatomic,strong)Sugaruser *user;
@end
