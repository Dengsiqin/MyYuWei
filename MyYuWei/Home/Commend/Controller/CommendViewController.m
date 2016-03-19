//
//  CommendViewController.m
//  MyYuWei
//
//  Created by 邓思琴 on 16/3/15.
//  Copyright © 2016年 邓思琴. All rights reserved.
//

#import "CommendViewController.h"

#define KScreenWidth [UIScreen mainScreen].bounds.size.width


@interface CommendViewController (){
    
    UITableView * _tableView;

    
}

@end

@implementation CommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    

    [self _creatTableView];
    [self _creatHeaderView];
    
}
- (UIStatusBarStyle)preferredStatusBarStyle{
    
    return UIStatusBarStyleLightContent;
    
}
//创建表视图
-(void)_creatTableView{
    
    _tableView= [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:_tableView];
    
    
    
    
}

//创建表视图的头视图

-(void)_creatHeaderView{
    
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 275)];
    headView.backgroundColor = [UIColor purpleColor];
    
    //对表视图的头视图进行赋值
    _tableView.tableHeaderView = headView;
    
    
    
}

//表视图的数据源方法

//tableView组的个数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 3;
    
}

//tableView每组单元格个数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

//每一个单元格
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * identifer = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
    }
    
    
    
    
    
    return cell;
}

//返回单元格的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return 275;
    }else if(indexPath.section ==1){
        return 275;
    }else{
        return 100;
    }
}

////组的头视图
//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//   //自定义组的头视图
//        UIImageView * imageV = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 2, 5)];
//        imageV.backgroundColor = [UIColor orangeColor];
//        
//        return imageV;
//   
//}





//头视图高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 8;
    
}

//尾视图高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    if (section == 3) {
        return 8;
    }
    return 0.00000001;
    
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
