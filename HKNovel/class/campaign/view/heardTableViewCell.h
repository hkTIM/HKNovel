//
//  heardTableViewCell.h
//  HKNovel
//
//  Created by 黄坤 on 2016/11/24.
//  Copyright © 2016年 黄坤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface heardTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *bookImage;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *type;
@property (weak, nonatomic) IBOutlet UILabel *author;
@property (weak, nonatomic) IBOutlet UILabel *updateTime;
@property (weak, nonatomic) IBOutlet UILabel *money;

/**************************** 分割线 ****************************/
@property (weak, nonatomic) IBOutlet UIButton *golist;
@property (weak, nonatomic) IBOutlet UIButton *read;
@property (weak, nonatomic) IBOutlet UIButton *save;


@end
