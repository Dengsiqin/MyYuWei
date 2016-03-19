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

#import "BaseNavigationController.h"


#define KScreenWidth [UIScreen mainScreen].bounds.size.width
#define KScreenHeigth [UIScreen mainScreen].bounds.size.heigth

#define KTabBarHeight 49

@interface MainTabBarController (){
    UIImageView * _bjImageView;
    UIImageView * _selectedImageView;
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
    

    NSMutableArray * viewctrls = [[NSMutableArray alloc]initWithCapacity:viewControllers.count];

    for (int i = 0; i <viewControllers.count ; i ++) {
        
       
        BaseNavigationController * navi = [[BaseNavigationController alloc]initWithRootViewController:viewControllers[i]];
        
        
        [viewctrls addObject:navi];
        
    }
    
    self.viewControllers = viewctrls;
    
    
    
    
    self.viewControllers = viewctrls;
    
    
    
    
}

//自定义标签栏

-(void)_creatTabBar{
    
    //隐藏系统自带的标签项

    for (UIView * view in self.tabBar.subviews) {
        [view removeFromSuperview];
    }
    
    
    NSArray * titles = @[@"推荐",@"全球",@"一刻",@"食记",@"我的"];
    NSArray * images = @[@"tab_recommend",
                         @"tab_find",
                         @"tab_onetime",
                         @"tab_daily",
                         @"tab_mine"];
    //创建ImageView,设置tabBar的背景图片
    _bjImageView = [[UIImageView alloc]initWithFrame:self.tabBar.bounds];
    _bjImageView.backgroundColor = [UIColor blackColor];
    [self.tabBar addSubview:_bjImageView];
    
    //创建按钮
    for (int i = 0; i < titles.count; i ++) {
        
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = 1000 + i ;
        button.frame = CGRectMake(i * KScreenWidth / 5, 0, KScreenWidth / 5, KTabBarHeight);

        UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 5, KScreenWidth / 5 -40 , KTabBarHeight - 28)];
        
//#warning 设置imageView的内容模式 自适应 防止被拉伸 因为你的imageView尺寸比例与图标大小不符合
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        
        imageView.image = [UIImage imageNamed:images[i]];
        imageView.tag = 1100;
        [button addSubview:imageView];
        
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, KTabBarHeight - 15, KScreenWidth / 5, 14)];
        label.textColor = [UIColor whiteColor];
        label.text = titles[i];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:12];
        label.tag = 1101;
        [button addSubview:label];
        
        
//        
//#warning 方案二 不绘制新的imageView和label 直接设置button的图片和文字 然后修改图片和文字的偏移量 默认图片在左边 文字在右边 仅供学习偏移量
        /*
        [button setImage:[UIImage imageNamed:images[i]] forState:UIControlStateNormal];
        [button setTitle:titles[i] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:12];
        button.backgroundColor = [UIColor blueColor];
        button.layer.borderColor = [UIColor blackColor].CGColor;//layer层的边框颜色
        button.layer.borderWidth = 1;//layer层的边框宽
        //设置button图片的偏移 //类似这样的坐标button.frame.size.width 可以通过第三方类库简单调用 自己查找下载导入 或者自行封装 实现 类似view.width = view.frame.size.width
        //计算坐标偏移量
        CGFloat leftEdge = (button.frame.size.width - button.imageView.frame.size.width)/2 ;

        [button setImageEdgeInsets:UIEdgeInsetsMake(- button.titleLabel.frame.size.height, leftEdge, 0,0)];
        button.titleLabel.backgroundColor = [UIColor redColor];
        button.imageView.backgroundColor = [UIColor purpleColor];
        [button setTitleEdgeInsets:UIEdgeInsetsMake(button.imageView.frame.size.height + 2, -(button.frame.size.width - button.titleLabel.frame.size.width)/2, 0, 0)];
        //UIEdgeInsetsMake(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right) 上左下右四个方向的偏移量
        
        */
        //tabBar的点击事件
        [button addTarget:self action:@selector(clickTabBarButton:) forControlEvents:UIControlEventTouchUpInside];
        
        //设置刚进入时，默认第一个按钮为选中状态
        if (i == 0) {
            
            button.selected = YES;
            
            imageView.image = [UIImage imageNamed:@"tab_recommend_orange"];
            label.textColor = [UIColor orangeColor];
        }
        
        [self.tabBar addSubview:button];
    }
                                
   
    
    
    
    
}

-(void)clickTabBarButton:(UIButton *)sender{
    
    NSArray * imagesOranges = @[@"tab_recommend_orange",
                               @"tab_find_orange",
                               @"tab_onetime_orange",
                               @"tab_daily_orange",
                               @"tab_mine_orange"];
    
    NSArray * images = @[@"tab_recommend",
                         @"tab_find",
                         @"tab_onetime",
                         @"tab_daily",
                         @"tab_mine"];
    
    
    if (sender.tag - 1000 < 5) {
        self.selectedIndex = sender.tag - 1000;
        UIImageView * imageView = (UIImageView *)[sender viewWithTag:1100];
        UILabel * label = (UILabel *)[sender viewWithTag:1101];
        label.textColor = [UIColor orangeColor];
        imageView.image = [UIImage imageNamed:imagesOranges[sender.tag - 1000]];
        
        for (int i = 0; i < 5; i ++) {
            
            if (sender.tag - 1000 == i) {
                
            self.selectedIndex = sender.tag - 1000;

            UIImageView * imageView = (UIImageView *)[sender viewWithTag:1100];
            UILabel * label = (UILabel *)[sender viewWithTag:1101];
            label.textColor = [UIColor orangeColor];
            imageView.image = [UIImage imageNamed:imagesOranges[sender.tag - 1000]];

            
            }else{
                UIButton * button = (UIButton * )[self.tabBar viewWithTag:1000 + i];
                UIImageView * imageView = (UIImageView * )[button viewWithTag:1100];
                UILabel * label = (UILabel *)[button viewWithTag:1101];
                label.textColor = [UIColor whiteColor];
                imageView.image = [UIImage imageNamed:images[i]];
                
            }
        
    }
    
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
