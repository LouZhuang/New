//
//  YFChangeThePaymentPasswordTableViewCell.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/4/10.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseTableViewCell.h"

@interface YFChangeThePaymentPasswordTableViewCell : YFBaseTableViewCell


/*
 tittle
 */
@property(nonatomic,strong)UILabel *tittleLabel;

/*
 rightimageView
 */
@property(nonatomic,strong)UIImageView *rightImageView;

-(void)setterIndexRow:(NSInteger)row;

@end
