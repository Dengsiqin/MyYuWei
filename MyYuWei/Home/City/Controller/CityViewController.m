//
//  CityViewController.m
//  MyYuWei
//
//  Created by 邓思琴 on 16/3/15.
//  Copyright © 2016年 邓思琴. All rights reserved.
//

#import "CityViewController.h"

@interface CityViewController ()<UITableViewDataSource,UITableViewDelegate>

{
    UITableView * _cityTableView;
}

@end

@implementation CityViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem * leftImage = [[UIBarButtonItem alloc]initWithImage: [UIImage imageNamed:@"white_logo"] style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.leftBarButtonItem =leftImage;
    

    [self _creatTableView];


}

//创建表视图

-(void)_creatTableView{
    _cityTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _cityTableView.backgroundColor = [UIColor clearColor];
    
    
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
