//
//  YFBorrowingHeaderTableViewCell.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/22.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseTableViewCell.h"

@interface YFBorrowingHeaderTableViewCell : YFBaseTableViewCell


/*
 image
 */
@property(nonatomic,strong)UIImageView *tittleImageView;

/*
 借款信息
 */
@property(nonatomic,strong)UIButton *borrowingInformationButton;

/*
认证及文件
 */
@property(nonatomic,strong)UIButton *certificationButton;

/*
完成
 */
@property(nonatomic,strong)UIButton *completeButton;



/*
 tittle
 */
@property(nonatomic,strong)UILabel *tittleLabel;

/*
 sectionImageView
 */
@property(nonatomic,strong)UIImageView *sectionImageView;


-(void)setterIndexPath:(NSInteger)row selectType:(NSInteger)type tittleString:(NSString *)string;

@end
