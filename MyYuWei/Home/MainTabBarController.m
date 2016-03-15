//
//  MainTabBarController.m
//  MyYuWei
//
//  Created by 邓思琴 on 16/3/14.
//  Copyright © 2016年 邓思琴. All rights reserved.
//

#import "MainTabBarController.h"
#import "CommendViewController.h"
#import "CityViewController.h"
#import "OneTimeViewController.h"
#import "DailyViewController.h"
#import "MineViewController.h"


#define KScreenWidth [UIScreen mainScreen].bounds.size.width
#define KScreenHeigth [UIScreen mainScreen].bounds.size.heigth

#define KTabBarHeight 49

@interface MainTabBarController (){
    UIImageView * _bjImageView;
}

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    self.view.backgroundColor = [UIColor grayColor];
    
    //创建子控制器
    [self _creatViewControllers];
    
    //自定义标签栏
    [self _creatTabBar];
    
}


-(void)_creatViewControllers{
    
    //创建5个视图控制器
    CommendViewController * commend = [[CommendViewController alloc]init];
    CityViewController * city = [[CityViewController alloc]init];
    OneTimeViewController * oneTime = [[OneTimeViewController alloc]init];
    DailyViewController * daily = [[DailyViewController alloc]init];
    MineViewController * mine = [[MineViewController alloc]init];
    
    
    //添加到数组
    
    NSArray * viewControllers = @[commend,city,oneTime,daily,mine];
    
    //遍历视图控制器，给每一个视图控制器都添加一个导航控制器
    //把导航控制器对象，添加到数组
    
//    NSMutableArray * navis = [[NSMutableArray alloc]initWithCapacity:viewControllers.count];
//    for (UIViewController * viewC in viewControllers) {
//        
//        
//        
//        
//        
//        
//    }
//    
//    
    
    
    
}

//自定义标签栏

-(void)_creatTabBar{
    
    //隐藏系统自带的标签项

    for (UIView * view in self.tabBar.subviews) {
        [view removeFromSuperview];
    }
    
    CGFloat width = KScreenWidth / self.viewControllers.count;
    NSArray * titles = @[@"推荐",@"全球",@"一刻",@"食记",@"我的"];
    NSArray * images = @[@"tab_recommend",
                         @"tab_find",
                         @"tab_onetime",
                         @"tab_daily",
                         @"tab_mine"];
    //创建ImageView,设置tabBar的背景图片
    _bjImageView = [[UIImageView alloc]initWithFrame:self.tabBar.bounds];
    _bjImageView.backgroundColor = [UIColor grayColor];
    [self.tabBar addSubview:_bjImageView];
    
    for (int i = 0; i < titles.count; i ++) {
        
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = 1000 + i ;
        button.frame = CGRectMake(i * KScreenWidth / 5, 0, KScreenWidth / 5, KTabBarHeight);
        [_bjImageView addSubview:button];
        
        UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 5, KScreenWidth / 5 -40 , KTabBarHeight - 28)];
        imageView.image = [UIImage imageNamed:images[i]];
        imageView.tag = 1100;
        [button addSubview:imageView];
        
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, KTabBarHeight - 15, KScreenWidth / 5, 14)];
        label.textColor = [UIColor whiteColor];
        label.text = titles[i];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:12];
        label.tag = 100;
        [button addSubview:label];
        
        
        
        
        
        
        
        
   
        
        
        
        
        
        
        
        
        
        
        
        
    }
                                
    
    
    
    
    
    
    
    
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
