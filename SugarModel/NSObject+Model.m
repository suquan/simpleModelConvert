//
//  NSObject+Model.m
//
//  Created by 苏正权 on 16/3/9.
//  Copyright © 2016年 苏正权. All rights reserved.
//

#import "NSObject+Model.h"
#import <objc/runtime.h>


@implementation NSObject (Model)


+(instancetype)modelWithDict:(NSDictionary *)Dict
{
    id objc = [[self alloc]init];
    
    unsigned int count = 0;
    
    Ivar *ivarList = class_copyIvarList(self, &count);
    
  
    for (int i=0; i<count; i++)
    {
        Ivar ivar = ivarList[i];

        NSString *name = [NSString stringWithUTF8String:ivar_getName(ivar)];
//        NSLog(@"%@",name);
        
        NSString *key = [name substringFromIndex:1];
//        NSLog(@"%@",key);
        
        id value = Dict[key];
        
//        NSLog(@"%@",value);
        
        
        if ([value isKindOfClass:[NSDictionary class]])
        {
            NSString *type = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
//            NSLog(@"%@",type);
            NSRange range = [type rangeOfString:@"\""];
            
            type = [type substringFromIndex:range.location + range.length];
            
            range = [type rangeOfString:@"\""];
            
          
            type = [type substringToIndex:range.location];
            
//            NSLog(@"%@",type);

            Class modelClass = NSClassFromString(type);
            
            if (modelClass)
            {
                value  = [modelClass modelWithDict:value];
            }
        }
        
        if ([value isKindOfClass:[NSArray class]])
        {
            
            if ([self.class respondsToSelector:@selector(objectClassInArray)]) {
                
                id objectClass;
               objectClass= [self.class objectClassInArray][key];
                
                
                if ([objectClass isKindOfClass:[NSString class]])
                {
                    Class modelClass = NSClassFromString(objectClass);
                    
                    NSMutableArray *array =[NSMutableArray array];
                    for ( NSDictionary *dict11 in value)
                    {
                      id arrayModel = [modelClass modelWithDict:dict11];
                        [array addObject:arrayModel];
                    }
                    value = array;
                }
            }
        }
        
        if (value)
        {
            [objc setValue:value forKey:key];
        }
    }
    
    return objc;
}
@end
