//
//  YFCustomPopoverView.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/14.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YFTool.h"


@protocol YFCustomPopoverDelegate <NSObject>

-(void)CustomPopoverSuccessfulType:(NSInteger)type;//0立即评级1我先看看

@end


@interface YFCustomPopoverView : UIView
@property(nonatomic,strong)id<YFCustomPopoverDelegate>CustomPopoverDelegate;

/*
 弹出底部视图
 */
@property(nonatomic,strong)UIView *downView;

/*
 弹出视图
 */
@property(nonatomic,strong)UIView *popView;

/*
 图片
 */
@property(nonatomic,strong)UIImageView *imageView;
/*
 tittle
 */
@property(nonatomic,strong)UILabel *tittleLabel;

/*
 content
 */
@property(nonatomic,strong)UILabel *contentLabel;

/*
 yesButton
 */
@property(nonatomic,strong)UIButton *determineButton;

/*
 cancelButton
 */
@property(nonatomic,strong)UIButton *cancelButton;

-(void)remove;

@end
