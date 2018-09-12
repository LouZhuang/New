//
//  YFUnbindBankCardTableViewCell.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/25.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseTableViewCell.h"

@interface YFUnbindBankCardTableViewCell : YFBaseTableViewCell

/*
 tittle
 */
@property(nonatomic,strong)UILabel *tittleLabel;


/*
 textfield
 */
@property(nonatomic,strong)UITextField *YFTextField;


-(void)setterIndex:(NSInteger)row nameString:(NSString *)name idString:(NSString *)YDId;

/*
 添加银行卡  
 */
-(void)setterIndex:(NSInteger)row nameString:(NSString *)name;
@end
