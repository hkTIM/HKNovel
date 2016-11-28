//
//  ClassModel.h
//  HKNovel
//
//  Created by 黄坤 on 2016/11/14.
//  Copyright © 2016年 黄坤. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClassModel : NSObject
@property(assign ,nonatomic)NSString *id;
@property(strong ,nonatomic)NSString *author;//作者
@property(strong ,nonatomic)NSString *name;//书名
@property(strong ,nonatomic)NSString *newchapter;//最新章节
@property(strong ,nonatomic)NSString *typename;//类别名
@property(strong ,nonatomic)NSString *updateTime;//最新跟新时间
@property(strong ,nonatomic)NSString *size;//大小
@end
