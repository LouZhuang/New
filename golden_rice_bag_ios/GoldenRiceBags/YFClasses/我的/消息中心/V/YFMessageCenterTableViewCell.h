//
//  YFMessageCenterTableViewCell.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/20.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseTableViewCell.h"

@interface YFMessageCenterTableViewCell : YFBaseTableViewCell

/*
 image
 */
@property(nonatomic,strong)UIImageView *tittleImageView;

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


-(void)setterIndexPath:(NSInteger)row contentString:(NSString *)content timeString:(NSString *)time;

@end
