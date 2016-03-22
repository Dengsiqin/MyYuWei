//
//  DailyViewController.m
//  MyYuWei
//
//  Created by 邓思琴 on 16/3/15.
//  Copyright © 2016年 邓思琴. All rights reserved.
//

#import "DailyViewController.h"

@interface DailyViewController (){
    UIView *_selectedLine;
    
}
//@property (nonatomic,strong)UIButton *
@end

@implementation DailyViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIImageView * titleImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 30*proportion_5, 25*proportion_5)];
    titleImage.image = [UIImage imageNamed:@"white_logo"];
    self.navigationItem.titleView = titleImage;

    //创建选择标签
    UIView * chooseBackGroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, KScreenWidth,50*proportion_5 )];
    chooseBackGroundView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:chooseBackGroundView];
    
    //标签左边按钮
    UIButton * leftButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth/2, 50*proportion_5)];
    leftButton.backgroundColor = [UIColor clearColor];
    
//    UIImageView * hotView = [[UIImageView alloc]initWithFrame:CGRectMake(30, 15, 22*proportion_5, 22*proportion_5)];
//    hotView.image = [UIImage imageNamed:@"daily_hot"];
//    [leftButton addSubview:hotView];
    
    //设置button图片
    [leftButton setImage:[UIImage imageNamed:@"daily_hot"] forState:UIControlStateNormal];
    [leftButton setTitle:@"最热" forState:UIControlStateNormal];
    //设置偏移量
    leftButton.titleEdgeInsets = UIEdgeInsetsMake(0, 10*proportion_5, 0, -10*proportion_5);
    [leftButton setTitleColor: UIColorFromRGB(0x6c6b6b) forState:UIControlStateNormal];
    leftButton.titleLabel.font = [UIFont systemFontOfSize:15];
    //这样设置无效
//    leftButton.titleLabel.text = @"啊哈";
//    leftButton.titleLabel.textColor = [UIColor redColor];
    
//    UILabel * hotLabel = [[UILabel alloc]initWithFrame:CGRectMake(80, 15, 80*proportion_5, 22*proportion_5)];
//    hotLabel.text = @"最热";
//    hotLabel.font = [UIFont systemFontOfSize:20];
//    hotLabel.textColor = UIColorFromRGB(0x6c6b6b);
//    [leftButton addSubview:hotLabel];
    
    [leftButton addTarget:self action:@selector(leftAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //标签右边按钮
    UIButton * rightButton = [[UIButton alloc]initWithFrame:CGRectMake(KScreenWidth/2 , 0, KScreenWidth/2, 50*proportion_5)];
    rightButton.backgroundColor = [UIColor clearColor];
    //直接在button上设置图片和文字
    [rightButton setImage:[UIImage imageNamed:@"daily_new"] forState:UIControlStateNormal];
    [rightButton setTitle:@"最新" forState:UIControlStateNormal];
    [rightButton setTitleColor:UIColorFromRGB(0x6c6b6b) forState:UIControlStateNormal];
    rightButton.titleLabel.font = [UIFont systemFontOfSize:15];
    //设置偏移量
    rightButton.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, -10);
    
//    UIImageView * newView = [[UIImageView alloc]initWithFrame:CGRectMake(30, 15, 22*proportion_5, 22*proportion_5)];
//    newView.image = [UIImage imageNamed:@"daily_new"];
//    [rightButton addSubview:newView];
//        
//    UILabel * newLabel = [[UILabel alloc]initWithFrame:CGRectMake(80, 15, 80*proportion_5, 22*proportion_5)];
//    newLabel.text = @"最新";
//    newLabel.font = [UIFont systemFontOfSize:20];
//    newLabel.textColor = UIColorFromRGB(0x6c6b6b);
//    
//    [rightButton addSubview:newLabel];
//    
    [rightButton addTarget:self action:@selector(rightAction:) forControlEvents:UIControlEventTouchUpInside];
    [chooseBackGroundView addSubview:leftButton];
    [chooseBackGroundView addSubview:rightButton];
    
    //在UIView下画线
    UIView *bottomLine = [[UIView alloc]initWithFrame:CGRectMake(0,49, KScreenWidth, 1)];
    //
    _selectedLine = [[UIView alloc]initWithFrame:CGRectMake((KScreenWidth / 2 - 100 *proportion_5)/2, 50 - 4, 100 *proportion_5, 4)];
    _selectedLine.backgroundColor = UIColorFromRGB(0xfd990f);
    bottomLine.backgroundColor = UIColorFromRGB(0xbcb3af);
    [chooseBackGroundView addSubview:bottomLine];
    [chooseBackGroundView addSubview:_selectedLine];
//    _selectedLine.left += KScreenWidth / 2;
//    [self _creatTableView];
 
    //创建滑动视图
    _dailyScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 114, KScreenWidth, KScreenHeight-114-KTabBarHeight)];
    
    
    //创建滑动视图左边的tableView
    _leftTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, _dailyScrollView.height) style:UITableViewStylePlain];
    _leftTableView.backgroundColor = [UIColor redColor];

//    _leftTableView.backgroundColor = [UIColor clearColor];
    _leftTableView.delegate = self;
    _leftTableView.dataSource = self;
    
    //创建滑动视图右边的tableView
    _rightTableView = [[UITableView alloc]initWithFrame:CGRectMake(KScreenWidth, 0, KScreenWidth, _dailyScrollView.height) style:UITableViewStylePlain];
    _rightTableView.backgroundColor = [UIColor clearColor];
    _rightTableView.dataSource = self;
    _rightTableView.delegate = self;
    _rightTableView.backgroundColor = [UIColor yellowColor];
    [_dailyScrollView addSubview:_leftTableView];
    [_dailyScrollView addSubview:_rightTableView];
    
    
    //设置滑动视图的内容尺寸
    _dailyScrollView.contentSize = CGSizeMake(KScreenWidth *2,_leftTableView.height);
    //设置scrollView的背景颜色
    _dailyScrollView.backgroundColor = [UIColor clearColor];
    //是否分页滑动
    _dailyScrollView.pagingEnabled = YES;
    _dailyScrollView.bounces = NO;
    _dailyScrollView.delegate = self;
    //滑动时是否显示水平滚动条
    _dailyScrollView.showsHorizontalScrollIndicator = NO;
    //滑动时是否显示垂直滚动条
    _dailyScrollView.showsVerticalScrollIndicator = NO;


    [self.view addSubview:_dailyScrollView];
    
    
}

//左边按钮的点击事件
-(void)leftAction:(UIButton *)sender{

    

//        
        [UIView animateWithDuration:.25 animations:^{
//            _dailyScrollView.contentOffset = CGPointMake(0, 0);
            
            [_dailyScrollView scrollRectToVisible:_leftTableView.frame animated:NO];
            
            _selectedLine.left = (KScreenWidth / 2 - 100 *proportion_5)/2;
        }];

    
        

   

    
}
//右边按钮的点击事件
-(void)rightAction:(UIButton *)sender{
    

        [UIView animateWithDuration:.25 animations:^{
//            _dailyScrollView.contentOffset = CGPointMake(KScreenWidth, 0);
            
            [_dailyScrollView scrollRectToVisible:_rightTableView.frame animated:NO];
            
            _selectedLine.left = (KScreenWidth / 2 - 100 *proportion_5)/2 + KScreenWidth / 2;
            
            
        }];
    
    

  

}




-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if ([tableView isEqual:_leftTableView]) {
        return 10;
    }else if([tableView isEqual:_rightTableView]){
    
        return 10;
    }
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([tableView isEqual:_leftTableView]) {
        static NSString * identifer = @"dailycell";
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifer ];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
            cell.backgroundColor = [UIColor clearColor];
        }
        
        return cell;
    }else if([tableView isEqual:_rightTableView]){
        static NSString * identifer = @"dailycell";
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifer ];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
                    cell.backgroundColor = [UIColor clearColor];
        }
        
        return cell;
        
    }
    
    return nil;
}
#pragma mark --scrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if ([scrollView isMemberOfClass:[UIScrollView class]]) {
        
       _selectedLine.left = (KScreenWidth / 2 - 100 *proportion_5)/2 + scrollView.contentOffset.x / 2;
        
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
