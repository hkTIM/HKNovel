//
//  HMyVCView.h
//  HKNovel
//
//  Created by 黄坤 on 2016/11/10.
//  Copyright © 2016年 黄坤. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HomeMenuViewDelegate <NSObject>

-(void)LeftMenuViewClick:(NSInteger)tag;

@end

@interface HMyVCView : UIView

@property (nonatomic ,weak)id <HomeMenuViewDelegate> customDelegate;

@end
