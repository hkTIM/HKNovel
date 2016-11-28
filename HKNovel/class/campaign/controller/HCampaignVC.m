//
//  HCampaignVC.m
//  HKNovel
//
//  Created by 黄坤 on 2016/11/10.
//  Copyright © 2016年 黄坤. All rights reserved.
//

#import "HCampaignVC.h"
#import "LoadingAnimationView.h"
#import "novelVC.h"
@interface HCampaignVC ()<UIWebViewDelegate>
@property (strong ,nonatomic) UIWebView *HwebView;
@property (strong ,nonatomic) NSString *gid;
@end

@implementation HCampaignVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"featured"]];
    self.HwebView=[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.hk_width, self.view.hk_height)];
    _HwebView.delegate=self;
    _HwebView.scrollView.bounces = NO;
    [self.view addSubview:self.HwebView];
    NSString *urlStr=[NSString stringWithFormat:@"http://bookwebview.easou.com/ios/v1029/charge_books.m?udid=a41645580aac610f1bac49df998d0e592c9991f2&os=ios&osv=10.1.1&av=2.14.0&vc=1033&nt=&sp=A&ar=&ch=bnf1349_10388_001&pn=&pic=1&sessionId=-nE8J-eu-vZZO4cxHQVOOzJ "];
    NSString *newUrlStr = [urlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURL *url = [NSURL URLWithString:newUrlStr];
    
    // 2. 把URL告诉给服务器,请求,从m.baidu.com请求数据
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // 3. 发送请求给服务器
    [self.HwebView loadRequest:request];
    
    [LoadingAnimationView loadingViewWithRect:CGRectMake(0, 0, self.HwebView.hk_width, self.HwebView.hk_height+64) OnView:self.view];
    // Do any additional setup after loading the view.
}
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    //判断是否是单击
    if (navigationType == UIWebViewNavigationTypeOther)
    {
        NSURL *url = [request URL];
        [self smartURLForString:url.absoluteString];
        return YES;
    }
    return NO;
}

//思路:传入一个请求的URL,进行网络请求,如果返回失败信息则说明此URL不可用
//断传入的字符串是否符合HTTP路径的语法规则,即”HTTPS://” 或 “HTTP://” ,从封装的一个函数,传入即可判断
- (NSURL *)smartURLForString:(NSString *)str {
    NSURL *     result;
    NSString *  trimmedStr;
    NSRange     schemeMarkerRange;
    NSString *  scheme;
    assert(str != nil);
    result = nil;
    trimmedStr = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if ( (trimmedStr != nil) && (trimmedStr.length != 0) ) {
        schemeMarkerRange = [trimmedStr rangeOfString:@"://"];
        if (schemeMarkerRange.location == NSNotFound) {
            result = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@", trimmedStr]];
        } else {
            scheme = [trimmedStr substringWithRange:NSMakeRange(0, schemeMarkerRange.location)];
            assert(scheme != nil);
            if ( ([scheme compare:@"http"  options:NSCaseInsensitiveSearch] == NSOrderedSame)
                || ([scheme compare:@"https" options:NSCaseInsensitiveSearch] == NSOrderedSame) ) {
                NSLog(@"格式 合格");
//                result = [NSURL URLWithString:trimmedStr];
            } else {
                NSString *str2 = [str stringByRemovingPercentEncoding];
                NSLog(@"str2=%@",str2);
                NSArray *array = [str2 componentsSeparatedByString:@"{]"]; //从字符A中分隔成2个元素的数组
                NSLog(@"array:%@",array); //结果是adfsfsfs和dfsdf
                NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
                for (int i=0; i<array.count; i++) {
                    NSString *str=array[i];
                    NSRange range = [str rangeOfString:@"[}"];
                    if (range.length ==0)
                    {
                    }
                    else
                    {
                        NSArray *array1 = [str componentsSeparatedByString:@"[}"]; //从字符A中分隔成2个元素的数组
                        NSLog(@"array1:%@",array1);
                        [dic setValue:array1[1] forKey:array1[0]];
                    }
                }
                if (dic.count!=0)
                {
                    NSLog(@"dic=%@",dic);
                    novelVC *vc=[[novelVC alloc]init];
                    vc.gid=[dic valueForKey:@"gid"];
                    vc.nid=[dic valueForKey:@"nid"];
                    vc.position=[dic valueForKey:@"position"];
                    UIBarButtonItem *bar = [[UIBarButtonItem alloc] initWithTitle:@" " style:0 target:nil action:nil];
                    [self.navigationItem setBackBarButtonItem:bar];
                    [self.navigationController pushViewController:vc animated:YES];
//                    http://bookwebview.easou.com/ios/v1029/charge_secondView.m?pageId=18&pageName=男频&pageIndex=1&udid=a41645580aac610f1bac49df998d0e592c9991f2&os=ios&osv=10.1.1&av=2.14.1&sp=中国移动&ch=bnf1349_10388_001&pn=&pic=1&vc=1034&sessionId=-nE8J-eu-vZZO4cxHQVOOzJ&udid=a41645580aac610f1bac49df998d0e592c9991f2&os=ios&osv=10.1.1&av=2.14.1&vc=1034&nt=&sp=中国移动&ar=&ch=bnf1349_10388_001&pn=&pic=1&sessionId=-nE8J-eu-vZZO4cxHQVOOzJ
                }
            }
        }
    }
    
    return result;
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [LoadingAnimationView hideFromView:self.view];
    self.HwebView.hidden=NO;
}
#pragma  mark --  加载错误
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [LoadingAnimationView hideFromView:self.view];
//    self.HwebView.hidden=YES;
//    UIImageView *errorimage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.HwebView.hk_width, self.HwebView.hk_height+64)];
//    [errorimage setImage:[UIImage imageNamed:@"abnormalNet"]];
//    [self.view addSubview:errorimage];
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
