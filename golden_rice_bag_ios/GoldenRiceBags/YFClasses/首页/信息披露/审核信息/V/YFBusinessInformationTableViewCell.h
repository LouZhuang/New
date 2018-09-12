//
//  YFBusinessInformationTableViewCell.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/4/20.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseTableViewCell.h"

@interface YFBusinessInformationTableViewCell : YFBaseTableViewCell
/*
 标题
 */
@property(nonatomic,strong)UILabel *tittleLabel;
/*
 rightimageView
 */
@property(nonatomic,strong)UIImageView *rightImageView;


/*
 副标题1
 */
@property(nonatomic,strong)UILabel *tittleOneLabel;
/*
 副标题2
 */
@property(nonatomic,strong)UILabel *tittleTwoLabel;
/*
 副标题3
 */
@property(nonatomic,strong)UILabel *tittleThreeLabel;
/*
 副标题4
 */
@property(nonatomic,strong)UILabel *tittleFourLabel;


/*
 内容1
 */
@property(nonatomic,strong)UILabel *contentOneLabel;
/*
 内容2
 */
@property(nonatomic,strong)UILabel *contentTwoLabel;
/*
 内容3
 */
@property(nonatomic,strong)UILabel *contentThreeLabel;
/*
 内容4
 */
@property(nonatomic,strong)UILabel *contentFourLabel;

/*
 
 */
@property(nonatomic,strong)UILabel *listOneLabel;
/*

 */
@property(nonatomic,strong)UILabel *listTwoLabel;

/*
 审核信息
 */
-(void)setterIndex:(NSInteger)section;

/*
 经营信息
 */
-(void)setterBusinessInformationIndex:(NSInteger)section IndexPath:(NSInteger)row;

/*
 重大事项
 */
-(void)setterImportantMattersIndex:(NSInteger)section;
/*
 法律法规
 */
-(void)setterLawsAndRegulationsIndex:(NSInteger)section;
/*
 消费者咨询及投诉渠道
 */
-(void)setterConsultingTheComplaintIndex:(NSInteger)section indexPath:(NSInteger)row;
/*
 去年公示
 */
-(void)setterLastYearThePublicIndex:(NSInteger)section;
@end
