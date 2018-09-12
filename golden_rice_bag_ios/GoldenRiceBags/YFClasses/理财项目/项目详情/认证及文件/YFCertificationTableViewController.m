//
//  YFCertificationTableViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/21.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFCertificationTableViewController.h"

@interface YFCertificationTableViewController ()

@property(nonatomic,strong)NSMutableArray *YFArray;

@end

@implementation YFCertificationTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=WHITECOLOR;
    self.tableView.separatorColor = LIGHTGREYCOLOR;
    self.tableView.tableFooterView =[UIView new];
    NSLog(@"shitu  33333 == %@",self.projectDetailId);
    /*
     数据请求
     */
    [self DataRequest];
    
    
}

-(NSMutableArray *)YFArray
{
    if (!_YFArray) {
        _YFArray=[NSMutableArray array];
    }
    return _YFArray;
}

-(void)configuration
{
    [self.view sd_addSubviews:@[self.YFBannerView]];

  
    
}


-(DCCycleScrollView *)YFBannerView
{
    if (!_YFBannerView) {

        DCCycleScrollView *banner = [DCCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, YF_H(20), WIDTH, YF_H(130)) shouldInfiniteLoop:YES imageGroups:self.YFArray];
        //    banner.placeholderImage = [UIImage imageNamed:@"placeholderImage"];
        //    banner.cellPlaceholderImage = [UIImage imageNamed:@"placeholderImage"];
        banner.autoScrollTimeInterval = 4;
        banner.autoScroll = YES;
        banner.isZoom = YES;
        banner.itemSpace = YF_W(7);
        banner.imgCornerRadius = YF_W(8);
        banner.itemWidth = YF_W(320);
        banner.delegate = self;
        _YFBannerView = banner;
    }
    return _YFBannerView;
}
//点击图片的代理
-(void)cycleScrollView:(DCCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"index = %ld",index);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 0;
}


/*
 数据请求
 */
-(void)DataRequest
{
    [YFHomePageRequest YFHomePageProjectDetail:self.projectDetailId success:^(id json) {
        
        if ([YFTool Nsdic:json]==1) {
        
            NSDictionary *dic=[json objectForKey:@"data"];
            NSArray *loanInfoPictureEntityArr=[dic objectForKey:@"loanInfoPictureEntity"];
            [self.YFArray removeAllObjects];
            
            for (NSDictionary *dic in loanInfoPictureEntityArr) {
                YFCertificationModel *model=[[YFCertificationModel alloc] init];
                [model setValuesForKeysWithDictionary:dic];
                [self.YFArray addObject:model.href];
                
            }

            [self configuration];
        }
        else{
            [YFProgressHUD showInfoWithStatus:MESSAGE];
        }
        
        
    } failure:^(NSError *error) {
        
    }];
    
    
}



@end
