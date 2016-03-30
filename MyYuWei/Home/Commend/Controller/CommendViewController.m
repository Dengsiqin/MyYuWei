//
//  CommendViewController.m
//  MyYuWei
//
//  Created by 邓思琴 on 16/3/15.
//  Copyright © 2016年 邓思琴. All rights reserved.
//

#import "CommendViewController.h"
#import "RecommendHeadCell.h"
#define KScreenWidth [UIScreen mainScreen].bounds.size.width


@interface CommendViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>{
    
    UITableView * _tableView;
    UIView *_navigationView;
    
}
@property (nonatomic,strong)NSArray *iconTitles;
@property (nonatomic,strong)NSArray *iconImages;
@end

@implementation CommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.translucent = NO;

    
    
    [self _creatTableView];
    _navigationView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KNavigationBarHeight)];
    [self.view addSubview:_navigationView];
    _navigationView.backgroundColor = UIColorFromRGBA(0x1d1d1d,0);
    
    
    
//    [self _creatHeaderView];
    [self makecollectionHeaderView];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
}
- (UIStatusBarStyle)preferredStatusBarStyle{
    
    return UIStatusBarStyleLightContent;
    
}
//创建表视图
-(void)_creatTableView{
    
    _tableView= [[UITableView alloc]initWithFrame:CGRectMake(0,-20, KScreenWidth, KScreenHeight - KTabBarHeight + 20) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:_tableView];
    
    
    
    
}

//创建表视图的头视图

-(void)_creatHeaderView{
    
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 625 / 2 *proportion_5)];
    headView.backgroundColor = [UIColor purpleColor];
    
    //对表视图的头视图进行赋值
    _tableView.tableHeaderView = headView;
    
    _headScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 150*proportion_5, KScreenWidth, 75 *proportion_5)];
    _headScrollView.backgroundColor = [UIColor clearColor];
    
    NSArray * iconTitles = @[@"附近",@"当地菜",@"特色小吃",@"咖啡馆",@"西餐",@"商务品味",@"饮食男女",@"一人食",@"亲子美食",@"组团嗨吃"];
    NSArray * images = @[@"icon_rec_1000",@"icon_rec_10105",
                             @"icon_rec_10005",@"icon_rec_10007",
                             @"icon_rec_10008",@"icon_rec_10003",
                             @"icon_rec_10000",@"icon_rec_10004",
                             @"icon_rec_10002",@"icon_rec_10001"];
    
    for (int i = 0; i < iconTitles.count; i ++) {
        
        UIButton * iconButton = [UIButton buttonWithType:UIButtonTypeCustom];
        iconButton.tag = 1000 + i;
        iconButton.frame = CGRectMake(i * KScreenWidth / 5, 0, KScreenWidth / 5, 75*proportion_5);
        iconButton.backgroundColor = [UIColor clearColor];

        
        UIImageView * iconImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 5, KScreenWidth / 5, 40*proportion_5)];
        iconImage.contentMode = UIViewContentModeScaleAspectFit;
        iconImage.image = [UIImage imageNamed:images[i]];
        iconImage.tag = 10000;
        [iconButton addSubview:iconImage];
        
        
        UILabel * iconLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 55, KScreenWidth / 5, 13*proportion_5)];
        iconLabel.text = iconTitles[i];
        iconLabel.tag = 100000;
        iconLabel.textColor = [UIColor whiteColor];
        iconLabel.font = [UIFont systemFontOfSize:14];
        iconLabel.textAlignment = NSTextAlignmentCenter;
        [iconButton addSubview:iconLabel];
        
        [iconButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        
        
        
        
        [_headScrollView addSubview:iconButton];
    }
    
    
    _headScrollView.contentSize = CGSizeMake(KScreenWidth * 2, 75);
    _headScrollView.showsVerticalScrollIndicator = NO;
    _headScrollView.showsHorizontalScrollIndicator = NO;
    _headScrollView.bounces = NO;
    
    _headScrollView.delegate = self;
    
    
    
    [headView addSubview:_headScrollView];
    
    
}


- (void)makecollectionHeaderView{
    
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 625 / 2 *proportion_5)];
    headView.backgroundColor = [UIColor purpleColor];
    
    //对表视图的头视图进行赋值
    _iconTitles = @[@"附近",@"当地菜",@"特色小吃",@"咖啡馆",@"西餐",@"商务品味",@"饮食男女",@"一人食",@"亲子美食",@"组团嗨吃"];
    _iconImages = @[@"icon_rec_1000",@"icon_rec_10105",
                         @"icon_rec_10005",@"icon_rec_10007",
                         @"icon_rec_10008",@"icon_rec_10003",
                         @"icon_rec_10000",@"icon_rec_10004",
                         @"icon_rec_10002",@"icon_rec_10001"];
    
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    
    
    layout.itemSize = CGSizeMake((KScreenWidth - 30*proportion_5) / 5, 90 * proportion_5);
    layout.minimumLineSpacing = 5 *proportion_5;
    layout.sectionInset = UIEdgeInsetsMake(0, 5*proportion_5, 0, 5*proportion_5);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    UICollectionView *collection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 350 / 2 , KScreenWidth, 90 * proportion_5) collectionViewLayout:layout];
    collection.dataSource = self;
    collection.delegate = self;
    collection.showsHorizontalScrollIndicator = NO;
    collection.showsVerticalScrollIndicator = NO;
    collection.backgroundColor = [UIColor clearColor];
    [collection registerClass:[RecommendHeadCell class] forCellWithReuseIdentifier:@"RecommendHeadCell"];
    
    [headView addSubview:collection];
    
    
    _tableView.tableHeaderView = headView;
    
    
}
#pragma mark - button的点击事件
-(void)buttonAction:(UIButton * )sender{
  
    
    
    
    
    
    
    
    
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
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if ([scrollView isKindOfClass:[UITableView class]]) {
        
        CGFloat y = scrollView.contentOffset.y;
        
//        NSLog(@"%f",y);
        
        
        if (y < 270*proportion_5 && y >= 170) {
            
        _navigationView.backgroundColor = UIColorFromRGBA(0x1d1d1d,0.8/100 * (y-170));
            
        }else if(y >= 270){
            
            _navigationView.backgroundColor = UIColorFromRGBA(0x1d1d1d,0.8);
        }else{
           _navigationView.backgroundColor = UIColorFromRGBA(0x1d1d1d,0);
        }
        
        
    }
    
    
    
}

#pragma mark --UICollectionViewDataSource&&Delegate

-(NSInteger )numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return _iconImages.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    RecommendHeadCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"RecommendHeadCell" forIndexPath:indexPath];
    cell.imageName = _iconImages[indexPath.item];
    cell.title = _iconTitles[indexPath.item];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    dispatch_async(dispatch_get_main_queue(), ^{
    [self.navigationController pushViewController:[[BaseViewController alloc]init] animated:YES];
    });
    
    
    
}
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
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
