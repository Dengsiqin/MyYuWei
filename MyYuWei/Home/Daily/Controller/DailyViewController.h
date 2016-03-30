//
//  DailyViewController.h
//  MyYuWei
//
//  Created by 邓思琴 on 16/3/15.
//  Copyright © 2016年 邓思琴. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
@interface DailyViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>


@property (nonatomic,strong)UIScrollView * dailyScrollView;//滑动视图
@property (nonatomic,strong)UITableView * leftTableView;//左边的tableView
@property (nonatomic,strong)UITableView * rightTableView;//右边的tableView
@end
