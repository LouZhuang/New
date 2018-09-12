//
//  YFAboutTableViewCell.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/19.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseTableViewCell.h"

@interface YFAboutTableViewCell : YFBaseTableViewCell

/*
icon
 */
@property(nonatomic,strong)UIImageView *iconImageView;



/*
 tittle
 */
@property(nonatomic,strong)UILabel *tittleLabel;

/*
 content
 */
@property(nonatomic,strong)UILabel *contentLabel;

/*
 right
 */
@property(nonatomic,strong)UIImageView *rightImageView;

-(void)setterIndexPath:(NSInteger)row phoneString:(NSString *)phone urlString:(NSString *)url cooperationString:(NSString *)cooperation;

-(void)Icon;

@end
