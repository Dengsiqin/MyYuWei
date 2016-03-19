//
//  MineCell.m
//  MyYuWei
//
//  Created by 邓思琴 on 16/3/17.
//  Copyright © 2016年 邓思琴. All rights reserved.
//

#import "MineCell.h"

@implementation MineCell

- (void)awakeFromNib {
    // Initialization code
}


-(void)layoutSubviews{
    [super layoutSubviews];
    
    NSArray * itemImages = @[@"icon_mine_level",@"icon_mine_msg",@"icon_mine_chat",@"icon_onetime",@"icon_mine_list",@"icon_mine_collect",@"icon_mine_unFinished",@"icon_mine_setting",@"icon_mine_feedback"];
    
    NSArray * itemTitles = @[@"等级",@"通知",@"私信",@"一刻",@"清单",@"收藏",@"草稿",@"系统设置",@"意见反馈"];
    
    
    
    
    
    
    
    
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
