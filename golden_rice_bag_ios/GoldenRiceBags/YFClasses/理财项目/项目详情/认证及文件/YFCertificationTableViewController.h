//
//  YFCertificationTableViewController.h
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/21.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFMineTableViewController.h"
#import "DCCycleScrollView.h"
#import "YFHomePageRequest.h"

#import "YFCertificationModel.h"
@interface YFCertificationTableViewController : YFMineTableViewController<DCCycleScrollViewDelegate>
/*
 banner轮播
 */
@property(nonatomic,strong)DCCycleScrollView *YFBannerView;
@property(nonatomic,strong)NSString *projectDetailId;
@end
