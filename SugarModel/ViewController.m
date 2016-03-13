//
//  ViewController.m
//  SugarModel
//
//  Created by 苏正权 on 16/3/11.
//  Copyright © 2016年 苏正权. All rights reserved.
//

#import "ViewController.h"
#import "SugarADs.h"
#import "SugarModel.h"
#import "SugarStatues.h"
#import "Sugaruser.h"
#import "NSObject+Model.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    测试
    
    NSDictionary *dict = @{
                            @"statuses" : @[
                                    @{
                                        @"text" : @"今天天气真不错！",
                                        
                                        @"user" : @{
                                                @"name" : @"Rose",
                                                @"icon" : @"testhaha.png"
                                                }
                                        },
                                    
                                    @{
                                        @"text" : @"明天去旅游了",
                                        
                                        @"user" : @{
                                                @"name" : @"Jack",
                                                @"icon" : @"ljack.png"
                                                }
                                        }
                                    
                                    ],
                            
                            @"ads" : @[
                                    @{
                                        @"image" : @"ad01.png",
                                        @"url" : @"http://www.baidu.com"
                                        },
                                    @{
                                        @"image" : @"ad02.png",
                                        @"url" : @"http://www.google.com"
                                        }
                                    ],
                            
                            @"totalNumber" : @"2014",
                            @"previousCursor" : @"13476589",
                            @"nextCursor" : @"13476599"
                            };
    
    
    SugarModel *model = [SugarModel modelWithDict:dict];
    
    for (SugarStatues * statues in model.statuses)
    {
        NSLog(@"%@----%@-----%@",statues.text,statues.user.name,statues.user.icon);
    }
    
    for (SugarADs *ad in model.ads)
    {
        NSLog(@"%@-----%@-----",ad.image,ad.url);
    }
    
    NSLog(@"%@------%@-------%@",model.totalNumber,model.previousCursor,model.nextCursor);
    
}

@end
