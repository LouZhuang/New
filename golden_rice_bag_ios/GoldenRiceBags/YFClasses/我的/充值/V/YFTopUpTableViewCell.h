//
//  YFTopUpTableViewCell.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/22.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseTableViewCell.h"

@interface YFTopUpTableViewCell : YFBaseTableViewCell<UITextFieldDelegate>
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
/*
 更换充值账户
 */
@property(nonatomic,strong)UIButton *changeTypeButton;

-(void)setterIndexPath:(NSInteger)row IndexSection:(NSInteger)section textString:(NSString *)text BankCardNumberString:(NSString *)bankCardNumber typeString:(NSString *)type payTypeString:(NSString *)payType;



@end
