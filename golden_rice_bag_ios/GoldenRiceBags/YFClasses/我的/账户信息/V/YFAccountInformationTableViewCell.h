//
//  YFAccountInformationTableViewCell.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/19.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBaseTableViewCell.h"

@interface YFAccountInformationTableViewCell : YFBaseTableViewCell

/*
 头像
 */
@property(nonatomic,strong)UIImageView *headImageView;

/*
 姓名
 */
@property(nonatomic,strong)UILabel *nameLabel;

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


-(void)nickNameString:(NSString *)nickName;

/*
 测评状态
 */
-(void)indexPath:(NSInteger)row measurementString:(NSString *)measurement;


/*
 版本
 */
-(void)indexPath:(NSInteger)row versionString:(NSString *)version;
/*
 退出登录
 */
-(void)indexPath:(NSInteger)row loginOutString:(NSString *)loginOut;

@end
