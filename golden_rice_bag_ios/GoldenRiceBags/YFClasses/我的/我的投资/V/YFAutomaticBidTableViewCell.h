//
//  YFAutomaticBidTableViewCell.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/20.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseTableViewCell.h"
#import "YFAutomaticBidViewController.h"
@interface YFAutomaticBidTableViewCell : YFBaseTableViewCell


/*
 tittle
 */
@property(nonatomic,strong)UILabel *tittleLabel;

/*
 tittleImageView
 */
@property(nonatomic,strong)UIImageView *tittleImageView;

/*
 底部
 */
@property(nonatomic,strong)UIImageView *downImageView;


/*
 button
 */
@property(nonatomic,strong)UIButton *settingButton;


/*
 content
 */
@property(nonatomic,strong)UILabel *contentLabel;

/*
 content
 */
@property(nonatomic,strong)UILabel *openLabel;

/*
 state
 */
@property(nonatomic,strong)UIImageView *stateImageView;

-(void)setterUtilizationString:(NSString *)utilization stateType:(NSInteger)type;

@end
