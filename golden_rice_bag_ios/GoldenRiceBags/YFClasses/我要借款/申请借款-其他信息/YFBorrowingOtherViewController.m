//
//  YFBorrowingOtherViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/22.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBorrowingOtherViewController.h"

@interface YFBorrowingOtherViewController ()<UITableViewDelegate,UITableViewDataSource,JHPickerDelegate,YFPickerDelegate,UITextViewDelegate>
/*
 tableview
 */
@property(nonatomic,strong)YFBaseTableView *YFTableView;
/*
 选择器
 */
@property(nonatomic,strong)JHPickView *picker;
/*
 下一步
 */
@property(nonatomic,strong)UIButton *YFButton;
@end

@implementation YFBorrowingOtherViewController
{
    NSString *selectOne;
    NSString *selectTwo;
    NSString *selectThree;
    NSString *nameOne;
    NSString *nameTwo;
    NSInteger typeSelect;
    
    NSInteger typeOne;//请确认是否有担保措施 有为1   不存在未0
}


static NSString *cellId = @"YFBorrowingHeaderTableViewCell";
static NSString *cellOtherId = @"YFBorrowingOtherTableViewCell";


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"申请借款";
    selectOne=@"请选择借款用途";
    selectTwo=@"请选择还款来源";
    selectThree=@"请确认是否有担保措施";
    
    nameOne=@"";
    nameTwo=@"";
    typeSelect=0;
    typeOne=0;
    
    [self configuration];
    // Do any additional setup after loading the view.
}

-(void)configuration
{
    [self.view sd_addSubviews:@[self.YFButton,self.YFTableView]];
    
    self.YFButton.sd_layout
    .leftSpaceToView(self.view, YF_W(0))
    .bottomEqualToView(self.view)
    .widthIs(WIDTH)
    .heightIs(YF_H(49));
    
    self.YFTableView.sd_layout
    .topSpaceToView(self.view, YF_H(0))
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return YF_H(10);
    }
    else{
        return 0;
    }
    
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
    if (indexPath.section ==0) {
        
        return YF_H(102);
    }
    if (indexPath.section ==1) {
        if (indexPath.row==0||indexPath.row==1||indexPath.row==2) {
            return YF_H(105);
        }
        if (indexPath.row==3) {
            return YF_H(50);
        }
        if (indexPath.row==4) {
            return YF_H(120);
        }
        if (indexPath.row==5) {
            return YF_H(80);
        }
        else{
            return YF_H(0);
        }
        
    }
    if (indexPath.section ==2) {
        return YF_H(50);
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
        if (typeOne==0) {
            return 3;
        }
        if (typeOne==1) {
            return 6;
        }
        else{
            return 0;
        }
        
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
    if (indexPath.section==0) {
        YFBorrowingHeaderTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        if (cell == nil) {
            cell = [[YFBorrowingHeaderTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
            
        }
        
        [cell setterIndexPath:indexPath.row selectType:0 tittleString:@"其他信息"];
        
        
        return cell;
    }
    else{
        YFBorrowingOtherTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        if (cell == nil) {
            cell = [[YFBorrowingOtherTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellOtherId];
            
        }
        
        [cell setterIndex:indexPath.row indexSection:indexPath.section oneString:selectOne twoString:selectTwo threeString:selectThree textViewString:nameTwo textFieldString:nameOne typeString:typeSelect];
        [cell.selectButton addTarget:self action:@selector(selectClick:) forControlEvents:UIControlEventTouchUpInside];
        [cell.firstButton addTarget:self action:@selector(sectionOneClick:) forControlEvents:UIControlEventTouchUpInside];
        [cell.secondButton addTarget:self action:@selector(sectionOneClick:) forControlEvents:UIControlEventTouchUpInside];
        [cell.YFtextField addTarget:self action:@selector(textClick:) forControlEvents:UIControlEventEditingChanged];
        cell.YF_TextView.delegate=self;
        return cell;
    }
    
    
}


-(void)textClick:(UITextField *)sender
{
    
    
    nameOne=sender.text;
    
}

-(void)textViewDidChange:(UITextView *)textView
{
    nameTwo=textView.text;
}

-(void)sectionOneClick:(UIButton *)sender
{
    typeSelect=sender.tag;
    [self.YFTableView reloadData];
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    if (indexPath.section == 2 &&indexPath.row == 0) {
        RHWebViewController *vc = [[RHWebViewController alloc]init];
        vc.title = @"借款协议《金米袋借款协议》";
        vc.pathUrl = [[NSBundle mainBundle]pathForResource:@"借款协议" ofType:@"html"];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

-(void)selectClick:(UIButton *)sender
{
    
    if (sender.tag==0) {
        
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        YFPikerView  *pikerview= [[YFPikerView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT - 64)];
        pikerview.YFdelegate = self ;
        pikerview.customArr = @[@"装修",@"购买汽车、家电、3C、珠宝玉石等产品",@"教育培训、出国留学",@"旅游"];
        pikerview.rightArr = @[@"购买原材料",@"店面装修",@"扩大经营面积"];
        [window addSubview:pikerview];
    }
    
    
    else{
        
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        _picker = [[JHPickView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT - 64)];
        _picker.delegate = self ;
        _picker.selectLb.text = @"";
        
        
        if (sender.tag==1) {
            _picker.tag=1;
            _picker.customArr = @[@"工资收入",@"经营收入",@"其他自由收入",@"担保措施"];
        }
        if (sender.tag==2) {
            _picker.tag=2;
            _picker.customArr = @[@"有担保措施",@"借款人以其自身信用承诺按照约定偿还借款本息"];
        }
        [window addSubview:_picker];
        
    }
}
-(void)PickerSelectorIndixString:(NSString *)str
{
    if (_picker.tag==1) {
        selectTwo=str;
    }
    if (_picker.tag==2) {
        selectThree=str;
        
        if ([str isEqualToString:@"有担保措施"]) {
            typeOne =1;
        }
        if (![str isEqualToString:@"有担保措施"]) {
            typeOne =0;
        }
    }
    
    
    
    [self.YFTableView reloadData];
    
    
}

-(void)YFPickerSelectorIndixString:(NSString *)str
{
    
    selectOne=str;
    NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:1];
    [self.YFTableView  reloadSections:indexSet withRowAnimation:UITableViewRowAnimationNone];
}



-(UIButton *)YFButton
{
    if (!_YFButton) {
        UIButton *button=[[UIButton alloc] init];
        button.backgroundColor =ZHUTICOLOR;
        [button setTitle:@"下一步" forState:UIControlStateNormal];
        [button setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        button.titleLabel.font = YF_FONT(17);
        [button addTarget:self action:@selector(YFClick) forControlEvents:UIControlEventTouchUpInside];
        _YFButton = button;
        
    }
    return _YFButton;
}

-(void)YFClick
{
    if ([selectOne isEqualToString:@"请选择借款用途"]) {
        [YFProgressHUD showInfoWithStatus:@"请选择借款用途"];
        return;
    }
    if ([selectTwo isEqualToString:@"请选择还款来源"]) {
        [YFProgressHUD showInfoWithStatus:@"请选择还款来源"];
        return;
    }
    if ([selectThree isEqualToString:@"请确认是否有担保措施"]) {
        [YFProgressHUD showInfoWithStatus:@"请确认是否有担保措施"];
        return;
    }
    
    /*
     有担保措施
     */
    if ([selectThree isEqualToString:@"有担保措施"]) {
        [self.dataDic setObject:selectThree forKey:@"assuranceOfMeasure"];
        
        if (nameOne.length==0) {
            [YFProgressHUD showInfoWithStatus:@"请输入担保主主体名称"];
            return;
        }
        if (nameTwo.length==0) {
            [YFProgressHUD showInfoWithStatus:@"请输入担保措施"];
            return;
        }
        
    }
    
    
    YFBorrowingCertificationViewController *YFBorrowingDetailVC=[[YFBorrowingCertificationViewController alloc]init];
    YFBorrowingDetailVC.dataDic=[self DataSorting];
    [self.navigationController pushViewController:YFBorrowingDetailVC animated:YES];
}
/*
 数据整理
 */
-(NSMutableDictionary *)DataSorting
{
    
    [self.dataDic setObject:selectOne forKey:@"usageOfLoan"];
    
    [self.dataDic setObject:selectTwo forKey:@"repaySource"];
    /*
     无担保措施
     */
    if (![selectThree isEqualToString:@"有担保措施"]) {
        
        [self.dataDic setObject:selectThree forKey:@"assuranceOfMeasure"];
        
    }
    
    /*
     有担保措施
     */
    if ([selectThree isEqualToString:@"有担保措施"]) {
        
        [self.dataDic setObject:selectThree forKey:@"assuranceOfMeasure"];
        [self.dataDic setObject:nameOne forKey:@"guaranteeOrganization"];
        [self.dataDic setObject:nameTwo forKey:@"assuranceInfo"];
        
        if (typeSelect==0) {
            [self.dataDic setObject:@"1" forKey:@"isFormalities"];
        }
        if (typeSelect==1) {
            [self.dataDic setObject:@"0" forKey:@"isFormalities"];
        }
        
        
    }
    
    return self.dataDic;
    
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

