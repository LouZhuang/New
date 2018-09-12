//
//  YFAccountSecurityTableViewCell.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/20.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseTableViewCell.h"

@interface YFAccountSecurityTableViewCell : YFBaseTableViewCell

/*
 tittle
 */
@property(nonatomic,strong)UILabel *tittleLabel;

/*
 content
 */
@property(nonatomic,strong)UILabel *contentLabel;

/*
 right
 */
@property(nonatomic,strong)UIImageView *rightImageView;


/*
 修改按钮
 */
@property(nonatomic,strong)UIButton *changeButton;


-(void)setterIndex:(NSInteger)row certificationString:(NSString *)certification phoneString:(NSString *)phone;

@end
