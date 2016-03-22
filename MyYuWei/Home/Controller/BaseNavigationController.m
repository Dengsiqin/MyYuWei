//
//  BaseNavigationController.m
//  MyYuWei
//
//  Created by 邓思琴 on 16/3/18.
//  Copyright © 2016年 邓思琴. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationBar.barTintColor = UIColorFromRGB(0x1d1d1d);
//    self.navigationBar.backgroundColor = UIColorFromRGB(0x1d1d1d);//无效
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    self.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationBar.titleTextAttributes = @{
                                               NSForegroundColorAttributeName:[UIColor whiteColor]
                                               };
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
