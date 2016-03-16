//
//  DailySelectView.m
//  MyYuWei
//
//  Created by 邓思琴 on 16/3/16.
//  Copyright © 2016年 邓思琴. All rights reserved.
//

#import "DailySelectView.h"


#define KScreenWidth [UIScreen mainScreen].bounds.size.width


@implementation DailySelectView

-(void)layoutSubviews{
    [super layoutSubviews];
    
    _dailySelectTitle = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, 20, 5)];
    _dailySelectTitle.text = [NSString stringWithFormat:@"每日精选"];
    
    
    _titleContent = [[UILabel alloc]initWithFrame:CGRectMake(5, 12, 25, 4)];
    _titleContent.text = [NSString stringWithFormat:@"此刻风味正好"];
    
    
    _image = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 1, 5)];
    _image.backgroundColor = [UIColor orangeColor];;
    
    
    _dailyButton = [[UIButton alloc]initWithFrame:CGRectMake(5, 20, KScreenWidth - 10 ,200 )];
    
    
    
}





@end
