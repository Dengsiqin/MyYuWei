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
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, -20, KScreenWidth, KScreenHeight+20) style:UITableViewStylePlain];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    [self.view addSubview:_tableView];
    

    
}

//创建表视图的头视图
-(void)_creatHeadView{
    UIView * haedView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 190*proportion_5)];
//    haedView.backgroundColor = [UIColor yellowColor];
    
    
    _tableView.tableHeaderView = haedView;
    
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 140*proportion_5)];
    imageView.image = [UIImage imageNamed:@"userCenterBackimage.jpg"];
    [haedView addSubview:imageView];
    
    //头像
    UIImageView * headerView = [[UIImageView alloc]initWithFrame:CGRectMake(25, 60, 60*proportion_5, 60*proportion_5)];
//    headerView.backgroundColor = [UIColor grayColor];
    headerView.image = [UIImage imageNamed:@"mine_header.jpg"];
    
    headerView.layer.masksToBounds = YES;
    
    headerView.layer.cornerRadius = 30*proportion_5;
    headerView.layer.borderColor = [UIColor whiteColor].CGColor;
    headerView.layer.borderWidth = 1;

//    headerView.backgroundColor = [UIColor whiteColor];
    [imageView addSubview:headerView];
    
    //呢称
    UILabel * nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(110, 70, 60*proportion_5, 20*proportion_5)];
    nameLabel.backgroundColor = [UIColor clearColor];
    nameLabel.text = @"念语发酵食品";
    nameLabel.textColor = [UIColor whiteColor];
    nameLabel.font = [UIFont systemFontOfSize:22];
    
    [imageView addSubview:nameLabel];
    
    //个性签名
    UILabel * signLabel = [[UILabel alloc]initWithFrame:CGRectMake(110, 90, 120*proportion_5, 30*proportion_5)];
    signLabel.backgroundColor = [UIColor clearColor];
    signLabel.text = @"倘若所有深情都不被辜负";
    signLabel.textColor = [UIColor whiteColor];
    signLabel.font = [UIFont systemFontOfSize:18];
    
    [imageView addSubview:signLabel];
    
    //  性别标签
    
//    [nameLabel sizeToFit];
//    nameLabel sizeThatFits:CGSizeMake(<#CGFloat width#>, <#CGFloat height#>)
    UIImageView * genderImage = [[UIImageView alloc]initWithFrame:CGRectMake(nameLabel.right + 50, 70, 22*proportion_5, 22*proportion_5)];
    genderImage.image = [UIImage imageNamed:@"mine_girl"];
    genderImage.contentMode = UIViewContentModeScaleAspectFit;
    [imageView addSubview:genderImage];

    //右边标签

    UIImageView * rightImage = [[UIImageView alloc]initWithFrame:CGRectMake(KScreenWidth-30, 85, 10*proportion_5, 20*proportion_5)];
    rightImage.image = [UIImage imageNamed:@"right_arrow_white"];
    [imageView addSubview:rightImage];

    

}

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
