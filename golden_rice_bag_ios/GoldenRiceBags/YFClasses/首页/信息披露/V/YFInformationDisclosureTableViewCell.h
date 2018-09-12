//
//  YFInformationDisclosureTableViewCell.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/4/19.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseTableViewCell.h"

@interface YFInformationDisclosureTableViewCell : YFBaseTableViewCell


/*
 主标题
 */
@property(nonatomic,strong)UILabel *theTitleLabel;
/*
 标题
 */
@property(nonatomic,strong)UILabel *tittleLabel;


/*
 内容
 */
@property(nonatomic,strong)UILabel *contentLabel;

/*
 图片
 */
@property(nonatomic,strong)UIImageView *showImageView;

/*
 说明
 */
@property(nonatomic,strong)UILabel *instructionsLabel;

/*
 基本信息
 */
-(void)setterIndex:(NSInteger)section IndexPath:(NSInteger)row;

/*
 备案信息
 */
-(void)setterYFForTheRecordInformationIndex:(NSInteger)section IndexPath:(NSInteger)row;
@end
