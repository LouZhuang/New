//
//  YFBorrowingOtherTableViewCell.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/22.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseTableViewCell.h"
#import "MPTextView.h"
@interface YFBorrowingOtherTableViewCell : YFBaseTableViewCell

/*
 标题
 */

@property(nonatomic,strong)UILabel *tittleLabel;


/*
 内容
 */

@property(nonatomic,strong)UILabel *contentLabel;


/*
 rightimageView
 */
@property(nonatomic,strong)UIImageView *rightImageView;


/*
 xiaimageView
 */
@property(nonatomic,strong)UIImageView *xiaImageView;

/*
 输入框
 */
@property(nonatomic,strong)MPTextView *YF_TextView;

/*
 输入框
 */
@property(nonatomic,strong)UITextField *YFtextField;


@property(nonatomic,strong)UIButton *firstButton;

/*
 
 */
@property(nonatomic,strong)UIButton *secondButton;
/*
 
 */
@property(nonatomic,strong)UIButton *selectButton;

-(void)setterIndex:(NSInteger)row indexSection:(NSInteger)section oneString:(NSString *)one twoString:(NSString *)two threeString:(NSString *)three textViewString:(NSString *)textView textFieldString:(NSString *)textField typeString:(NSInteger)type;

@end
