//
//  YFBorrowingCertificationViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/22.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBorrowingCertificationViewController.h"

@interface YFBorrowingCertificationViewController ()<UITableViewDelegate,UITableViewDataSource,YFCustomOpenTheDepositoryDelegate,YFOpenAnAccountDelegate>
/*
 tableview
 */
@property(nonatomic,strong)YFBaseTableView *YFTableView;

/*
 下一步
 */
@property(nonatomic,strong)UIButton *theNextStepButton;

/*
 上一步
 */
@property(nonatomic,strong)UIButton *thePreviousStepButton;

/*
 
 */
@property(nonatomic,strong)UIScrollView *ImagScrollerView;
/*
 照片
 */
@property(nonatomic,strong)YFSelectImageView *AddImagView;

@end

@implementation YFBorrowingCertificationViewController

static NSString *cellId = @"YFBorrowingHeaderTableViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"申请借款";
    self.view.backgroundColor=WHITECOLOR;
    [self configuration];
    // Do any additional setup after loading the view.
}


-(void)configuration
{
    [self.view sd_addSubviews:@[self.thePreviousStepButton,self.theNextStepButton,self.YFTableView,self.AddImagView]];
    
    self.thePreviousStepButton.sd_layout
    .leftSpaceToView(self.view, YF_W(0))
    .bottomEqualToView(self.view)
    .widthIs(WIDTH/2)
    .heightIs(YF_H(49));
    
    self.theNextStepButton.sd_layout
    .leftSpaceToView(self.view, WIDTH/2)
    .bottomEqualToView(self.view)
    .widthIs(WIDTH/2)
    .heightIs(YF_H(49));
    
    self.YFTableView.sd_layout
    .topSpaceToView(self.view, YF_H(0))
    .leftSpaceToView(self.view, 0)
    .widthIs(WIDTH)
    .heightIs(HEIGHT -64-YF_H(49));
    
    self.AddImagView.sd_layout
    .topSpaceToView(self.view, YF_H(127))
    .leftSpaceToView(self.view, YF_W(0))
    .widthIs(WIDTH)
    .heightIs(YF_H(70));
    
//     [self.ImagScrollerView sd_addSubviews:@[self.AddImagView]];
//
//
//    self.ImagScrollerView.sd_layout
//    .topSpaceToView(self.view, YF_H(127))
//    .leftSpaceToView(self.view, YF_W(0))
//    .widthIs(WIDTH)
//    .heightIs(YF_H(70));
    
    
}


-(UIScrollView *)ImagScrollerView
{
    if (!_ImagScrollerView) {
        UIScrollView *scrollerView= [[UIScrollView alloc] init];
        scrollerView.contentSize = CGSizeMake(WIDTH*1.5, 0);
        scrollerView.backgroundColor = WHITECOLOR;
        scrollerView.bounces = YES;
        scrollerView.showsHorizontalScrollIndicator = NO;
        scrollerView.delegate = self;
        _ImagScrollerView =scrollerView;
    }
    return _ImagScrollerView;
}


-(YFSelectImageView *)AddImagView
{
    if (!_AddImagView) {
        _AddImagView = [[YFSelectImageView alloc] init];
        _AddImagView.addDelegate = self;
        _AddImagView.backgroundColor=[UIColor cyanColor];
    }
    return _AddImagView;
}

/*
 获取图片数组
 */

-(void)NeedImageArray:(NSMutableArray *)imageArray urlImageArray:(NSMutableArray *)urlArray
{
   
    
  
    
    NSMutableArray *array=[NSMutableArray array];;
    
    for (NSInteger i = 0; i<urlArray.count; i++) {
        
        NSDictionary *dic=@{@"href":[urlArray objectAtIndex:i]};
        [array addObject:dic];
    }
    
    
    [self.dataDic setObject:array forKey:@"pics"];
    
    NSLog(@"dataDic === %@",self.dataDic);
    
}



-(YFBaseTableView *)YFTableView
{
    if (!_YFTableView) {
        YFBaseTableView *tableView= [[YFBaseTableView alloc] init];
        tableView.separatorColor = LIGHTGREYCOLOR;
        tableView.tableFooterView = [UIView new];
        tableView.delegate = self;
        tableView.scrollEnabled=NO;
        tableView.dataSource =self;
        _YFTableView =tableView;
    }
    return _YFTableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{

    return YF_H(10);
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIImageView *view = [[UIImageView alloc] init];
    view.userInteractionEnabled = YES;
    view.backgroundColor = LIGHTGREYCOLOR;
    
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YF_H(102);

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 1;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    YFBorrowingHeaderTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[YFBorrowingHeaderTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
    }
    
    [cell setterIndexPath:indexPath.row selectType:1 tittleString:@"请上传认证及文件资料照片"];
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    
}




-(UIButton *)thePreviousStepButton
{
    if (!_thePreviousStepButton) {
        UIButton *button=[[UIButton alloc] init];
        button.backgroundColor =[YFTool YFColorWithString:@"FF9F51"];
        [button setTitle:@"上一步" forState:UIControlStateNormal];
        [button setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        button.titleLabel.font = YF_FONT(17);
        [button addTarget:self action:@selector(thePreviousStepClick) forControlEvents:UIControlEventTouchUpInside];
        _thePreviousStepButton = button;
 
    }
    return _thePreviousStepButton;
}

-(void)thePreviousStepClick
{
    [self.navigationController popViewControllerAnimated:YES];
}


-(UIButton *)theNextStepButton
{
    if (!_theNextStepButton) {
        UIButton *button=[[UIButton alloc] init];
        button.backgroundColor =ZHUTICOLOR;
        [button setTitle:@"提交" forState:UIControlStateNormal];
        [button setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        button.titleLabel.font = YF_FONT(17);
        [button addTarget:self action:@selector(theNextSteppClick) forControlEvents:UIControlEventTouchUpInside];
        _theNextStepButton = button;
        
    }
    return _theNextStepButton;
}

-(void)theNextSteppClick
{
    if ([[YFTool userDefaultsId:YFisDepository] integerValue]==0 ||[[YFTool userDefaultsId:YFisDepositoryB] integerValue]==0) {
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        _CustomOpenTheDepositoryView =[[YFCustomOpenTheDepositoryView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
        _CustomOpenTheDepositoryView.OpenTheDepositoryDelegate=self;
        [window addSubview:_CustomOpenTheDepositoryView];
        
        return;
    }
    
    [YFSRFManager YFSrfSuccess:^(id json) {
        
        [self srfString:json];
        
    } failure:^(NSError *error) {
        
    }];

    
   
    
    
}
-(void)srfString:(NSString *)srfStr
{
    
    [YFProgressHUD showWithStatus:nil];
    [YFBorrowingRequest YFSend:self.dataDic.mutableCopy srfString:srfStr success:^(id json) {
        if ([YFTool Nsdic:json]==1) {
            
            //           [YFProgressHUD showSuccessWithStatus:MESSAGE];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                YFBorrowingCompleteViewController *YFBorrowingCompleteVC=[[YFBorrowingCompleteViewController alloc] init];
                [self.navigationController pushViewController:YFBorrowingCompleteVC animated:YES];
            });
            
        }
        else{
            [YFProgressHUD showInfoWithStatus:MESSAGE];
        }
        
        
        
    } failure:^(NSError *error) {
        
    }];
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


/**  section不悬停  */
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat sectionHeaderHeight = YF_H(10);
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
