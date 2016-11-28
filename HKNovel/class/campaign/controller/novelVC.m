//
//  novelVC.m
//  HKNovel
//
//  Created by 黄坤 on 2016/11/24.
//  Copyright © 2016年 黄坤. All rights reserved.
//

#import "novelVC.h"
#import "heardTableViewCell.h"
#import "NovelModel.h"
#import "introduceTCell.h"
@interface novelVC ()<UITableViewDataSource,UITableViewDelegate>
@property (strong ,nonatomic)NovelModel *manger;
@property (strong ,nonatomic)UITableView *listView;

@end

@implementation novelVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"书籍封面";
    self.navigationController.navigationBar.tintColor = [UIColor lightGrayColor];
    self.listView=[[UITableView alloc]initWithFrame:CGRectMake(0,0, self.view.hk_width, self.view.hk_height)];
    self.listView.delegate=self;
    self.listView.dataSource=self;
    self.edgesForExtendedLayout = UIRectEdgeNone ;
    self.manger=[[NovelModel alloc]init];
    [self getdate];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)getdate
{
    NSString *url=[NSString stringWithFormat:@"http://api.easou.com/api/bookapp/cover.m"];
    NSDictionary *params=@{
                           @"gid":self.gid,
                           @"cid":@"eef_",
                           @"version":@"002",
                           @"os":@"ios",
                           @"udid":@"a41645580aac610f1bac49df998d0e592c9991f2",
                           @"appverion":@"1033",
                           @"ch":@"bnf1349_10388_001",
                           @"session_id":@"-nE8J-eu-vZZO4cxHQVOOzJ",
                           @"statId":@"HOKlfiUctntCy9rBM2Uc"
                           };
    [LoadingAnimationView loadingViewWithRect:CGRectMake(0, 0, self.view.hk_width, self.view.hk_height+64) OnView:self.view];
    [AppRequest getRequestInURL:url andParameters:params succes:^(id responseObject) {
        self.manger.name=responseObject[@"name"];
        self.manger.classes=responseObject[@"classes"];
        self.manger.desc=responseObject[@"desc"];
        self.manger.gid=responseObject[@"gid"];
        self.manger.status=responseObject[@"status"];
        self.manger.category=responseObject[@"category"];
        self.manger.author=responseObject[@"author"];
        self.manger.nid=responseObject[@"nid"];
        self.manger.collect=responseObject[@"collect"];
        self.manger.site=responseObject[@"site"];
        self.manger.worcount=responseObject[@"worcount"];
        self.manger.price=responseObject[@"price"];
        self.manger.discount=responseObject[@"discount"];
        self.manger.charge=responseObject[@"charge"];
        self.manger.origiinprice=responseObject[@"origiinprice"];
        self.manger.img_url=responseObject[@"img_url"];
        self.manger.chargegid=responseObject[@"chargegid"];
        self.manger.purchased=responseObject[@"purchased"];
        self.manger.tempfree=responseObject[@"tempfree"];
        self.manger.topic_group_id=responseObject[@"topic_group_id"];
        self.manger.topic_group_name=responseObject[@"topic_group_name"];
        self.manger.last_time=responseObject[@"last_time"];
        self.manger.last_sort=responseObject[@"last_sort"];
        self.manger.site_count=responseObject[@"site_count"];
        self.manger.last_chapter_name=responseObject[@"last_chapter_name"];
        self.manger.rec_items=responseObject[@"rec_items"];
        self.manger.cate_book_items=responseObject[@"cate_book_items"];
        self.manger.author_book_items=responseObject[@"author_book_items"];
        self.manger.topic_items=responseObject[@"topic_items"];
        [self.listView reloadData];
        [LoadingAnimationView hideFromView:self.view];
        [self.view addSubview:self.listView];
        NSLog(@"sss");
    } stateerror:^(id responseObject) {
        
    } error:^(NSError *error) {
        NSLog(@"error==%@",error)
    } controller:self];

}
#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *heardTableViewCellIdf = @"heardTableViewCell";
    static NSString *introduceTCellIdf = @"introduceTCell";
    if (indexPath.section==0)
    {
        if (indexPath.row==0)
        {
            heardTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:heardTableViewCellIdf];
            if (cell == nil) {
                cell=[[[NSBundle mainBundle] loadNibNamed:heardTableViewCellIdf owner:self options:nil] lastObject];
            }
            if (self.manger.status.integerValue==1) {
                cell.type.text=[NSString stringWithFormat:@"%@ - 连载中",self.manger.category];
            }
            else
            {
                cell.type.text=[NSString stringWithFormat:@"%@ - 已完结",self.manger.category];
            }
            cell.name.text=self.manger.name;
            cell.author.text=[NSString stringWithFormat:@"作者:%@",self.manger.author ];
            NSDate *detaildate=[NSDate dateWithTimeIntervalSince1970:[self.manger.last_time doubleValue] / 1000];
            NSDateFormatter*dateFormatter = [[NSDateFormatter alloc]init];
            //设定时间格式,这里可以设置成自己需要的格式
            [dateFormatter setDateFormat:@"yyyy-MM-dd"];
            NSString*currentDateStr = [dateFormatter stringFromDate:detaildate];
            cell.updateTime.text=[NSString stringWithFormat:@"更新:%@",currentDateStr];
            cell.money.text=[NSString stringWithFormat:@"价格:%@金币/千字",self.manger.price];
            NSURL *url=[NSURL URLWithString:self.manger.img_url];
            [cell.bookImage sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"bok_default_pic"]];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.separatorInset=UIEdgeInsetsMake(0, 0, 0, 0);
            return cell;
        }
        else
        {
//            introduceTCell *cell = [tableView dequeueReusableCellWithIdentifier:introduceTCellIdf];
//            if (cell == nil) {
//                cell=[[[NSBundle mainBundle] loadNibNamed:introduceTCellIdf owner:self options:nil] lastObject];
//            }
//                NSString *str=[NSString stringWithFormat:@"[最新] %@",self.manger.last_chapter_name];
//                NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:str];
//                [AttributedStr addAttribute:NSForegroundColorAttributeName
//                                      value:[UIColor redColor]
//                                      range:NSMakeRange(0, 4)];
//                cell.lastLab.attributedText = AttributedStr;
//                [cell.lastBtn setBackgroundColor:[UIColor lightGrayColor]];
//                cell.prceLab.lineBreakMode = NSLineBreakByCharWrapping;
//                cell.prceLab.numberOfLines = 0;
//                cell.prceLab.text=self.manger.desc;
//                return cell;
        }
    }
    else
    {
        
    }
    return Nil;
   }
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 180;
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
