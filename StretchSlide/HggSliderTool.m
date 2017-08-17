//
//  HggSliderTool.m
//  StretchSlide
//
//  Created by 胡高广 on 2017/8/16.
//  Copyright © 2017年 胡高广. All rights reserved.
//

#import "HggSliderTool.h"
#import "HggNaviController.h"
#import "HgLeftViewController.h"

@implementation HggSliderTool
static UIWindow *window_;
/**
 * 根据底部控制器展示
 */
+ (void)showWithRootViewController:(UIViewController *)rootViewController {
    window_ = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    window_.backgroundColor = [UIColor clearColor];
    window_.hidden = NO;
    
    HgLeftViewController *vc = [[HgLeftViewController alloc] init];
    vc.view.backgroundColor = [UIColor clearColor];
    vc.rootViewController = rootViewController;
    HggNaviController *nav = [[HggNaviController alloc] initWithRootViewController:vc];
    nav.view.backgroundColor = [UIColor clearColor];
    window_.rootViewController = nav;
    [window_ addSubview:nav.view];
}

/**
 * 隐藏
 */
+ (void)hide {
    window_.hidden = YES;
    window_.rootViewController = nil;
    window_ = nil;
}

@end
