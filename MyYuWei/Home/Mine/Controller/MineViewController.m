//
//  MineViewController.m
//  MyYuWei
//
//  Created by 邓思琴 on 16/3/15.
//  Copyright © 2016年 邓思琴. All rights reserved.
//

#import "MineViewController.h"

#define headerHeight 8
#define footerHeight 8
#define rowHeight 50
@interface MineViewController (){

    
    UITableView * _tableView;
}




@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    [self _creatTableView];
    [self _creatHeadView];


}


//创建表视图
-(void)_creatTableView{
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    [self.view addSubview:_tableView];
    

    
}

//创建表视图的头视图
-(void)_creatHeadView{
    UIView * haedView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 200)];
    haedView.backgroundColor = [UIColor yellowColor];
    
    
    _tableView.tableHeaderView = haedView;
    
}


//tableView的组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

//返回单元格的行数

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (  section == 0) {
        return 1;
    }else if(section == 1){
        return 2;
    }else if(section ==2){
        return 4;
    }else {
        return 2;
    }
    
    
    
    
}


//每一个单元格

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
static NSString * identifer = @"cell";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
    }
    
//    UIImageView * imageView = [UIImageView]
//    
//    
//    if (indexPath.section == 0) {
//        
//    }
//    
//    
//    
    
    
    return cell;
}






//返回单元格的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return rowHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return headerHeight;
}
- (CGFloat )tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
   
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
