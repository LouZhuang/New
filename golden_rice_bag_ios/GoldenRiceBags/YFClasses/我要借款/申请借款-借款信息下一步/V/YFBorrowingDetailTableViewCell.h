//
//  YFBorrowingDetailTableViewCell.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/22.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseTableViewCell.h"

@interface YFBorrowingDetailTableViewCell : YFBaseTableViewCell<UITextFieldDelegate>

/*
 tittle
 */
@property(nonatomic,strong)UILabel *tittleLabel;

/*
 content
 */
@property(nonatomic,strong)UILabel *contentLabel;


/*
 rightimageView
 */
@property(nonatomic,strong)UIImageView *rightImageView;

/*
 输入框
 */
@property(nonatomic,strong)UITextField *YFTextField;

-(void)setterIndex:(NSInteger)row moneyString:(NSString *)money TimeLimitString:(NSString *)timeLimit yearsString:(NSString *)years type:(NSInteger)type;

@end
