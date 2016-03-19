//
//  BaseViewController.m
//  MyYuWei
//
//  Created by 邓思琴 on 16/3/17.
//  Copyright © 2016年 邓思琴. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//#warning 创建BaseViewController 将其他控制器继承于base 以便重用相同布局或者功能
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
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
