//
//  YFHomePageViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/9.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFHomePageViewController.h"


@interface YFHomePageViewController ()

@end

@implementation YFHomePageViewController
static NSString *cellId = @"YFHomePageTableViewCell";
static NSString *cellHeaderId = @"YFHomePageHeaderTableViewCell";
static NSString *cellFooterId = @"YFHomePageFooterTableViewCell";
/*
 视图将要显示
 */
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    
 
    /*
     数据请求
     */
    [self DataRequest];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";

      [self configuration];
    [self LoginYes];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(BackHome) name:@"BackHome" object:nil];
    /*
     登陆成功通知接收
     */
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(LoginYes) name:@"LoginYes" object:nil];

    
}
-(void)LoginYes
{
    if ([[YFTool userDefaultsId:YFisDepository] integerValue]==0 ||[[YFTool userDefaultsId:YFisDepositoryB] integerValue]==0) {
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
       self.CustomOpenTheDepositoryView =[[YFCustomOpenTheDepositoryView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
       self.CustomOpenTheDepositoryView.OpenTheDepositoryDelegate=self;
        [window addSubview:self.CustomOpenTheDepositoryView];
    }
}
-(void)BackHome
{
    self.tabBarController.selectedIndex = 1;
   
}

-(void)SuccessfulType:(NSInteger)type
{
    if (type ==0) {
        YFOpenASavingsAccountViewController *YFOpenASavingsAccountVC=[[YFOpenASavingsAccountViewController alloc] init];
        YFOpenASavingsAccountVC.OpenAnAccountDelegate=self;
        [self.navigationController pushViewController:YFOpenASavingsAccountVC animated:YES];
    }
    if (type ==1) {
        NSLog(@"暂不考虑");
    }
}
/*
 开户成功代理
 */
-(void)OpenAnAccount
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    _CustomSuccessView =[[YFCustomSuccessView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    [window addSubview:_CustomSuccessView];
}

-(NSMutableArray *)YFBannerArray
{
    if (!_YFBannerArray) {
        _YFBannerArray=[NSMutableArray array];
    }
    return _YFBannerArray;
}

-(NSMutableArray *)YFTittleArray
{
    if (!_YFTittleArray) {
        _YFTittleArray=[NSMutableArray array];
    }
    return _YFTittleArray;
}

-(NSMutableArray *)YFHotArray
{
    if (!_YFHotArray) {
        _YFHotArray=[NSMutableArray array];
    }
    return _YFHotArray;
}



-(void)configuration
{
    
    [self.view sd_addSubviews:@[self.homeDownView,self.tittleImageView,self.YFTableView]];
    
    
    self.homeDownView.sd_layout
    .topEqualToView(self.view)
    .leftEqualToView(self.view)
    .widthIs(WIDTH)
    .heightIs(YF_H(250));
    
    self.tittleImageView.sd_layout
    .topSpaceToView(self.view, YF_H(30))
    .leftSpaceToView(self.view, YF_W(15))
    .widthIs(YF_W(59))
    .heightIs(YF_H(19));



    self.YFTableView.sd_layout
    .topSpaceToView(self.view, YF_H(64))
    .leftSpaceToView(self.view, 0)
    .widthIs(WIDTH)
    .heightIs(HEIGHT -64-YF_H(49));
    
  
    
}



-(YFBaseTableView *)YFTableView
{
    if (!_YFTableView) {
        YFBaseTableView *tableView= [[YFBaseTableView alloc] init];
        tableView.separatorColor = LIGHTGREYCOLOR;
        tableView.tableFooterView = [UIView new];
        tableView.delegate = self;
        tableView.dataSource =self;
        _YFTableView =tableView;
    }
    return _YFTableView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section ==0) {
        return 0;
    }
    if (section ==1) {
       return YF_H(59);
    }
    if (section ==2) {
       return YF_H(46);
    }
    else{
        return 0;
    }
    

}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIImageView *view = [[UIImageView alloc] init];
    view.userInteractionEnabled = YES;
    view.backgroundColor = WHITECOLOR;
    
    UIImageView *imageView=[[UIImageView alloc] init];
    imageView.image=[UIImage imageNamed:@"zhuangshidianImage"];
    [view addSubview:imageView];
    
    imageView.sd_layout
    .leftSpaceToView(view, YF_W(14))
    .widthIs(YF_W(12))
    .heightIs(YF_H(8))
    .centerYEqualToView(view);
    
    UILabel *label=[[UILabel alloc] init];
    label.font=YF_FONT(17);
    label.textColor = [YFTool YFColorWithString:@"333333"];
    [view addSubview:label];
    
    label.sd_layout
    .leftSpaceToView(view, YF_W(32))
    .widthIs(YF_W(150))
    .heightIs(YF_H(24))
    .centerYEqualToView(view);
    
    if (section==1) {
        label.text =@"热门产品";
    }
    if (section==2) {
       label.text =@"信息披露";
    }
    
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
      return YF_H(290);
    }
    if (indexPath.section==1) {
      return YF_H(201);
    }
    if (indexPath.section==2) {
       return YF_H(362);
    }
    else{
        return 0;
    }
    

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section ==0) {
        return 1;
    }
    if (section ==1) {
        return self.YFHotArray.count;
    }
    if (section ==2) {
        return 1;
    }
    else{
        return 0;
    }
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if (indexPath.section==0) { YFHomePageHeaderTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        if (cell == nil) {
            cell = [[YFHomePageHeaderTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellHeaderId];
            
        }
    
        if (self.YFBannerArray.count>0) {
             [cell setterBanner:self.YFBannerArray];
        }
        
        if (self.YFTittleArray.count>0) {

            [cell setterTittle:self.YFTittleArray];
        }
        
        return cell;
        
    }
    if (indexPath.section==1) {
        
        YFHomePageTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        if (cell == nil) {
            cell = [[YFHomePageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
          
            
            YFHomePageModel *model=[self.YFHotArray objectAtIndex:indexPath.row];
              
            [cell setterHomePageModel:model];
            
        }
        return cell;
    }
    if (indexPath.section==2) {
        YFHomePageFooterTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        if (cell == nil) {
            cell = [[YFHomePageFooterTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellFooterId];
            
        }
        return cell;
    }
    else{
        return nil;
    }
    
   
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
     if (indexPath.section==1) {
         
          YFHomePageModel *model=[self.YFHotArray objectAtIndex:indexPath.row];
         /*
          债权转让
          */
         if ([model.type isEqualToString:@"债转项目"]) {
             
             YFFinancialDetailsViewController *YFFinancialDetailsVC=[[YFFinancialDetailsViewController alloc]init];
             YFFinancialDetailsVC.listModel=model;
             YFFinancialDetailsVC.projectId = model.id;
             [self.navigationController pushViewController:YFFinancialDetailsVC animated:YES];
         }
         /*
          新人专享type  yes未满  No 已满
          */
         if ([model.type isEqualToString:@"原项目"]) {
             
             YFNormalFinancialDetailsViewController *YFFinancialDetailsVC=[[YFNormalFinancialDetailsViewController alloc]init];
             YFFinancialDetailsVC.listModel=model;
             YFFinancialDetailsVC.typeId = YFNormalFinancialDetailsViewControllerTypeList;
             YFFinancialDetailsVC.type=NO;
             if ([model.status integerValue]==0) {
                 YFFinancialDetailsVC.type=YES;
             }
             [self.navigationController pushViewController:YFFinancialDetailsVC animated:YES];
         }
   
     }
}


#pragma mark - lazy

-(UIView *)homeDownView
{
    if (!_homeDownView) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = ZHUTICOLOR;
        view.userInteractionEnabled =YES;
        _homeDownView = view;
    }
    return _homeDownView;
}


-(UIImageView *)tittleImageView
{
    if (!_tittleImageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image =[UIImage imageNamed:@"jinmidaiImage"];
        _tittleImageView = imageView;
    }
    return _tittleImageView;
}



/*
 数据请求
 */
-(void)DataRequest
{
    [YFHomePageRequest HomePageIndexSuccess:^(id json) {
        
        if ([YFTool Nsdic:json]==1) {

            NSLog(@"66666 == %@",json);
            
            
            NSDictionary *dic=[json objectForKey:@"data"];
            NSArray *bannerEntitiesArr=[dic objectForKey:@"bannerEntities"];
            
            [self.YFBannerArray removeAllObjects];
            for (NSDictionary *dic in bannerEntitiesArr) {
                YFHomePageModel *model=[[YFHomePageModel alloc] init];
                [model setValuesForKeysWithDictionary:dic];
                [self.YFBannerArray addObject:model];
                
            }
            
            NSArray *tittleArr=[dic objectForKey:@"noticeEntities"];
            [self.YFTittleArray removeAllObjects];
            for (NSDictionary *dic in tittleArr) {
                YFHomePageModel *model=[[YFHomePageModel alloc] init];
                [model setValuesForKeysWithDictionary:dic];
                [self.YFTittleArray addObject:model];
                
            }
            NSDictionary *hotDic=[dic objectForKey:@"hots"];
            NSArray *hotArr=[hotDic objectForKey:@"result"];
            [self.YFHotArray removeAllObjects];
            for (NSDictionary *dic in hotArr) {
                YFHomePageModel *model=[[YFHomePageModel alloc] init];
                [model setValuesForKeysWithDictionary:dic];
                [self.YFHotArray addObject:model];
                
            }
            
            
            [self.YFTableView reloadData];
            
        }
        
    } failure:^(NSError *error) {
        
    }];
}



/*
 视图将要消失
 */
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
    
}
/**  section不悬停  */
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat sectionHeaderHeight = YF_H(59);
    if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
