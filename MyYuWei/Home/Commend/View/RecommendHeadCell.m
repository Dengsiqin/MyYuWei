//
//  RecommendHeadCell.m
//  MyYuWei
//
//  Created by 邓思琴 on 16/3/29.
//  Copyright © 2016年 邓思琴. All rights reserved.
//

#import "RecommendHeadCell.h"

@implementation RecommendHeadCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat width = self.width - 10;
        _iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, width, width)];
        _iconImageView.contentMode = UIViewContentModeScaleAspectFit;
        _icontitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, _iconImageView.bottom, self.width, self.height - self.width - 5)];
        
        _icontitleLabel.font = [UIFont systemFontOfSize:13];
        _icontitleLabel.textColor = [UIColor whiteColor];
//        _icontitleLabel.backgroundColor = [UIColor redColor];
        _icontitleLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_iconImageView];
        [self.contentView addSubview:_icontitleLabel];
//        self.contentView.backgroundColor = [UIColor yellowColor];
    }
    return self;
}

-(void)setImageName:(NSString *)imageName{
    
    _imageName = imageName;
    
    _iconImageView.image = [UIImage imageNamed:_imageName];
}
-(void)setTitle:(NSString *)title{
    
    _title = title;
    
    _icontitleLabel.text = _title;
    
}

@end
