//
//  YFChangeLoginPasswordTableViewCell.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/20.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseTableViewCell.h"

@interface YFChangeLoginPasswordTableViewCell : YFBaseTableViewCell

/*
 tittle
 */
@property(nonatomic,strong)UILabel *tittleLabel;


/*
 textfield
 */
@property(nonatomic,strong)UITextField *YFTextField;

-(void)setterIndex:(NSInteger)row;

-(void)setterForgotPasswordChangeIndex:(NSInteger)row;

@end
