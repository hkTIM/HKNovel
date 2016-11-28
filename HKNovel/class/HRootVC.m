//
//  HRootVC.m
//  HKNovel
//
//  Created by 黄坤 on 2016/11/10.
//  Copyright © 2016年 黄坤. All rights reserved.
//

#import "HRootVC.h"
#import "HSearchVC.h"
#import "HCampaignVC.h"
#import "HFicationVC.h"
#import "HNovelVC.h"
@interface HRootVC ()
@end

@implementation HRootVC

- (void)viewDidLoad {
    [super viewDidLoad];
    /** 设置文字属性 */
    // 设置普通状态下
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    // 统一设置所有item
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    // 设置选中状态下
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor blueColor];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    // 设置tabBar item ** 4个子视图
    [self setUpChildViewWith:[[UINavigationController alloc] initWithRootViewController:[[HNovelVC alloc]init]]Image:@"bookshelf" SelectedImage:@"bookshelf_clicked" Title:@""];
    
    [self setUpChildViewWith:[[UINavigationController alloc] initWithRootViewController:[[HCampaignVC alloc]init]] Image:@"selected" SelectedImage:@"selected_clicked" Title:@""];
    
    [self setUpChildViewWith:[[UINavigationController alloc] initWithRootViewController:[[HSearchVC alloc]init]] Image:@"booksearch" SelectedImage:@"booksearch_clicked" Title:@""];
    
    [self setUpChildViewWith:[[UINavigationController alloc] initWithRootViewController:[[HFicationVC alloc]init]] Image:@"classification" SelectedImage:@"classification_clicked" Title:@""];
    
    self.view.backgroundColor=[UIColor whiteColor];
    // Do any additional setup after loading the view.
}
// TabBarController添加子控制器
-(void)setUpChildViewWith:(UIViewController *)vc Image:(NSString *)image SelectedImage:(NSString *)selectedImage Title:(NSString *)title
{
    vc.tabBarItem.title = title;
    if (image.length) {
        vc.tabBarItem.image = [UIImage imageNamed:image];
        vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    }
    [self addChildViewController:vc];
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
