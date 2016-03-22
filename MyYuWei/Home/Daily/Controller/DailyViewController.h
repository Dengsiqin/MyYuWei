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


@property (nonatomic,strong)UIScrollView * dailyScrollView;
@property (nonatomic,strong)UITableView * leftTableView;
@property (nonatomic,strong)UITableView * rightTableView;
@end
