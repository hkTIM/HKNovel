//
//  NoveTc.m
//  HKNovel
//
//  Created by 黄坤 on 2016/11/14.
//  Copyright © 2016年 黄坤. All rights reserved.
//

#import "NoveTc.h"
#import "ClassModel.h"
#import "NovelTableViewCell.h"
@interface NoveTc ()<UITableViewDelegate,UITableViewDataSource>

@property (strong ,nonatomic) UITableView *novelTab;
@property (strong ,nonatomic) NSMutableArray *novelList;
@property (assign ,nonatomic) NSInteger page;
@property (assign ,nonatomic) NSArray *array;
@end

@implementation NoveTc

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor clearColor];
    self.novelTab=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.hk_width, self.view.hk_height-110)];
    self.novelTab.delegate=self;
    self.novelTab.dataSource=self;
    self.novelList=[[NSMutableArray alloc]init];
    self.edgesForExtendedLayout = UIRectEdgeNone ;
    self.title=@"书单";
    self.page=1;
    self.novelTab.mj_footer=[MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(refreshFooter)];
    [self getdata];
  
    // Do any additional setup after loading the view.
}
-(void)refreshFooter
{
    _page++;
    [self.novelTab reloadData];
    [self.novelTab.mj_footer endRefreshing];
    [self getdata];
}
-(void)getdata
{
    NSString *url=[NSString stringWithFormat:@"http://route.showapi.com/211-2"];
    NSDictionary *params=@{
                           @"showapi_appid":@"26406",
                           @"showapi_sign":@"758103f7053d416e95e1be38f6157732",
                           @"typeId":@(self.tag),
                           @"page":@(self.page)
                           };
    [LoadingAnimationView loadingViewWithRect:CGRectMake(0, 0, self.view.hk_width, self.view.hk_height+64) OnView:self.view];
    [AppRequest postRequestInURL:url andParameters:params succes:^(id responseObject) {
        [LoadingAnimationView hideFromView:self.view];

        self.array=responseObject[@"showapi_res_body"][@"pagebean"][@"contentlist"];
        for (int i=0; i<self.array.count; i++) {
            NSDictionary *dic=self.array[i];
            ClassModel *model=[[ClassModel alloc]init];
            model.id=dic[@"id"];
            model.author=dic[@"author"];
            model.name=dic[@"name"];
            model.newchapter=dic[@"newChapter"];
            model.typename=dic[@"typeName"];
            model.updateTime=dic[@"updateTime"];
            model.size=dic[@"size"];
            [self.novelList addObject:model];
        }
        [self.view addSubview:self.novelTab];
    } stateerror:^(id responseObject) {
        
    } error:^(NSError *error) {
        NSLog(@"error==%@",error)
    } controller:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.novelList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"NovelTableViewCell";
    NovelTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell=[[[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:self options:nil] lastObject];
    }
    ClassModel *nvel;
    nvel =self.novelList[indexPath.section]; //由于无法直接赋值 需要声明个字符串
    cell.name.text=nvel.name;
    [cell.name setFont:[UIFont systemFontOfSize:17]];
    NSString *str=[NSString stringWithFormat:@"作者:%@",nvel.author];
    cell.author.text=str;
    [cell.author setFont:[UIFont systemFontOfSize:15]];
    NSString *str1=[NSString stringWithFormat:@"最新章节:%@",nvel.newchapter];
    cell.Chapter.text=str1;
    NSString *str2=[NSString stringWithFormat:@"更新时间:%@",nvel.updateTime];
    cell.time.text=str2;
    [cell.novelimage sd_setImageWithURL:NULL placeholderImage:[UIImage imageNamed:@"bok_default_pic"]];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 130;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
