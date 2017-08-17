//
//  HggItem.m
//  StretchSlide
//
//  Created by 胡高广 on 2017/8/16.
//  Copyright © 2017年 胡高广. All rights reserved.
//

#import "HggItem.h"

@implementation HggItem
+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title subtitle:(NSString *)subtitle destVcClass:(Class)destVcClass {
    HggItem *item = [[self alloc] init];
    item.icon = icon;
    item.title = title;
    item.subtitle = subtitle;
    item.destVcClass = destVcClass;
    return item;
}

@end
