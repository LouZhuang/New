//
//  YFLifeSupermarketsView.h
//  FDBigHealth
//
//  Created by 风鼎-叶烽 on 2018/3/2.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YFTool.h"

@protocol YFLifeDelegate <NSObject>

@optional

-(void)YFLifeIndex:(NSInteger)index tittleString:(NSString *)tittle;

@end


@interface YFLifeSupermarketsView : UIView<UITableViewDelegate,UITableViewDataSource>

/*
 tableview
 */
@property(nonatomic,strong)YFBaseTableView *YFTableView;

@property(nonatomic,strong)id<YFLifeDelegate>lifeDelegate;

-(instancetype)initWithFrame:(CGRect)frame scrocType:(NSInteger)type selectType:(NSInteger)select viewY:(float)Y tittleArray:(NSArray *)array  center:(BOOL)centerType;

/*
 弹出视图上
 */
@property(nonatomic,strong)UIView *upView;

/*
 弹出视图下
 */
@property(nonatomic,strong)UIView *downView;

/*
 弹出视图
 */
@property(nonatomic,strong)UIView *contentView;

/*
数组
 */
@property(nonatomic,strong)NSArray *tittleArray;

/*
 选择当前哪一行
 */
@property(nonatomic,assign)NSInteger type;
/*
 juzhong
 */
@property(nonatomic,assign)NSInteger Center;


@end
