//
//  YFBorrowingCompleteViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/22.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBorrowingCompleteViewController.h"

@interface YFBorrowingCompleteViewController ()<UITableViewDelegate,UITableViewDataSource>
/*
 tableview
 */
@property(nonatomic,strong)YFBaseTableView *YFTableView;


/*
 iamgeView
 */
@property(nonatomic,strong)UIImageView *tittleImgeView;


/*
 tittle
 */
@property(nonatomic,strong)UILabel *tittleLabel;

/*
 content
 */
@property(nonatomic,strong)UILabel *contentLabel;

@end

@implementation YFBorrowingCompleteViewController
static NSString *cellId = @"YFBorrowingHeaderTableViewCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"申请借款";
    self.view.backgroundColor=WHITECOLOR;
    [self configuration];
    // Do any additional setup after loading the view.
//
}


-(void)configuration
{
    [self.view sd_addSubviews:@[self.YFTableView,self.tittleImgeView,self.tittleLabel,self.contentLabel]];

    
    self.YFTableView.sd_layout
    .topSpaceToView(self.view, YF_H(0))
    .leftSpaceToView(self.view, 0)
    .widthIs(WIDTH)
    .heightIs(HEIGHT -64-YF_H(49));
    
    self.tittleImgeView.sd_layout
    .topSpaceToView(self.view, YF_H(113))
    .centerXEqualToView(self.view)
    .widthIs(YF_W(50))
    .heightIs(YF_H(50));
    
    self.tittleLabel.sd_layout
    .topSpaceToView(self.view, YF_H(173))
    .leftSpaceToView(self.view, 0)
    .widthIs(WIDTH)
    .heightIs(YF_H(24));
    
    self.contentLabel.sd_layout
    .topSpaceToView(self.view, YF_H(217))
    .leftSpaceToView(self.view, 0)
    .widthIs(WIDTH)
    .heightIs(YF_H(20));
    
    
    [self addNavigationItemWithImageNames:@[@"tabbarImage"] isLeft:YES target:self action:@selector(back) tags:nil];
    
}

-(void)back
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}


-(UIImageView *)tittleImgeView
{
    if (!_tittleImgeView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image =[UIImage imageNamed:@"CompleteImage"];
        imageView.userInteractionEnabled =YES;
        _tittleImgeView = imageView;
    }
    return _tittleImgeView;
}

-(UILabel *)tittleLabel
{
    if (!_tittleLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(17);
        label.textColor =YF333;
        label.textAlignment=NSTextAlignmentCenter;
        label.text =@"提交成功";
        _tittleLabel = label;
    }
    return _tittleLabel;
}


-(UILabel *)contentLabel
{
    if (!_contentLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =YF666;
        label.textAlignment=NSTextAlignmentCenter;
        label.text =@"审核将在1-2个工作日内完成，请耐心等待！";
        _contentLabel = label;
    }
    return _contentLabel;
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
    
    [cell setterIndexPath:indexPath.row selectType:2 tittleString:@""];
    cell.sectionImageView.hidden=YES;
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    
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
