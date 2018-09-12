//
//  YFCreditRiskRatingViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/15.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFCreditRiskRatingViewController.h"

#define YFTittle @[@"1.您目前的就业状况如何",@"2.您的最高学历为",@"3.您主要计划投资的期限是多久？",@"4.在您每年的家庭收入中，可用于金融投资的比例为",@"5.您投资的目的是：",@"6.您对理财产品的看法是：",@"7.您的家庭年收入为（折合人民币）",@"8.以下哪项最能说明您的投资经验？",@"9.假设有两种投资：投资A预期获得10%的收益，可能承担的损失非常小；投资B预期获得30%的收益，但可能承担较大亏损。您会怎么支配您的投资",@"10.您持续投资股票、基金、外汇、金融衍生产品、海外投资产品（至少一项）的年限？",@"11.您的投资出现何种程度的波动时，您会呈现明显的焦虑",@"12.您如何理解风险的"]

@interface YFCreditRiskRatingViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

/*
 标题
 */
@property(nonatomic,strong)UILabel *tittleLabel;

/*
 集合视图
 */
@property(nonatomic,strong)UICollectionView *YFCollectionView;


@end

@implementation YFCreditRiskRatingViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"风险承受能力评估";
    
    [self configuration];
    // Do any additional setup after loading the view.
}

-(void)configuration
{
    [self.view sd_addSubviews:@[self.tittleLabel,self.YFCollectionView]];
    
    self.tittleLabel.sd_layout
    .topEqualToView(self.view)
    .leftEqualToView(self.view)
    .widthIs(WIDTH)
    .heightIs(YF_H(30));
    
    
    
}

#pragma mark - lazy

-(UILabel *)tittleLabel
{
    if (!_tittleLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor =ZHUTICOLOR;
        NSString *string = @"已回答1/12题";
        NSMutableAttributedString *aString = [[NSMutableAttributedString alloc]initWithString:string];
        [aString addAttribute:NSForegroundColorAttributeName value:[YFTool YFColorWithString:@"666666"] range:NSMakeRange(0, 3)];
        [aString addAttribute:NSForegroundColorAttributeName value:[YFTool YFColorWithString:@"666666"] range:NSMakeRange(string.length-1, 1)];
        label.attributedText =aString;
        _tittleLabel = label;
    }
    return _tittleLabel;
}

-(UICollectionView *)YFCollectionView
{
    if (!_YFCollectionView) {
      
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.minimumInteritemSpacing =0;
        layout.minimumLineSpacing =0;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, YF_H(30), WIDTH, HEIGHT-YF_H(30)-64) collectionViewLayout:layout];
        collectionView.backgroundColor = WHITECOLOR;
        collectionView.scrollEnabled=NO;
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.pagingEnabled= YES;
        _YFCollectionView =collectionView;
    }
    return _YFCollectionView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return YFTittle.count;
    
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *cellId =[NSString stringWithFormat:@"YFCreditRiskRatingCollectionViewCell%ld",indexPath.row];
    
    [self.YFCollectionView registerClass:[YFCreditRiskRatingCollectionViewCell class] forCellWithReuseIdentifier:cellId];
    
    YFCreditRiskRatingCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    
    cell.backgroundColor = WHITECOLOR;

    [cell setterHeaderString:[YFTittle objectAtIndex:indexPath.row] indexPathRow:indexPath.row];

    [cell.OnATopicButton addTarget:self action:@selector(OnATopicClick:) forControlEvents:UIControlEventTouchUpInside];
    [cell.NextQuestionButton addTarget:self action:@selector(NextQuestion:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

-(void)OnATopicClick:(UIButton *)sender
{
    [self.YFCollectionView setContentOffset:CGPointMake(self.YFCollectionView.contentOffset.x-WIDTH, 0) animated:NO];
}

-(void)NextQuestion:(UIButton *)sender
{
   
    if (sender.tag<11) {
       [self.YFCollectionView setContentOffset:CGPointMake(self.YFCollectionView.contentOffset.x+WIDTH, 0) animated:NO];
    }
     if (sender.tag ==11) {
         
       
         [YFProgressHUD showWithStatus:nil];
         [YFMineRequest YFInvestmentTypeString:[YFTool userDefaultsId:@"Types"] success:^(id json) {
            
             if ([YFTool Nsdic:json]==1) {
                 YFCompletionOfRiskRatingViewController *YFCompletionOfRiskRatingVC=[[YFCompletionOfRiskRatingViewController alloc]init];
                 [self.navigationController pushViewController:YFCompletionOfRiskRatingVC animated:YES];
                 /*
                  投资类型
                  */
                 [YFTool setObject:[YFTool userDefaultsId:@"Types"] key:YFInvestmentType];
                 
             }
             else{
                 [YFProgressHUD showInfoWithStatus:MESSAGE];
             }
             
             
         } failure:^(NSError *error) {
             
         }];
         
         
     }
   
}


#pragma mark ---- UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    return (CGSize){WIDTH,HEIGHT-YF_H(30)-64};
    
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0,0);
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{

    NSString *string =[NSString stringWithFormat:@"已回答%.f/12题",self.YFCollectionView.contentOffset.x/WIDTH +1];
    NSMutableAttributedString *aString = [[NSMutableAttributedString alloc]initWithString:string];
    [aString addAttribute:NSForegroundColorAttributeName value:[YFTool YFColorWithString:@"666666"] range:NSMakeRange(0, 3)];
    [aString addAttribute:NSForegroundColorAttributeName value:[YFTool YFColorWithString:@"666666"] range:NSMakeRange(string.length-1, 1)];
    self.tittleLabel.attributedText =aString;

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
