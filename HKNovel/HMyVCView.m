//
//  HMyVCView.m
//  HKNovel
//
//  Created by 黄坤 on 2016/11/10.
//  Copyright © 2016年 黄坤. All rights reserved.
//
#define ImageviewWidth    18
#define Frame_Width       self.frame.size.width//200

#import "HMyVCView.h"

@interface HMyVCView ()<UITableViewDataSource,UITableViewDelegate>

@property (strong ,nonatomic)UIView *heardView;
@property (strong ,nonatomic)UITableView *listView;
@property (strong ,nonatomic)UIView *footView;

@end

@implementation HMyVCView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if(self = [super initWithFrame:frame]){
        [self initView];
    }
    return  self;
}

-(void)initView{
    //添加头部
    _heardView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Frame_Width, 90)];
    [_heardView setBackgroundColor:[UIColor whiteColor]];
    CGFloat width          = 90/2;
    UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(20, 30, width, width)];
    imageview.layer.cornerRadius = imageview.frame.size.width / 2;
    imageview.layer.masksToBounds = YES;
    [imageview setImage:[UIImage imageNamed:@"user"]];
    [_heardView addSubview:imageview];
    
    UILabel *NameLabel = [[UILabel alloc]initWithFrame:CGRectMake(imageview.frame.size.width + imageview.frame.origin.x * 2, imageview.frame.origin.y, 90, imageview.frame.size.height)];
    [NameLabel setText:@"隔壁LAOHK"];
    [_heardView addSubview:NameLabel];
    width =40;
    UIButton *myBtn=[[UIButton alloc]initWithFrame:CGRectMake(Frame_Width-40,35,width, width)];
    [myBtn setImage:[UIImage imageNamed:@"more"] forState:UIControlStateNormal];
    [_heardView addSubview:myBtn];
    UIButton *checkBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, Frame_Width, 90)];
    [checkBtn addTarget:self action:@selector(checkforUser) forControlEvents:UIControlEventTouchDown];
    [_heardView addSubview:checkBtn];
    [self addSubview:_heardView];
    
    //中间tableview
   _listView= [[UITableView alloc]initWithFrame:CGRectMake(0, self.heardView.frame.size.height, Frame_Width, self.frame.size.height - _heardView.frame.size.height * 2)style:UITableViewStylePlain];
    [_listView setBackgroundColor:[UIColor whiteColor]];
    _listView.dataSource          = self;
    _listView.delegate            = self;
    _listView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    [_listView setBackgroundColor:[UIColor whiteColor]];
    _listView.separatorStyle      = UITableViewCellSeparatorStyleNone;
    _listView.tableFooterView = [UIView new];
    [self addSubview:_listView];
    
    //添加尾部
    _footView = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height - _heardView.frame.size.height, Frame_Width,_heardView.frame.size.height)];
    [_footView setBackgroundColor:[UIColor whiteColor]];
    
    UIButton *SetBtn=[[UIButton alloc]initWithFrame:CGRectMake(10, 20, 100, 50)];
    [SetBtn setImage:[UIImage imageNamed:@"install"] forState:UIControlStateNormal];
    [SetBtn addTarget:self action:@selector(NovelSet) forControlEvents:UIControlEventTouchDown];
    [_footView addSubview:SetBtn];

    UIButton *sunBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sunBtn.frame=CGRectMake(Frame_Width -140, 20, 100, 50);
    [sunBtn setImage:[UIImage imageNamed:@"daytime"] forState:UIControlStateSelected];
    [sunBtn setImage:[UIImage imageNamed:@"nightime"] forState:UIControlStateNormal];
    [sunBtn addTarget:self action:@selector(selectIconButton:) forControlEvents:UIControlEventTouchDown];
    [_footView addSubview:sunBtn];
    
    [self addSubview:_footView];
}
#pragma mark --- 点击事件
//头像点击进入个人信息页
-(void)checkforUser
{
    NSLog(@"点击");
}
//点击进入设置界面
-(void)NovelSet
{
    
}
//点击切换白天or夜晚
- (void) selectIconButton:(UIButton *)sender
{
   sender.selected =!sender.selected;
}
#pragma mark - tableView delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section ==0) {
        return 3;
    }
    else if (section==1)
    {
        return 2;
    }
    else{
        return 1;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *str = [NSString stringWithFormat:@"LeftView%li",indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        
    }
    [cell setBackgroundColor:[UIColor whiteColor]];
    [cell.textLabel setTextColor:[UIColor grayColor]];
    cell.hidden = NO;
    switch (indexPath.section) {
        case 0:
        {
            switch (indexPath.row) {
                case 0:
                    [cell.imageView setImage:[UIImage imageNamed:@"gold"]];
                    [cell.textLabel setText:@"金币充值"];
                    break;
                case 1:
                    [cell.imageView setImage:[UIImage imageNamed:@"sign"]];
                    [cell.textLabel setText:@"签到抽奖"];
                    break;
                case 2:
                    [cell.imageView setImage:[UIImage imageNamed:@"circle"]];
                    [cell.textLabel setText:@"书友圈"];
                    break;
                default:
                    break;
            }
            
        }
            break;
            
        case 1:
        {
            
            switch (indexPath.row) {
                case 0:
                    [cell.imageView setImage:[UIImage imageNamed:@"footprint"]];
                    [cell.textLabel setText:@"我的足迹"];
                    break;
                case 1:
                    [cell.imageView setImage:[UIImage imageNamed:@"news"]];
                    [cell.textLabel setText:@"消息"];
                    break;
                default:
                    break;
            }
        }
            break;
            
            
        case 2:
        {
            
            [cell.imageView setImage:[UIImage imageNamed:@"opinion"]];
            [cell.textLabel setText:@"意见反馈"];
        }
            break;
        default:
            break;
    }
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
