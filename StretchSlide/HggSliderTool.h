//
//  HggSliderTool.h
//  StretchSlide
//
//  Created by 胡高广 on 2017/8/16.
//  Copyright © 2017年 胡高广. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HggSliderTool : NSObject

/**
 * 根据底部控制器展示
 */
+ (void)showWithRootViewController:(UIViewController *)rootViewController;

/**
 * 隐藏
 */
+ (void)hide;

@end
