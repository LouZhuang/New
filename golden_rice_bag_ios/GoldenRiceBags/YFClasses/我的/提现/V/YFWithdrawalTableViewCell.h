//
//  YFWithdrawalTableViewCell.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/22.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseTableViewCell.h"

@interface YFWithdrawalTableViewCell : YFBaseTableViewCell

/*
 tittle
 */
@property(nonatomic,strong)UILabel *tittleLabel;
/*
 content
 */
@property(nonatomic,strong)UILabel *contentLabel;

/*
 number
 */
@property(nonatomic,strong)UILabel *numberLabel;

/*
 输入框
 */
@property(nonatomic,strong)UITextField *YFtextField;
/*
 更换银行卡
 */
@property(nonatomic,strong)UIButton *changeButton;

-(void)setterIndexPath:(NSInteger)row IndexSection:(NSInteger)section textString:(NSString *)text poundageString:(NSString *)poundage totalString:(NSString *)total BankCardNumberString:(NSString *)bankCardNumber;


@end
