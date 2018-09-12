//
//  YFAOneTimeViewController.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/22.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseViewController.h"
#import "YFReimbursementMeansTableViewCell.h"
@interface YFAOneTimeViewController : YFBaseViewController
/*
 size借款月数  整数
 */
@property(nonatomic,strong)NSString *sizeString;

/*
 principal借款金额
 */
@property(nonatomic,strong)NSString *principalString;
@end
