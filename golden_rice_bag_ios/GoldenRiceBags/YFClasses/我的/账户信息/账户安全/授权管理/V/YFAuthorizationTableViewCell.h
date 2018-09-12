//
//  YFAuthorizationTableViewCell.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/20.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseTableViewCell.h"

@interface YFAuthorizationTableViewCell : YFBaseTableViewCell

/*
 tittle
 */
@property(nonatomic,strong)UILabel *tittleLabel;
//
///*
// UISwitch
// */
//@property(nonatomic,strong)UISwitch *YFSwitch;

/*
 UISwitch
 */
@property(nonatomic,strong)UIButton *SwitchButton;

-(void)setterindexPath:(NSInteger)row SwitchButtonFirst:(NSInteger)firstType SwitchButtonSecond:(NSInteger)secondType switchcReitAssignment:(NSInteger )reitAssignment;

@end
