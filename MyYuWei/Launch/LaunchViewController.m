//
//  LaunchViewController.m
//  MyYuWei
//
//  Created by 邓思琴 on 16/3/18.
//  Copyright © 2016年 邓思琴. All rights reserved.
//

#import "LaunchViewController.h"
#import "MainTabBarController.h"
@interface LaunchViewController ()<UIScrollViewDelegate>

@property (nonatomic,strong)UIPageControl *pageControll;
@end

@implementation LaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //创建滑动视图
    UIScrollView * scrollView = [[UIScrollView alloc]initWithFrame:self.view.frame];
    
    for (int i=0; i < 4; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i*KScreenWidth, 0, KScreenWidth, KScreenHeight)];
        
        //添加图片
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"start_s%d.jpg",i+1]];
        [scrollView addSubview:imageView];
        if (i == 3) {
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(KScreenWidth/2 - 50*proportion_5 , KScreenHeight - 185/2*proportion_5, 100*proportion_5, 35*proportion_5);
            [button setImage:[UIImage imageNamed:@"startbtn"] forState:UIControlStateNormal];
            
            [imageView addSubview:button];
            
            //允许响应事件
            imageView.userInteractionEnabled = YES;
            [button addTarget:self action:@selector(startMain:) forControlEvents:UIControlEventTouchUpInside];
            
        }
        
    }
    //设置scrollView的内容尺寸
    scrollView.contentSize = CGSizeMake(KScreenWidth * 4, KScreenHeight);
    //滑动时是否显示水平滚动条
    scrollView.showsHorizontalScrollIndicator = NO;
    //滑动时是否显示垂直滚动条
    scrollView.showsVerticalScrollIndicator = NO;
    //设置scrollView的背景颜色
    scrollView.backgroundColor = [UIColor redColor];
    //是否分页滑动
    scrollView.pagingEnabled = YES;
    //滚动开始，末尾，是否添加反弹效果
    scrollView.bounces = NO;
    scrollView.delegate = self;
    
    self.pageControll = [[UIPageControl alloc]initWithFrame:CGRectMake(0, KScreenHeight - 40*proportion_5, KScreenWidth, 20*proportion_5)];
    //当前页数
    self.pageControll.currentPage = 0;
    //总页数
    self.pageControll.numberOfPages = 4;
    //当前页数显示的颜色
    self.pageControll.currentPageIndicatorTintColor = UIColorFromRGB(0xffa10d);
    //非当前页显示的颜色
    self.pageControll.pageIndicatorTintColor = UIColorFromRGB(0x282828);

    [self.view addSubview:scrollView];
    [self.view addSubview:self.pageControll];
    
}
- (void)startMain:(UIButton *)button{
    
    //button的点击事件。进入到MainTabBarController
    [UIApplication sharedApplication].keyWindow.rootViewController = [[MainTabBarController alloc]init];
    
}

#pragma mark --ScrollerDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    CGFloat x = scrollView.contentOffset.x;
//    
//    NSInteger page = (NSInteger)(x / KScreenWidth);
//    self.pageControll.currentPage = page;
//    
//    NSLog(@"在滑动");
}// any offset changes
- (void)scrollViewDidZoom:(UIScrollView *)scrollView NS_AVAILABLE_IOS(3_2){
    
    
    
    
}// any zoom scale changes

// called on start of dragging (may require some time and or distance to move)
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    
    
}
// called on finger up if the user dragged. velocity is in points/millisecond. targetContentOffset may be changed to adjust where the scroll view comes to rest
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset NS_AVAILABLE_IOS(5_0){
    
    
    
    
}
// called on finger up if the user dragged. decelerate is true if it will continue moving afterwards
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{

}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    
    
}// called on finger up as we are moving
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGFloat x = scrollView.contentOffset.x;
    
    NSInteger page = (NSInteger)(x / KScreenWidth);
    self.pageControll.currentPage = page;
    
}// called when scroll view grinds to a halt




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
