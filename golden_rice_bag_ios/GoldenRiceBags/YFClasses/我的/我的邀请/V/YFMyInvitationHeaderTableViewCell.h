//
//  YFMyInvitationHeaderTableViewCell.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/4/16.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseTableViewCell.h"

@interface YFMyInvitationHeaderTableViewCell : YFBaseTableViewCell


/*
 tittle
 */
@property(nonatomic,strong)UILabel *tittleLabel;
/*
 content
 */
@property(nonatomic,strong)UILabel *contentLabel;


/*
 one
 */
@property(nonatomic,strong)UILabel *oneNumberLabel;
/*
 two
 */
@property(nonatomic,strong)UILabel *twoNumberLabel;
/*
 one
 */
@property(nonatomic,strong)UILabel *oneLabel;
/*
 two
 */
@property(nonatomic,strong)UILabel *twoLabel;

/*
 fgImageView
 */
@property(nonatomic,strong)UIImageView *fgImageView;

/*
 rightimageView
 */
@property(nonatomic,strong)UIImageView *rightImageView;

/*
 erImageView
 */
@property(nonatomic,strong)UIImageView *erImageView;

-(void)setterIndexRow:(NSInteger)row;
@end
