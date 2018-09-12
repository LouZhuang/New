//
//  YFMyInvitationView.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/4/16.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YFTool.h"
#import "SDAutoLayout.h"
#import "YFMyInvitationHeaderTableViewCell.h"
#import "YFSweepTheYardViewController.h"
#import "YFTheInvitationView.h"
@interface YFMyInvitationView : UIView<UITableViewDelegate,UITableViewDataSource>
/*
 tableview
 */
@property(nonatomic,strong)YFBaseTableView *YFTableView;
/*
imageView
 */
@property(nonatomic,strong)UIImageView *navImageView;

/*
 back
 */
@property(nonatomic,strong)UIButton *backButton;

/*
 tittle
 */
@property(nonatomic,strong)UILabel *tittleLabel;

/*
 subit
 */
@property(nonatomic,strong)UILabel *subitLabel;

/*
 number
 */
@property(nonatomic,strong)UILabel *numberLabel;

/*
 活动规则
 */
@property(nonatomic,strong)UIButton *pleaseButton;
@end
