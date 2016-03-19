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

    [self.navigationController setNavigationBarHidden:YES  animated:YES];
    
//    UIView * statusBarView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 20)];
    
//    statusBarView.backgroundColor = [UIColor clearColor];
    
//    [self.view addSubview:statusBarView];
    
    
//    [[UINavigationBar appearance]setBarTintColor:[UIColor clearColor]];
    [self _creatTableView];
    [self _creatHeadView];


}


//创建表视图
-(void)_creatTableView{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, -20, KScreenWidth, KScreenHeight+20) style:UITableViewStyleGrouped];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    [self.view addSubview:_tableView];
    

    
}

//创建表视图的头视图
-(void)_creatHeadView{
    UIView * haedView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 190*proportion_5)];
    haedView.backgroundColor = [UIColor yellowColor];
    
    
    _tableView.tableHeaderView = haedView;
    
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 140*proportion_5)];
    imageView.image = [UIImage imageNamed:@"mine_background"];
    [haedView addSubview:imageView];
    
    //头像
    UIImageView * headerView = [[UIImageView alloc]initWithFrame:CGRectMake(25, 60, 60*proportion_5, 60*proportion_5)];
    headerView.backgroundColor = [UIColor grayColor];
//    headerView.image = [UIImage imageNamed:@"mine_header"];
    
    headerView.layer.masksToBounds = YES;
    
    headerView.layer.cornerRadius = 30*proportion_5;
    headerView.layer.borderColor = [UIColor whiteColor].CGColor;
    headerView.layer.borderWidth = 1;

//    headerView.backgroundColor = [UIColor whiteColor];
    [imageView addSubview:headerView];
    
    //呢称
    UILabel * nameLabei = [[UILabel alloc]initWithFrame:CGRectMake(100, 70, 60*proportion_5, 15*proportion_5)];
    nameLabei.backgroundColor = [UIColor clearColor];
    nameLabei.text = @"念语";
    nameLabei.textColor = [UIColor whiteColor];
    nameLabei.font = [UIFont systemFontOfSize:16];
    
    [imageView addSubview:nameLabei];
    
    //个性签名
    UILabel * signLabei = [[UILabel alloc]initWithFrame:CGRectMake(100, 90, 120*proportion_5, 15*proportion_5)];
    signLabei.backgroundColor = [UIColor clearColor];
    signLabei.text = @"念语";
    signLabei.textColor = [UIColor whiteColor];
    signLabei.font = [UIFont systemFontOfSize:14];
    
    [imageView addSubview:signLabei];
    
    
    
    
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
