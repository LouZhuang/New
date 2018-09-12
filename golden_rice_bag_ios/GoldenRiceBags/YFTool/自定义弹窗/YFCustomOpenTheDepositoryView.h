//
//  YFCustomOpenTheDepositoryView.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/15.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YFTool.h"



@protocol YFCustomOpenTheDepositoryDelegate <NSObject>

-(void)SuccessfulType:(NSInteger)type;//0立即开通1暂不考虑

@end

@interface YFCustomOpenTheDepositoryView : UIView

@property(nonatomic,weak)id<YFCustomOpenTheDepositoryDelegate>OpenTheDepositoryDelegate;
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
 image1
 */
@property(nonatomic,strong)UIImageView *midaiImageView;
/*
 image2
 */
@property(nonatomic,strong)UIImageView *hengFengImageView;

/*
 tittle
 */
@property(nonatomic,strong)UILabel *tittleLabel;

/*
 content
 */
@property(nonatomic,strong)UILabel *contentLabel;

/*
 detail
 */
@property(nonatomic,strong)UILabel *detailLabel;

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
