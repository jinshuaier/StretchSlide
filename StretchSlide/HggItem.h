//
//  HggItem.h
//  StretchSlide
//
//  Created by 胡高广 on 2017/8/16.
//  Copyright © 2017年 胡高广. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^HggItemOption)();
@interface HggItem : NSObject
/**
 *  图标
 */
@property (nonatomic, copy) NSString *icon;
/**
 *  标题
 */
@property (nonatomic, copy) NSString *title;
/**
 *  子标题
 */
@property (nonatomic, copy) NSString *subtitle;
/**
 *  点击那个cell需要做什么事情
 */
@property (nonatomic, copy) HggItemOption option;

/**
 *  点击这行cell需要跳转的控制器
 */
@property (nonatomic, assign) Class destVcClass;

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title subtitle:(NSString *)subtitle destVcClass:(Class)destVcClass;

@end
