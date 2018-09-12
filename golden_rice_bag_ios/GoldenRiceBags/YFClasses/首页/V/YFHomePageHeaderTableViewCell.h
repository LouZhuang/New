//
//  YFHomePageHeaderTableViewCell.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/19.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseTableViewCell.h"
#import "PGGCarouselTextView.h"
#import "DCCycleScrollView.h"
#import "YFHomePageModel.h"
#import "YFSystemViewController.h"
#import "YFShufflingViewController.h"
@interface YFHomePageHeaderTableViewCell : YFBaseTableViewCell<PGGCarouselTextViewDelegate,DCCycleScrollViewDelegate>

/*
 底部主题色
 */
@property(nonatomic,strong)UIView *downView;
/*
 波浪
 */
@property(nonatomic,strong)UIImageView *theWavesImageView;
/*
 文字轮播
 */
@property(nonatomic,strong)PGGCarouselTextView *YFTextView;
/*
 banner轮播
 */
@property(nonatomic,strong)DCCycleScrollView *YFBannerView;

-(void)setterBanner:(NSMutableArray *)bannerArray;

-(void)setterTittle:(NSMutableArray *)tittleArray;



@end
