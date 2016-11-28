//
//  HFicationVC.m
//  HKNovel
//
//  Created by 黄坤 on 2016/11/10.
//  Copyright © 2016年 黄坤. All rights reserved.
//

#import "HFicationVC.h"
#import "ClassModel.h"
#import "NoveTc.h"
@interface HFicationVC ()<UITableViewDelegate,UITableViewDataSource>
@property (strong,nonatomic)UITableView *classTab;
@property (strong, nonatomic)NSArray *classArray;
@end

@implementation HFicationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"title_classification"]];
    self.classArray=[[NSArray alloc]init];
    self.classTab=[[UITableView alloc]initWithFrame:CGRectMake(0,0, self.view.hk_width, self.view.hk_height) style:UITableViewStylePlain];
    self.classTab.delegate=self;
    self.classTab.dataSource=self;
//    self.automaticallyAdjustsScrollViewInsets=YES;
    self.edgesForExtendedLayout = UIRectEdgeNone ;
    [self getdata];
    

    // Do any additional setup after loading the view.
}
-(void)getdata
{
    NSString *url=[NSString stringWithFormat:@"http://route.showapi.com/211-3"];
    NSDictionary *params=@{
                           @"showapi_appid":@"26406",
                           @"showapi_sign":@"758103f7053d416e95e1be38f6157732",
                           };
    [LoadingAnimationView loadingViewWithRect:CGRectMake(0, 0, self.view.hk_width, self.view.hk_height+64) OnView:self.view];
    [AppRequest postRequestInURL:url andParameters:params succes:^(id responseObject) {
     self.classArray=responseObject[@"showapi_res_body"][@"typeList"];
     [LoadingAnimationView hideFromView:self.view];
     [self.view addSubview:self.classTab];
        [self.classTab reloadData];
    NSLog(@"%@---%lu",self.classArray,(unsigned long)self.classArray.count);
     
 } stateerror:^(id responseObject) {
     
 } error:^(NSError *error) {
    NSLog(@"error==%@",error)
 } controller:self];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.classArray.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    NSDictionary *list=self.classArray[indexPath.section];
    cell.textLabel.text=list[@"name"];
//    NSString *id=list[@"id"];
//    cell.tag=id.integerValue;
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NoveTc *vc=[[NoveTc alloc]init];
    vc.tag=indexPath.section+1;
    UIBarButtonItem *bar = [[UIBarButtonItem alloc] initWithTitle:@" " style:0 target:nil action:nil];
    [self.navigationItem setBackBarButtonItem:bar];
    [self.navigationController pushViewController:vc animated:YES];
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
