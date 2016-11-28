//
//  heardTableViewCell.m
//  HKNovel
//
//  Created by 黄坤 on 2016/11/24.
//  Copyright © 2016年 黄坤. All rights reserved.
//

#import "heardTableViewCell.h"

@implementation heardTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.save.layer setBorderColor:[UIColor redColor].CGColor];
    [self.read.layer setBorderColor:[UIColor blackColor].CGColor];
    [self.golist.layer setBorderColor:[UIColor blackColor].CGColor];
    [self.save.layer setBorderWidth:1];
    [self.read.layer setBorderWidth:1];
    [self.golist.layer setBorderWidth:1];
    [self.save.layer setMasksToBounds:YES];
    [self.read.layer setMasksToBounds:YES];
    [self.golist.layer setMasksToBounds:YES];
    // Initialization code
}
- (IBAction)gonovelList:(UIButton *)sender {
    NSLog(@"sss");
}
- (IBAction)readNovel:(UIButton *)sender {
    NSLog(@"sss");
}
- (IBAction)save:(UIButton *)sender {
    NSLog(@"sss");
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
