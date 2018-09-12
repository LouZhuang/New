//
//  YFForgotPasswordTableViewCell.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/20.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseTableViewCell.h"
#import "TimeButton.h"
@interface YFForgotPasswordTableViewCell : YFBaseTableViewCell

/*
 tittle
 */
@property(nonatomic,strong)UILabel *tittleLabel;


/*
 textfield
 */
@property(nonatomic,strong)UITextField *YFTextField;

/*
 计时器
 */
@property(nonatomic,strong)TimeButton *timeButton;

-(void)setterIndex:(NSInteger)row nameString:(NSString *)name idString:(NSString *)YDId;

@end
