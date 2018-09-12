//
//  YFMineBnakCardTableViewCell.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/25.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseTableViewCell.h"
#import "YFMineBnakCardModel.h"
@interface YFMineBnakCardTableViewCell : YFBaseTableViewCell
/*
 tittle
 */
@property(nonatomic,strong)UILabel *tittleLabel;

/*
 right
 */
@property(nonatomic,strong)UIImageView *rightImageView;

/*
 Down
 */
@property(nonatomic,strong)UIImageView *DownImageView;

/*
 bankName
 */
@property(nonatomic,strong)UILabel *bankNameLabel;

/*
 bankType
 */
@property(nonatomic,strong)UILabel *bankTypeLabel;

/*
 bankcardNumber
 */
@property(nonatomic,strong)UILabel *bankcardNumberLabel;

-(void)setterSction:(NSInteger)section MineBnakCardModel:(YFMineBnakCardModel *)model;

@end
