//
//  YFMyInvitationTableViewCell.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/4/16.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseTableViewCell.h"

@interface YFMyInvitationTableViewCell : YFBaseTableViewCell
/*
 tittle
 */
@property(nonatomic,strong)UILabel *tittleLabel;

/*
 content
 */
@property(nonatomic,strong)UILabel *contentLabel;

/*
 time
 */
@property(nonatomic,strong)UILabel *timeLabel;
@end
