//
//  HSearchVC.m
//  HKNovel
//
//  Created by 黄坤 on 2016/11/10.
//  Copyright © 2016年 黄坤. All rights reserved.
//

#import "HSearchVC.h"

@interface HSearchVC ()<UISearchBarDelegate>
@property (strong ,nonatomic)UISearchBar *searchBar;
@end

@implementation HSearchVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.view.hk_width*0.9, 30)];
    
    _searchBar.backgroundImage = [UIImage imageNamed:@"btu_search"];
    
    _searchBar.placeholder = @"搜索";
    
    _searchBar.delegate = self;

    UIBarButtonItem *searchButton = [[UIBarButtonItem alloc]initWithCustomView:_searchBar];
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObject:searchButton];
    
    
    UITapGestureRecognizer *tapGr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    tapGr.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapGr];
    // Do any additional setup after loading the view.
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    NSLog(@"asd");
}
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    searchBar.text = @"";
    [searchBar resignFirstResponder];
}

-(void)viewTapped:(UITapGestureRecognizer*)tapGr
{
    [self.searchBar resignFirstResponder];
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
