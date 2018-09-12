//
//  YFOpenASavingsAccountTableViewCell.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/14.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseTableViewCell.h"
#import "TimeButton.h"
@interface YFOpenASavingsAccountTableViewCell : YFBaseTableViewCell

#warning section0
/*
 image1
 */
@property(nonatomic,strong)UIImageView *midaiImageView;
/*
 image2
 */
@property(nonatomic,strong)UIImageView *hengFengImageView;

#warning section1
/*
 tittle
 */
@property(nonatomic,strong)UILabel *tittleLabel;

/*
 输入框
 */
@property(nonatomic,strong)UITextField *YFtextField;

#warning section2

/*
 支持银行及限额说明按钮  什么是授权服务按钮
 */
@property(nonatomic,strong)UIButton *detailButton;

#warning section2

/*
 授权投标
 */
@property(nonatomic,strong)UILabel *tenderLabel;

/*
 授权还款
 */
@property(nonatomic,strong)UILabel *reimbursementLabel;

/*
 分割线
 */
@property(nonatomic,strong)UIView *segmentationView;

/*
 说明
 */
@property(nonatomic,strong)UILabel *instructionsLabel;

/*
 天 元
 */
@property(nonatomic,strong)UILabel *tianYuanLabel;

/*
 计时器
 */
@property(nonatomic,strong)TimeButton *timeButton;


/*
 section 和 row
 */
-(void)setterSection:(NSInteger )section indexPath:(NSInteger)row;

@end
