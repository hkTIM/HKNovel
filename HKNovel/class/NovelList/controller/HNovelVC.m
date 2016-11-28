//
//  HNovelVC.m
//  HKNovel
//
//  Created by 黄坤 on 2016/11/10.
//  Copyright © 2016年 黄坤. All rights reserved.
//

#import "HNovelVC.h"
#import "MenuView.h"
#import "HMyVCView.h"
#import "E_ScrollViewController.h"

@interface HNovelVC ()
@property (nonatomic ,strong)MenuView      *menu;

@end

@implementation HNovelVC

- (void)viewDidLoad {
    [super viewDidLoad];
     self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"easou"]];
//     设置左边按钮button
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"my"] style:UIBarButtonItemStylePlain target:self action:@selector(leftBtnClick)];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"bookShelfNoBook-1"] style:UIBarButtonItemStylePlain target:self action:@selector(rightBtnClick)];
    [self.navigationItem.leftBarButtonItem setTintColor:[UIColor blackColor]];
    [self.navigationItem.rightBarButtonItem setTintColor:[UIColor blackColor]];
    
    
    HMyVCView *demo = [[HMyVCView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width * 0.8, [[UIScreen mainScreen] bounds].size.height)];
    MenuView *menu = [MenuView MenuViewWithDependencyView:self.view MenuView:demo isShowCoverView:YES];
    self.menu = menu;
    // Do any additional setup after loading the view.
}
#pragma mark --- 导航栏按钮点击事件
-(void)leftBtnClick
{
    [self.menu show];
    NSLog(@"点击");
}
-(void)rightBtnClick
{
    NSLog(@"点击");
    E_ScrollViewController *loginvctrl = [[E_ScrollViewController alloc] init];
    [self presentViewController:loginvctrl animated:YES completion:nil];
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
