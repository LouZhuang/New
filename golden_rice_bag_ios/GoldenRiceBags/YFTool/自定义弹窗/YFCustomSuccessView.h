//
//  YFCustomSuccessView.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/14.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YFTool.h"

@interface YFCustomSuccessView : UIView

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
-(void)remove;

@end
