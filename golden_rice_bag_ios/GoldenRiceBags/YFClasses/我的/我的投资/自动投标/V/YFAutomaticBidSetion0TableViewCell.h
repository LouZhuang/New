//
//  YFAutomaticBidSetion0TableViewCell.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/23.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseTableViewCell.h"

@interface YFAutomaticBidSetion0TableViewCell : YFBaseTableViewCell<UITextFieldDelegate>
/*
 tittle
 */
@property(nonatomic,strong)UILabel *tittleLabel;
/*
 unit
 */
@property(nonatomic,strong)UILabel *unitLabel;


/*
 底部
 */
@property(nonatomic,strong)UIImageView *downImageView;

/*
 content
 */
@property(nonatomic,strong)UILabel *contentLabel;

/*
 content
 */
@property(nonatomic,strong)UILabel *openLabel;

/*
 state
 */
@property(nonatomic,strong)UIImageView *stateImageView;


/*
 UISwitch
 */
@property(nonatomic,strong)UISwitch *YFSwitch;
/*
 UISwitch
 */
@property(nonatomic,strong)UIButton *SwitchButton;

/*
 输入框
 */
@property(nonatomic,strong)UITextField *leftTextField;

/*
 输入框
 */
@property(nonatomic,strong)UITextField *rightTextField;

/*
 
 */
@property(nonatomic,strong)UIImageView *oneView;


-(void)setterUtilizationString:(NSString *)utilization stateType:(NSInteger)type;

/*
 section0 row1
 */

-(void)setterStion0:(NSInteger)row Type0:(NSInteger)type0 Type1:(NSInteger)type1;


/*
 section1
 */

-(void)setterStion1:(NSInteger)row string0:(NSString *)string0 string1:(NSString *)string1 string2:(NSString *)string2 string3:(NSString *)string3 string4:(NSString *)string4 string5:(NSString *)string5 string6:(NSString *)string6;
@end
