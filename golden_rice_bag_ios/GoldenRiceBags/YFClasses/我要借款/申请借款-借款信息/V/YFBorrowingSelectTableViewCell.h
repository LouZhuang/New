//
//  YFBorrowingSelectTableViewCell.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/22.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseTableViewCell.h"
#import "MPTextView.h"
@interface YFBorrowingSelectTableViewCell : YFBaseTableViewCell
/*
 tittle
 */
@property(nonatomic,strong)UILabel *tittleLabel;
/*
 content
 */
@property(nonatomic,strong)UILabel *contentLabel;
/*
 输入框
 */
@property(nonatomic,strong)UITextField *YFtextField;
/*
 
 */
@property(nonatomic,strong)UIButton *firstButton;

/*

 */
@property(nonatomic,strong)UIButton *secondButton;

/*
 
 */
@property(nonatomic,strong)UIButton *threeButton;

/*
 输入框
 */
@property(nonatomic,strong)MPTextView *YF_TextView;


/*
 xiaimageView
 */
@property(nonatomic,strong)UIImageView *xiaImageView;

/*
 
 */
@property(nonatomic,strong)UIButton *selectButton;


-(void)setterIndexPath:(NSInteger)row selectType:(NSInteger)type;



/*
 section1
 */
-(void)setterSetionOneSelectType:(NSInteger)type;
/*
 section2
 */
-(void)setterSetionTwoRow:(NSInteger)row industryString:(NSString *)industry amountString:(NSString *)amount;
/*
 section3
 */
-(void)setterSetionThreeRow:(NSInteger)row SelectType:(NSMutableArray *)type textViewString:(NSString *)textView;
/*
 section4
 */
-(void)setterSetionFourRow:(NSInteger)row SelectType:(NSInteger)type lastType:(NSInteger)lasttype textFieldOneString:(NSString *)textFieldOne textFieldTwoString:(NSString *)textFieldTwo;



@end
