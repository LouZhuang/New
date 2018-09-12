//
//  YFCreditRiskRatingCollectionViewCell.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/15.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YFTool.h"
#import "YFCreditRiskRatingTableViewCell.h"
@interface YFCreditRiskRatingCollectionViewCell : UICollectionViewCell<UITableViewDelegate,UITableViewDataSource>

/*
 header
 */
@property(nonatomic,strong)UIView *headerView;

/*
 headertittle
 */
@property(nonatomic,strong)UILabel *headerTittle;

/*
 tableview
 */
@property(nonatomic,strong)YFBaseTableView *YFTableView;


/*
 footer
 */
@property(nonatomic,strong)UIView *footerView;

/*
 上一题
 */
@property(nonatomic,strong)UIButton *OnATopicButton;

/*
 下一题
 */
@property(nonatomic,strong)UIButton *NextQuestionButton;



/*
选择答案
 */
@property(nonatomic,assign)NSInteger selectType;


-(void)setterHeaderString:(NSString *)header indexPathRow:(NSInteger)row;

@end
