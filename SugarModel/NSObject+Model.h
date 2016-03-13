//
//  NSObject+Model.h
//
//  Created by 苏正权 on 16/3/9.
//  Copyright © 2016年 苏正权. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ModelDelegate <NSObject>

+(NSDictionary*)objectClassInArray;

@end

@interface NSObject (Model)

+(instancetype)modelWithDict:(NSDictionary*)Dict;
@end
