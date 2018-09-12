//
//  YFCapitalSubsidiaryDetailViewController.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/24.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseViewController.h"
#import "YFCapitalSubsidiaryDetailTableViewCell.h"
#import "YFCapitalSubsidiaryModel.h"
@interface YFCapitalSubsidiaryDetailViewController : YFBaseViewController

/*
 类型
 */
@property(nonatomic,strong)NSString *type;
@property(nonatomic,strong)YFCapitalSubsidiaryModel *detailModel;
@end
