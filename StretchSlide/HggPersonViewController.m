//
//  HggPersonViewController.m
//  StretchSlide
//
//  Created by 胡高广 on 2017/8/16.
//  Copyright © 2017年 胡高广. All rights reserved.
//

#import "HggPersonViewController.h"
#import "HggItem.h"
#import "HggCommenTableViewCell.h"
#import "Header.h"

@interface HggPersonViewController ()<UITableViewDelegate, UITableViewDataSource>
/** tableView */
@property (nonatomic, weak) UITableView *tableView;
/** headerIcon */
@property (nonatomic, weak) UIImageView *headerIcon;
/** data */
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation HggPersonViewController

- (NSArray *)data {
    if (!_dataArray) {
        self.dataArray = [NSArray array];
    }
    return _dataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupUI];
    
    [self setupData];
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tableView.frame = self.view.bounds;
    self.headerIcon.frame = CGRectMake(20, 39, 72, 72);
}

- (void)setupUI {
    UITableView *tableView = [[UITableView alloc] init];
    tableView.scrollEnabled = NO;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    tableView.showsVerticalScrollIndicator = NO;
    tableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    UIView *headerView = [[UIView alloc] init];
    headerView.backgroundColor = [UIColor colorWithRed:245 / 255.0 green:247 / 255.0 blue:250 / 255.0 alpha:1.0];
    headerView.frame = CGRectMake(0, 0, 0, 150);
    self.tableView.tableHeaderView = headerView;
    
    /** 头像图片 */
    UIImageView *headerIcon = [[UIImageView alloc] init];
    headerIcon.image = [UIImage imageNamed:@"1.jpg"];
    headerIcon.frame = CGRectMake(20, 39, 72, 72);
    headerIcon.layer.cornerRadius = 36;
    headerIcon.clipsToBounds = YES;
    [headerView addSubview:headerIcon];
    self.headerIcon = headerIcon;
    
    /** 已认证的图标 **/
    UIButton *approveBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    approveBtn.frame = CGRectMake(CGRectGetMaxX(headerIcon.frame) + 10, 39, 80, 20);
    [approveBtn setTitle:@"已认证" forState:(UIControlStateNormal)];
    [approveBtn setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
    approveBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    approveBtn.layer.masksToBounds = YES;
    approveBtn.layer.cornerRadius = 10;
    approveBtn.layer.borderWidth = 1;
    approveBtn.layer.borderColor = [[UIColor redColor] CGColor];
    [headerView addSubview:approveBtn];
    
    /** 电话 **/
    UILabel *TelLabel = [[UILabel alloc] init];
    TelLabel.frame = CGRectMake(CGRectGetMaxX(headerIcon.frame) + 10, CGRectGetMaxY(approveBtn.frame) + 10, 200, 15);
    TelLabel.text = @"189****5021";
    [headerView addSubview:TelLabel];
    
    /** 名字 **/
    UILabel *NameLabel = [[UILabel alloc] init];
    NameLabel.frame = CGRectMake(CGRectGetMaxX(headerIcon.frame) + 10, CGRectGetMaxY(TelLabel.frame) + 10, 200, 15);
    NameLabel.text = @"金帅儿";
    [headerView addSubview:NameLabel];
}


- (void)setupData {
    HggItem *myWallet = [HggItem itemWithIcon:@"menu_wallet" title:@"我的钱包" subtitle:@"10" destVcClass:[HggMyWalletViewController class]];
    
    HggItem *myCoupon = [HggItem itemWithIcon:@"menu_promo" title:@"优惠券" subtitle:@"10" destVcClass:[HggSaleViewController class]];
    
    HggItem *myTrip = [HggItem itemWithIcon:@"menu_trips" title:@"借伞行程" subtitle:nil destVcClass:[HggRouteViewController class]];
    
    HggItem *myFriend = [HggItem itemWithIcon:@"menu_invite" title:@"分享有礼" subtitle:nil destVcClass:[HggShareViewController class]];
    
    HggItem *myNewMessage = [HggItem itemWithIcon:@"menu_sticker" title:@"消息" subtitle:nil destVcClass:[HggMessageViewController class]];
    
    HggItem *myHelp = [HggItem itemWithIcon:@"menu_trips" title:@"帮助" subtitle:nil destVcClass:[HggHelpViewController class]];
    
    HggItem *mySet = [HggItem itemWithIcon:@"menu_invite" title:@"设置" subtitle:nil destVcClass:[HggSetViewController class]];
    _dataArray = @[myWallet, myCoupon, myTrip, myFriend, myNewMessage,myHelp,mySet];
}

#pragma mark - TableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 创建cell
    HggCommenTableViewCell *cell = [HggCommenTableViewCell cellWithTableView:tableView];
    cell.item = self.dataArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    HggItem *item = self.dataArray[indexPath.row];
    if (item.destVcClass == nil) return;
   
    UIViewController *vc = [[item.destVcClass alloc] init];
    vc.title = item.title;
    [self.parentViewController.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
