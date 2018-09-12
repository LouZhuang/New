//
//  YFBorrowViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/9.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFBorrowViewController.h"

#define YFMineTittleImage @[@"borrowImage0",@"borrowImage1",@"borrowImage2"]

#define YFMineTittle @[@"轻松借，随时还，按日计息",@"银行存管，利息透明，无隐形消费",@"银行存管，利息透明，无隐形消费"]

#define YFMineTittleApply @[@"在线申请",@"授信额度",@"线上审批",@"快速放款"]

@interface YFBorrowViewController ()

/*
 头部imageview
 */
@property(nonatomic,strong)UIImageView *headerImageView;

/*
 可借额度
 */
@property(nonatomic,strong)UIView *BorrowLinesView;

/*
 最高可借额度
 */
@property(nonatomic,strong)UILabel *maxBorrowLinesLabel;

/*
 最高可借额度
 */
@property(nonatomic,strong)UILabel *maxNumberLabel;

/*
 轻松借底部view
 */
@property(nonatomic,strong)UIView *downView;
/*
 轻松借
 */
@property(nonatomic,strong)UILabel *threeLabel;


/*
 利率低三个按钮
 */
@property(nonatomic,strong)UIButton *threeButton;

/*
 在线申请
 */
@property(nonatomic,strong)UILabel *threeApplyLabel;

/*
 立即申请按钮
 */
@property(nonatomic,strong)UIButton *YFButton;
@end

@implementation YFBorrowViewController

/*
 视图将要显示
 */
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=WHITECOLOR;
    self.title = @"我要借款";
    [self configuration];
    // Do any additional setup after loading the view.
}

-(void)configuration
{
    [self.view sd_addSubviews:@[self.headerImageView,self.BorrowLinesView,self.maxBorrowLinesLabel,self.maxNumberLabel,self.downView,self.threeButton,self.threeApplyLabel,self.YFButton]];
    
    self.headerImageView.sd_layout
    .topSpaceToView(self.view, YF_H(0))
    .centerXEqualToView(self.view)
    .widthIs(WIDTH)
    .heightIs(YF_H(260));
    
    
    self.BorrowLinesView.sd_layout
    .topSpaceToView(self.view, YF_H(70))
    .centerXEqualToView(self.view)
    .widthIs(YF_W(117))
    .heightIs(YF_W(117));
    
    self.maxBorrowLinesLabel.sd_layout
    .topSpaceToView(self.view, YF_H(101))
    .centerXEqualToView(self.view)
    .widthIs(YF_W(117))
    .heightIs(YF_W(20));
    
    self.maxNumberLabel.sd_layout
    .topSpaceToView(self.view, YF_H(127))
    .centerXEqualToView(self.view)
    .widthIs(YF_W(117))
    .heightIs(YF_W(30));
    
    
    self.downView.sd_layout
    .topSpaceToView(self.view, YF_H(230))
    .centerXEqualToView(self.view)
    .widthIs(YF_W(347))
    .heightIs(YF_H(137));
    
     [self.downView sd_addSubviews:@[self.threeLabel]];
    
    
    self.YFButton.sd_layout
    .leftSpaceToView(self.view, YF_W(68))
    .topSpaceToView(self.view, YF_H(536))
    .widthIs(WIDTH - YF_W(136))
    .heightIs(YF_H(49));
}


-(UIImageView *)headerImageView
{
    if (!_headerImageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image =[UIImage imageNamed:@"downImage"];
        _headerImageView = imageView;
    }
    return _headerImageView;
}


-(UIView *)BorrowLinesView
{
    if (!_BorrowLinesView) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = ZHUTICOLOR;
        view.layer.cornerRadius=YF_W(117)/2;
        view.layer.masksToBounds=YES;
        view.userInteractionEnabled =YES;
        _BorrowLinesView = view;
    }
    return _BorrowLinesView;
}


-(UILabel *)maxBorrowLinesLabel
{
    if (!_maxBorrowLinesLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =WHITECOLOR;
        label.textAlignment =NSTextAlignmentCenter;
        label.text =@"最高可借额度";
        _maxBorrowLinesLabel = label;
    }
    return _maxBorrowLinesLabel;
}


-(UILabel *)maxNumberLabel
{
    if (!_maxNumberLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(22);
        label.textColor =WHITECOLOR;
        label.textAlignment =NSTextAlignmentCenter;
        label.text =@"20万";
        _maxNumberLabel = label;
    }
    return _maxNumberLabel;
}

-(UIView *)downView
{
    if (!_downView) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = WHITECOLOR;
        view.layer.cornerRadius = YF_W(8);
        view.userInteractionEnabled =YES;
        view.layer.shadowColor = [UIColor lightGrayColor].CGColor;//阴影颜色
        view.layer.shadowOffset = CGSizeMake(1, 2);//偏移距离
        view.layer.shadowOpacity = 0.8f;//不透明度
        view.layer.shadowRadius = 2.0;//半径r
        _downView = view;
    }
    return _downView;
}


-(UILabel *)threeLabel
{
    if (!_threeLabel) {
        
        for (NSInteger i =0; i < 3; i ++)
        {
            UILabel *label =[[UILabel alloc] init];
            label.frame=CGRectMake(YF_W(26), YF_H(2)+i *YF_H(45), YF_W(250), YF_H(45));
            label.font = YF_FONT(14);
            label.textColor =YF666;
            label.text =[YFMineTittle objectAtIndex:i];
            _threeLabel = label;
            [self.downView addSubview:_threeLabel];
            
            
            UIImageView *imageView = [[UIImageView alloc] init];
            imageView.frame = CGRectMake(YF_W(14), YF_H(22)+i *YF_H(45), YF_W(6), YF_H(6));
            imageView.backgroundColor=ZHUTICOLOR;
            imageView.layer.cornerRadius=YF_W(6);
            imageView.layer.masksToBounds=YES;
            [self.downView addSubview:imageView];
            
            if (i<=1) {
                UIImageView *nextImageView = [[UIImageView alloc] init];
                nextImageView.frame = CGRectMake(YF_W(26), YF_H(47)+i *YF_H(45), YF_W(307), YF_W(1));
                nextImageView.image=[UIImage imageNamed:@"xuxianImage"];
                [self.downView addSubview:nextImageView];
                
            }
        }
    }
    return _threeLabel;
}



-(UIButton *)threeButton
{
    if (!_threeButton) {
        
        for (NSInteger i =0; i < 3; i ++)
        {
            UIButton *button =[[UIButton alloc] init];
            if (i==0) {
                button.frame = CGRectMake(YF_W(15),YF_H(397), YF_W(100), YF_H(69));
            }
            if (i==1) {
                button.frame = CGRectMake(YF_W(138), YF_H(397),YF_W(100), YF_H(69));
            }
            if (i==2) {
                button.frame = CGRectMake(YF_W(261), YF_H(397), YF_W(100), YF_H(69));
            }
            [button setBackgroundImage:[UIImage imageNamed:[YFMineTittleImage objectAtIndex:i]] forState:UIControlStateNormal];
            _threeButton = button;
            button.userInteractionEnabled=NO;
            [self.view addSubview:_threeButton];
        }
    }
    return _threeButton;
}




-(UILabel *)threeApplyLabel
{
    if (!_threeApplyLabel) {
        
        for (NSInteger i =0; i < 4; i ++)
        {
            UILabel *label =[[UILabel alloc] init];
            label.frame=CGRectMake(YF_W(24) +i *YF_W(94), YF_H(486), YF_W(65), YF_H(20));
            label.font = YF_FONT(14);
            label.textColor =YF333;
            label.text =[YFMineTittleApply objectAtIndex:i];
            _threeApplyLabel = label;
            [self.view addSubview:_threeApplyLabel];
            
            
            UIImageView *imageView = [[UIImageView alloc] init];
            imageView.frame = CGRectMake(YF_W(14) +i*YF_W(94), YF_H(493), YF_W(6), YF_W(6));
            imageView.image=[UIImage imageNamed:@"ovalImage"];
            [self.view addSubview:imageView];
            
            if (i<=2) {
            UIImageView *nextImageView = [[UIImageView alloc] init];
            nextImageView.frame = CGRectMake(YF_W(90) +i*YF_W(94), YF_H(493), YF_W(8), YF_W(6));
            nextImageView.image=[UIImage imageNamed:@"nextImage"];
            [self.view addSubview:nextImageView];
                
            }
        }
    }
    return _threeApplyLabel;
}



-(UIButton *)YFButton
{
    if (!_YFButton) {
        UIButton *button=[[UIButton alloc] init];
        button.backgroundColor =ZHUTICOLOR;
        [button setTitle:@"立即申请" forState:UIControlStateNormal];
        [button setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        button.layer.cornerRadius = YF_W(25);
        button.layer.masksToBounds = YES;
        button.titleLabel.font = YF_FONT(17);
        [button addTarget:self action:@selector(YFClick) forControlEvents:UIControlEventTouchUpInside];
        _YFButton = button;
        
        
        
        
    }
    return _YFButton;
}

-(void)YFClick
{
 
    YFBorrowingInformationViewController *YFBorrowingInformationVC=[[YFBorrowingInformationViewController alloc]init];
    [self.navigationController pushViewController:YFBorrowingInformationVC animated:YES];
}


/*
 视图将要消失
 */
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
    
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
