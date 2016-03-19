//
//  OneTimeViewController.m
//  MyYuWei
//
//  Created by 邓思琴 on 16/3/15.
//  Copyright © 2016年 邓思琴. All rights reserved.
//

#import "OneTimeViewController.h"

@interface OneTimeViewController (){
    
    UITableView * _oneTimeTableVIew;
    
}




@end

@implementation OneTimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

   self.title = @"余味";
//    
//    UIImageView * titleImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 30/proportion_5, 25/proportion_5)];
//    titleImage.image = [UIImage imageNamed:@"white_logo"];
//    self.navigationItem.titleView = titleImage;
//

    
    [self _creatTableView];

}


-(void)_creatTableView{
    
    _oneTimeTableVIew = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _oneTimeTableVIew.delegate = self;
    _oneTimeTableVIew.dataSource = self;
    _oneTimeTableVIew.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:_oneTimeTableVIew];
    
    
    
}


//表视图的数据源方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 20;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 100;
    }
    
    
    return 65;
    
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * identifer = @"cell";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
    }
    
    
    return cell;
    
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
