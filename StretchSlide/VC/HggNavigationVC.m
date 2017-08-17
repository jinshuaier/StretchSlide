//
//  HggNavigationVC.m
//  StretchSlide
//
//  Created by 胡高广 on 2017/8/16.
//  Copyright © 2017年 胡高广. All rights reserved.
//

#import "HggNavigationVC.h"

@interface HggNavigationVC ()

@end

@implementation HggNavigationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 * 这个方法是为了，后台进入前台，导航栏的位置会改变
 view即将布局其Subviews。比如view的bounds改变了(例如状态栏从不显示到显示，视图方向变化)，要调整Subviews的位置，在调整之前要做的一些工作就可以在该方法中实现。
 */
- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    self.navigationBar.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64);
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
