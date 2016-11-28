//
//  NovelModel.h
//  HKNovel
//
//  Created by 黄坤 on 2016/11/25.
//  Copyright © 2016年 黄坤. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NovelModel : NSObject
@property (nonatomic,strong)NSString *name;
@property (nonatomic,strong)NSString *classes;
@property (nonatomic,strong)NSString *desc;
@property (nonatomic,strong)NSString *gid;
@property (nonatomic,strong)NSString *status;
@property (nonatomic,strong)NSString *category;
@property (nonatomic,strong)NSString *author;
@property (nonatomic,strong)NSString *nid;
@property (nonatomic,strong)NSString *collect;
@property (nonatomic,strong)NSString *site;
@property (nonatomic,strong)NSString *worcount;
@property (nonatomic,strong)NSString *price;
@property (nonatomic,strong)NSString *discount;
@property (nonatomic,strong)NSString *charge;
@property (nonatomic,strong)NSString *origiinprice;
@property (nonatomic,strong)NSString *img_url;
@property (nonatomic,strong)NSString *chargegid;
@property (nonatomic,strong)NSString *purchased;
@property (nonatomic,strong)NSString *tempfree;
@property (nonatomic,strong)NSString *topic_group_id;
@property (nonatomic,strong)NSString *topic_group_name;

@property (nonatomic,strong)NSString *last_time;
@property (nonatomic,strong)NSString *last_sort;
@property (nonatomic,strong)NSString *site_count;
@property (nonatomic,strong)NSString *last_chapter_name;
@property (nonatomic,strong)NSArray *rec_items;
@property (nonatomic,strong)NSArray *cate_book_items;
@property (nonatomic,strong)NSArray *author_book_items;
@property (nonatomic,strong)NSArray *topic_items;
@end
