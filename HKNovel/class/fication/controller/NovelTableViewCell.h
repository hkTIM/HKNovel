//
//  NovelTableViewCell.h
//  HKNovel
//
//  Created by 黄坤 on 2016/11/14.
//  Copyright © 2016年 黄坤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NovelTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *novelimage;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *author;
@property (weak, nonatomic) IBOutlet UILabel *Chapter;
@property (weak, nonatomic) IBOutlet UILabel *time;

@end
