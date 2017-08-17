//
//  HggCommenTableViewCell.h
//  StretchSlide
//
//  Created by 胡高广 on 2017/8/16.
//  Copyright © 2017年 胡高广. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HggItem;
@interface HggCommenTableViewCell : UITableViewCell
/** item */
@property (nonatomic, strong) HggItem *item;

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
