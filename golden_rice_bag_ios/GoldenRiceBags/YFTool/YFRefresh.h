//
//  YFRefresh.h
//  FDBigHealth
//
//  Created by 风鼎-叶烽 on 2018/3/7.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MJRefresh.h"

typedef NS_ENUM(NSInteger, RefreshType) {
    RefreshTypeDropDown = 0,  //只支持下拉
    RefreshTypeUpDrop = 1,    //只支持上拉
    RefreshTypeDouble = 2,    //支持上拉和下拉
};



@interface YFRefresh : NSObject
//正常模式上拉下拉刷新
- (void)normalModelRefresh:(UITableView *)tableView refreshType:(RefreshType)refreshType firstRefresh:(BOOL)firstRefresh timeLabHidden:(BOOL)timeLabHidden stateLabHidden:(BOOL)stateLabHidden dropDownBlock:(void(^)(void))dropDownBlock upDropBlock:(void(^)(void))upDropBlock;
//gifRefresh
- (void)gifModelRefresh:(UITableView *)tableView refreshType:(RefreshType)refreshType firstRefresh:(BOOL)firstRefresh timeLabHidden:(BOOL)timeLabHidden stateLabHidden:(BOOL)stateLabHidden dropDownBlock:(void(^)(void))dropDownBlock upDropBlock:(void(^)(void))upDropBlock;


@end
