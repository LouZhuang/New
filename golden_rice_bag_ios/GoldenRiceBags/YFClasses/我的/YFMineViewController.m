//
//  YFMineViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/9.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFMineViewController.h"

@interface YFMineViewController ()<UIScrollViewDelegate,SectionChooseVCDelegate,UITableViewDelegate,UITableViewDataSource,UIActionSheetDelegate,YFTiedCardPopDelegate,YFCustomOpenTheDepositoryDelegate,YFOpenAnAccountDelegate>
/*
 开通弹窗
 */

@property (nonatomic,strong)YFTiedCardPopView *tiedCardPopView;

@end

@implementation YFMineViewController
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

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
    self.title = @"我的";
    self.canScroll = YES;
 
    _TZNumberString=@"0";
    _JKNumberString=@"0";
    
    [self configuration];
    
    self.tableView =[[YFMineTableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-49) style:UITableViewStylePlain];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    self.tableView.userInteractionEnabled=YES;
    [self.tableView setTableHeaderView:self.headView];
    [self.view addSubview: self.tableView];
    
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    //通知的处理，本来也不需要这么多通知，只是写一个简单的demo，所以...根据项目实际情况进行优化吧
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onPageViewCtrlChange:) name:@"CenterPageViewScroll" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onOtherScrollToTop:) name:@"kLeaveTopNtf" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onScrollBottomView:) name:@"PageViewGestureState" object:nil];
    self.tableView.showsVerticalScrollIndicator = NO;
    [YFMineTableViewCell regisCellForTableView:self.tableView];
    
    
    
    self.segment = [[SectionChooseView alloc] initWithFrame:CGRectMake(0,0, WIDTH, YF_H(52)) titleArray:@[@"我的借款",@"我的投资"]];
    self.segment.selectIndex = 0;
    self.segment.backgroundColor = WHITECOLOR;
    self.segment.delegate = self;
    self.segment.normalBackgroundColor = WHITECOLOR;
    self.segment.selectBackgroundColor = WHITECOLOR;
    self.segment.titleNormalColor = [YFTool YFColorWithString:@"333333"];
    self.segment.titleSelectColor = ZHUTICOLOR;
    self.segment.normalTitleFont = YF_W(14);
    self.segment.selectTitleFont = YF_W(14);

    
    // Do any additional setup after loading the view.
}


//通知的处理pageViewController页面变动时的通知
- (void)onPageViewCtrlChange:(NSNotification *)ntf
{
    //1.更改YUSegment选中目标
    // 2.把对应的标题选中
    self.segment.selectIndex = [ntf.object integerValue];
    
}


//子控制器到顶部了 主控制器可以滑动
- (void)onOtherScrollToTop:(NSNotification *)ntf
{
    self.canScroll = YES;
    self.contentCell.canScroll = NO;
    
}

//当滑动下面的PageView时，当前要禁止滑动
- (void)onScrollBottomView:(NSNotification *)ntf
{
    if ([ntf.object isEqualToString:@"ended"]) {
        //bottomView停止滑动了  当前页可以滑动
        self.tableView.scrollEnabled = YES;
    } else {
        //bottomView滑动了 当前页就禁止滑动
        self.tableView.scrollEnabled = NO;
    }
}

-(void)SectionSelectIndex:(NSInteger)selectIndex
{
    
    self.contentCell.selectIndex=selectIndex;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //要减去导航栏 状态栏 以及 sectionheader的高度
    return self.view.frame.size.height-49-YF_H(52);
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    //sectionheader的高度，这是要放分段控件的
    return YF_H(52);
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return self.segment;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (!self.contentCell) {
        self.contentCell = [YFMineTableViewCell dequeueCellForTableView:tableView];
        self.contentCell.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentCell setPageView];
    }
    
    
    return self.contentCell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    
    //子控制器和主控制器之间的滑动状态切换
    CGFloat tabOffsetY = [_tableView rectForSection:0].origin.y;
    if (scrollView.contentOffset.y >= tabOffsetY) {
        scrollView.contentOffset = CGPointMake(0, tabOffsetY);
        if (_canScroll) {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"kScrollToTopNtf" object:@1];
            _canScroll = NO;
            self.contentCell.canScroll = YES;
        }
    } else {
        if (!_canScroll) {
            scrollView.contentOffset = CGPointMake(0, tabOffsetY);
        }
    }
}


-(void)configuration
{

    [self.view sd_addSubviews:@[self.headView]];

    self.headView.sd_layout
    .topEqualToView(self.view)
    .leftEqualToView(self.view)
    .widthIs(WIDTH)
    .heightIs(YF_H(498));


     [self.headView sd_addSubviews:@[self.headDownView,self.assetsView,self.myRedPacketsButton,self.inviteFriendsButton,self.availableBalanceLabel,self.availableBalanceLabelNumberLabel,self.amountFrozenLabel,self.amountFrozenNumberLabel,self.withdrawalButton,self.topUpButton]];

    self.headDownView.sd_layout
    .topEqualToView(self.headView)
    .leftEqualToView(self.headView)
    .widthIs(WIDTH)
    .heightIs(YF_H(152));

    [self.headDownView sd_addSubviews:@[self.headImageView,self.nickNameLabel,self.settingButton,self.messageButton]];

    self.headImageView.sd_layout
    .topSpaceToView(self.headDownView, YF_H(45))
    .leftSpaceToView(self.headDownView, YF_W(14))
    .widthIs(YF_W(50))
    .heightIs(YF_H(50));

    self.nickNameLabel.sd_layout
    .topSpaceToView(self.headDownView, YF_H(57))
    .leftSpaceToView(self.headImageView, YF_W(8))
    .widthIs(YF_W(150))
    .heightIs(YF_H(24));

    self.settingButton.sd_layout
    .topSpaceToView(self.headDownView, YF_H(70))
    .rightSpaceToView(self.headDownView, YF_W(14))
    .widthIs(YF_W(29))
    .heightIs(YF_H(25));

    self.messageButton.sd_layout
    .topSpaceToView(self.headDownView, YF_H(70))
    .rightSpaceToView(self.settingButton, YF_W(24))
    .widthIs(YF_W(25))
    .heightIs(YF_H(25));


    self.assetsView.sd_layout
    .topSpaceToView(self.headView, YF_H(115))
    .leftSpaceToView(self.headView, YF_W(14))
    .widthIs(WIDTH-YF_W(28))
    .heightIs(YF_H(167));

    [self.assetsView sd_addSubviews:@[self.assetsLabel,self.assetsNumberLabel,self.stayStillLabel,self.stayStillNumberLabel,self.hasBeenCastLabel,self.hasBeenCastNumberLabel,self.cumulativeLabel,self.cumulativeNumberLabel]];

    UIButton *oneIimageView = [[UIButton alloc] init];
    oneIimageView.tag=0;
    [oneIimageView setEnlargeEdge:YF_W(25)];
    [oneIimageView setImage:[UIImage imageNamed:@"shuomingImage"] forState:UIControlStateNormal];
    [oneIimageView addTarget:self action:@selector(imageButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.assetsView addSubview:oneIimageView];
    
    oneIimageView.sd_layout
    .topSpaceToView(self.assetsView, YF_H(21))
    .leftSpaceToView(self.assetsView, YF_W(70))
    .widthIs(YF_W(18))
    .heightIs(YF_H(18));
    
    self.assetsLabel.sd_layout
    .topSpaceToView(self.assetsView, YF_H(20))
    .leftSpaceToView(self.assetsView, YF_W(14))
    .widthIs(YF_W(60))
    .heightIs(YF_H(20));

    self.assetsNumberLabel.sd_layout
    .topSpaceToView(self.assetsView, YF_H(42))
    .leftSpaceToView(self.assetsView, YF_W(14))
    .widthIs(YF_W(150))
    .heightIs(YF_H(28));

    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"xuxianImage"];
    [self.assetsView addSubview:imageView];

    imageView.sd_layout
    .topSpaceToView(self.assetsView, YF_H(85))
    .leftSpaceToView(self.assetsView, YF_W(14))
    .widthIs(YF_W(319))
    .heightIs(YF_H(1));


//    self.stayStillLabel.sd_layout
//    .topSpaceToView(self.assetsView, YF_H(103))
//    .leftSpaceToView(self.assetsView, YF_W(14))
//    .widthIs(YF_W(75))
//    .heightIs(YF_H(17));
//
//    self.stayStillNumberLabel.sd_layout
//    .topSpaceToView(self.assetsView, YF_H(123))
//    .leftSpaceToView(self.assetsView, YF_W(14))
//    .widthIs(YF_W(85))
//    .heightIs(YF_H(24));
//
//    self.hasBeenCastLabel.sd_layout
//    .topSpaceToView(self.assetsView, YF_H(103))
//    .leftSpaceToView(self.assetsView, YF_W(14))
//    .widthIs(WIDTH- YF_W(56))
//    .heightIs(YF_H(17));
//
//    self.hasBeenCastNumberLabel.sd_layout
//    .topSpaceToView(self.assetsView, YF_H(123))
//    .leftSpaceToView(self.assetsView, YF_W(14))
//    .widthIs(WIDTH- YF_W(56))
//    .heightIs(YF_H(24));
    
    UIButton *twoIimageView = [[UIButton alloc] init];
    twoIimageView.tag=1;
    [twoIimageView setEnlargeEdge:YF_W(25)];
    [twoIimageView setImage:[UIImage imageNamed:@"shuomingImage"] forState:UIControlStateNormal];
    [twoIimageView addTarget:self action:@selector(imageButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.assetsView addSubview:twoIimageView];
    
    twoIimageView.sd_layout
    .topSpaceToView(self.assetsView, YF_H(102))
    .leftSpaceToView(self.assetsView, YF_W(122))
    .widthIs(YF_W(18))
    .heightIs(YF_H(18));
    

    self.cumulativeLabel.sd_layout
    .topSpaceToView(self.assetsView, YF_H(103))
    .leftSpaceToView(self.assetsView, YF_W(14))
    .widthIs(YF_W(150))
    .heightIs(YF_H(17));

    self.cumulativeNumberLabel.sd_layout
    .topSpaceToView(self.assetsView, YF_H(123))
    .leftSpaceToView(self.assetsView, YF_W(14))
    .widthIs(YF_W(85))
    .heightIs(YF_H(24));


#warning da


    self.myRedPacketsButton.sd_layout
    .topSpaceToView(self.headView, YF_H(302))
    .leftSpaceToView(self.headView, YF_W(14))
    .widthIs(YF_W(167))
    .heightIs(YF_H(35));
    
     [self.myRedPacketsButton setIconInLeftWithSpacing:YF_W(6)];


    self.inviteFriendsButton.sd_layout
    .topSpaceToView(self.headView, YF_H(302))
    .rightSpaceToView(self.headView, YF_W(14))
    .widthIs(YF_W(167))
    .heightIs(YF_H(37));
    [self.inviteFriendsButton setIconInLeftWithSpacing:YF_W(6)];

    UIImageView *imageViewfirst = [[UIImageView alloc] init];
    imageViewfirst.backgroundColor=LIGHTGREYCOLOR;
    [self.headView addSubview:imageViewfirst];

    imageViewfirst.sd_layout
    .topSpaceToView(self.inviteFriendsButton, YF_H(20))
    .leftSpaceToView(self.headView, YF_W(14))
    .widthIs(WIDTH - YF_W(28))
    .heightIs(YF_H(1));

    UIButton *threeIimageView = [[UIButton alloc] init];
    threeIimageView.tag=2;
    [threeIimageView setEnlargeEdge:YF_W(25)];
    [threeIimageView setImage:[UIImage imageNamed:@"shuomingImage"] forState:UIControlStateNormal];
    [threeIimageView addTarget:self action:@selector(imageButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.headView addSubview:threeIimageView];
    
    threeIimageView.sd_layout
    .topSpaceToView(self.myRedPacketsButton, YF_H(37))
    .leftSpaceToView(self.headView, YF_W(80))
    .widthIs(YF_W(18))
    .heightIs(YF_H(18));

    self.availableBalanceLabel.sd_layout
    .topSpaceToView(self.myRedPacketsButton, YF_H(36))
    .leftSpaceToView(self.headView, YF_W(14))
    .widthIs(YF_W(70))
    .heightIs(YF_H(20));

    self.availableBalanceLabelNumberLabel.sd_layout
    .topSpaceToView(self.myRedPacketsButton, YF_H(36))
    .leftSpaceToView(self.headView, YF_W(112))
    .widthIs(YF_W(200))
    .heightIs(YF_H(20));

    UIImageView *imageViewsecond = [[UIImageView alloc] init];
    imageViewsecond.image = [UIImage imageNamed:@"xuxianImage"];
    [self.headView addSubview:imageViewsecond];

    imageViewsecond.sd_layout
    .topSpaceToView(self.inviteFriendsButton, YF_H(66))
    .leftSpaceToView(self.headView, YF_W(14))
    .widthIs(WIDTH - YF_W(28))
    .heightIs(YF_H(1));

    UIButton *fourIimageView = [[UIButton alloc] init];
    fourIimageView.tag=3;
    [fourIimageView setEnlargeEdge:YF_W(25)];
    [fourIimageView setImage:[UIImage imageNamed:@"shuomingImage"] forState:UIControlStateNormal];
    [fourIimageView addTarget:self action:@selector(imageButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.headView addSubview:fourIimageView];
    
    fourIimageView.sd_layout
    .topSpaceToView(self.myRedPacketsButton, YF_H(78))
    .leftSpaceToView(self.headView, YF_W(80))
    .widthIs(YF_W(18))
    .heightIs(YF_H(18));
    
    self.amountFrozenLabel.sd_layout
    .topSpaceToView(self.myRedPacketsButton, YF_H(77))
    .leftSpaceToView(self.headView, YF_W(14))
    .widthIs(YF_W(90))
    .heightIs(YF_H(20));

    self.amountFrozenNumberLabel.sd_layout
    .topSpaceToView(self.myRedPacketsButton, YF_H(77))
    .leftSpaceToView(self.headView, YF_W(112))
    .widthIs(YF_W(200))
    .heightIs(YF_H(20));

    UIImageView *imageViewthird = [[UIImageView alloc] init];
    imageViewthird.backgroundColor=LIGHTGREYCOLOR;
    [self.headView addSubview:imageViewthird];

    imageViewthird.sd_layout
    .topSpaceToView(self.inviteFriendsButton, YF_H(112))
    .leftSpaceToView(self.headView, YF_W(14))
    .widthIs(WIDTH - YF_W(28))
    .heightIs(YF_H(1));

    [self.headView sd_addSubviews:@[self.withdrawalButton,self.topUpButton]];

    self.withdrawalButton.sd_layout
    .topSpaceToView(self.headView, YF_H(433))
    .rightSpaceToView(self.headView, YF_W(14))
    .widthIs(YF_W(35))
    .heightIs(YF_H(35));

    self.topUpButton.sd_layout
    .topSpaceToView(self.headView, YF_H(433))
    .rightSpaceToView(self.withdrawalButton, YF_W(25))
    .widthIs(YF_W(35))
    .heightIs(YF_H(35));

    UIView *view=[[UIView alloc] init];
    view.backgroundColor=LIGHTGREYCOLOR;
    [self.headView addSubview:view];

    view.sd_layout
    .bottomEqualToView(self.headView)
    .leftEqualToView(self.headView)
    .widthIs(WIDTH)
    .heightIs(YF_H(10));



}

#pragma mark - lazy

-(UIView *)headView
{
    if (!_headView) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = WHITECOLOR;
        view.userInteractionEnabled =YES;
        _headView = view;
    }
    return _headView;
}

-(UIView *)headDownView
{
    if (!_headDownView) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = ZHUTICOLOR;
       
        view.userInteractionEnabled =YES;
        _headDownView = view;
    }
    return _headDownView;
}
#pragma mark 执行触发的方法

-(void)event:(UITapGestureRecognizer *)gesture
{
    YFAccountInformationViewController *YFAccountInformationVC=[[YFAccountInformationViewController alloc]init];
    [self.navigationController pushViewController:YFAccountInformationVC animated:YES];

}

-(void)imageButtonClick:(UIButton *)sender
{
    NSString *messageString=@"";
    if (sender.tag==0) {
        messageString=@"总资产=未发放收益+当前冻结金额+可用余额";
    }
    if (sender.tag==1) {
        messageString=@"累计收益(包含已发放收益和未发放收益)";
    }
    if (sender.tag==2) {
        messageString=@"当前账户可使用金额";
    }
    if (sender.tag==3) {
        messageString=@"即当前正在投资中的金额";
    }
    
    UIAlertView  *alertView = [[UIAlertView alloc] initWithTitle:nil message:messageString delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alertView show];
}

-(UIImageView *)headImageView
{
    if (!_headImageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.layer.cornerRadius = YF_W(50)/2;
        imageView.layer.masksToBounds=YES;
        imageView.image =[UIImage imageNamed:@"headImage"];
        imageView.backgroundColor=[UIColor cyanColor];
        imageView.userInteractionEnabled =YES;
        UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(event:)];
        [imageView addGestureRecognizer:tapGesture];
        _headImageView = imageView;
    }
    return _headImageView;
}


-(UILabel *)nickNameLabel
{
    if (!_nickNameLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(17);
        label.textColor =WHITECOLOR;
        label.text =[YFTool userDefaultsId:YFMEMBERNO];
        _nickNameLabel = label;
    }
    return _nickNameLabel;
}


-(UIButton *)messageButton
{
    if (!_messageButton) {
        UIButton *button=[[UIButton alloc] init];
        [button setImage:[UIImage imageNamed:@"messageImage"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(messageClick) forControlEvents:UIControlEventTouchUpInside];
        [button setEnlargeEdge:YF_W(40)];
        _messageButton = button;

    }
    return _messageButton;
}
-(void)messageClick
{
    YFMessageCenterViewController *YFMineMessageVC=[[YFMessageCenterViewController alloc]init];
    [self.navigationController pushViewController:YFMineMessageVC animated:YES];
}


-(UIButton *)settingButton
{
    if (!_settingButton) {
        UIButton *button=[[UIButton alloc] init];
        [button setImage:[UIImage imageNamed:@"settingImage"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(settingClick) forControlEvents:UIControlEventTouchUpInside];
        [button setEnlargeEdge:YF_W(40)];
        _settingButton = button;

    }
    return _settingButton;
}
-(void)settingClick
{
    YFCapitalSubsidiaryViewController *YFCapitalSubsidiaryVC=[[YFCapitalSubsidiaryViewController alloc] init];
    [self.navigationController pushViewController:YFCapitalSubsidiaryVC animated:YES];
}

-(UIView *)assetsView
{
    if (!_assetsView) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = WHITECOLOR;
        view.layer.cornerRadius = YF_W(8);
        view.userInteractionEnabled =YES;
        view.layer.shadowColor = [UIColor lightGrayColor].CGColor;//阴影颜色
        view.layer.shadowOffset = CGSizeMake(1, 2);//偏移距离
        view.layer.shadowOpacity = 0.8f;//不透明度
        view.layer.shadowRadius = 2.0;//半径r
        _assetsView = view;
    }
    return _assetsView;
}


-(UILabel *)assetsLabel
{
    if (!_assetsLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =[YFTool YFColorWithString:@"999999"];
        label.text =@"总资产";
        _assetsLabel = label;
    }
    return _assetsLabel;
}

-(UILabel *)assetsNumberLabel
{
    if (!_assetsNumberLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(20);
        label.textColor =ZHUTICOLOR;
        label.text =@"0.00";
        _assetsNumberLabel = label;
    }
    return _assetsNumberLabel;
}


-(UILabel *)stayStillLabel
{
    if (!_stayStillLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textColor =[YFTool YFColorWithString:@"999999"];
        label.text =@"待还金额(元)";
        _stayStillLabel = label;
    }
    return _stayStillLabel;
}


-(UILabel *)stayStillNumberLabel
{
    if (!_stayStillNumberLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(17);
        label.textColor =ZHUTICOLOR;
        label.text =@"0.00";
        _stayStillNumberLabel = label;
    }
    return _stayStillNumberLabel;
}



-(UILabel *)hasBeenCastLabel
{
    if (!_hasBeenCastLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textAlignment= NSTextAlignmentCenter;
        label.textColor =[YFTool YFColorWithString:@"999999"];
        label.text =@"已投金额(元)";
        _hasBeenCastLabel = label;
    }
    return _hasBeenCastLabel;
}


-(UILabel *)hasBeenCastNumberLabel
{
    if (!_hasBeenCastNumberLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(17);
        label.textAlignment= NSTextAlignmentCenter;
        label.textColor =ZHUTICOLOR;
        label.text =@"0.00";
        _hasBeenCastNumberLabel = label;
    }
    return _hasBeenCastNumberLabel;
}



-(UILabel *)cumulativeLabel
{
    if (!_cumulativeLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =[YFTool YFColorWithString:@"999999"];
        label.text =@"累计净回报(元)";
        _cumulativeLabel = label;
    }
    return _cumulativeLabel;
}


-(UILabel *)cumulativeNumberLabel
{
    if (!_cumulativeNumberLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(20);
        label.textColor =ZHUTICOLOR;
        label.text =@"0.00";
        _cumulativeNumberLabel = label;
    }
    return _cumulativeNumberLabel;
}




-(UIButton *)myRedPacketsButton
{
    if (!_myRedPacketsButton) {
        UIButton *button=[[UIButton alloc] init];
        button.backgroundColor =[YFTool YFColorWithString:@"FFCA9F"];
        [button setTitle:@"  我的奖券" forState:UIControlStateNormal];
        [button setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        button.layer.cornerRadius = YF_W(15);
        [button setImage:[UIImage imageNamed:@"myRedPacketsImage"] forState:UIControlStateNormal];
        button.layer.masksToBounds = YES;
        button.titleLabel.font = YF_FONT(14);
        [button addTarget:self action:@selector(myRedPacketsClick) forControlEvents:UIControlEventTouchUpInside];
        _myRedPacketsButton = button;

    }
    return _myRedPacketsButton;
}

-(void)myRedPacketsClick
{
    TFMyRedPacketsViewController *TFMyRedPacketsVC=[[TFMyRedPacketsViewController alloc] init];
    [self.navigationController pushViewController:TFMyRedPacketsVC animated:YES];
}


-(UIButton *)inviteFriendsButton
{
    if (!_inviteFriendsButton) {
        UIButton *button=[[UIButton alloc] init];
        button.backgroundColor =[YFTool YFColorWithString:@"FFB87E"];
        [button setTitle:@"  邀请好友" forState:UIControlStateNormal];
        [button setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        button.layer.cornerRadius = YF_W(15);
        button.layer.masksToBounds = YES;
        button.titleLabel.font = YF_FONT(14);
        [button setImage:[UIImage imageNamed:@"inviteFriendsImage"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(inviteFriendsClick) forControlEvents:UIControlEventTouchUpInside];
        _inviteFriendsButton = button;

    }
    return _inviteFriendsButton;
}

-(void)inviteFriendsClick
{
    YFMyInvitationViewController *YFPhoneNumberInputVC=[[YFMyInvitationViewController alloc]init];
    [self.navigationController pushViewController:YFPhoneNumberInputVC animated:YES];
}

-(UILabel *)availableBalanceLabel
{
    if (!_availableBalanceLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =[YFTool YFColorWithString:@"666666"];
        label.text =@"可用余额";
        _availableBalanceLabel = label;
    }
    return _availableBalanceLabel;
}


-(UILabel *)availableBalanceLabelNumberLabel
{
    if (!_availableBalanceLabelNumberLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =[YFTool YFColorWithString:@"333333"];
        label.text =@"0.00元";
        _availableBalanceLabelNumberLabel = label;
    }
    return _availableBalanceLabelNumberLabel;
}

-(UILabel *)amountFrozenLabel
{
    if (!_amountFrozenLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =[YFTool YFColorWithString:@"666666"];
        label.text =@"冻结金额";
        _amountFrozenLabel = label;
    }
    return _amountFrozenLabel;
}


-(UILabel *)amountFrozenNumberLabel
{
    if (!_amountFrozenNumberLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.textColor =[YFTool YFColorWithString:@"333333"];
        label.text =@"0.00元";
        _amountFrozenNumberLabel = label;
    }
    return _amountFrozenNumberLabel;
}


-(UIButton *)topUpButton
{
    if (!_topUpButton) {
        UIButton *button=[[UIButton alloc] init];
        button.backgroundColor =ZHUTICOLOR;
        [button setTitle:@"充值" forState:UIControlStateNormal];
        [button setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        button.layer.cornerRadius = YF_W(35)/2;
        button.layer.masksToBounds = YES;
        button.titleLabel.font = YF_FONT(12);
        [button addTarget:self action:@selector(topUpClick) forControlEvents:UIControlEventTouchUpInside];
        _topUpButton = button;

    }
    return _topUpButton;
}

-(void)topUpClick
{
    /*
     充值/提现 前验证两个存管账户是否都有在用银行卡
     */
    
    [self ValidBankCard:0];
  
}


-(void)TiedCardPopSuccessfulType:(NSInteger)type
{
    if (type==1) {
        
        YFMineBnakCardAllViewController *YFMineBnakCardAllVC=[[YFMineBnakCardAllViewController alloc]init];
        [self.navigationController pushViewController:YFMineBnakCardAllVC animated:YES];

    }
}


-(UIButton *)withdrawalButton
{
    if (!_withdrawalButton) {
        UIButton *button=[[UIButton alloc] init];
        button.backgroundColor =[YFTool YFColorWithString:@"FFB87E"];
        [button setTitle:@"提现" forState:UIControlStateNormal];
        [button setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        button.layer.cornerRadius = YF_W(35)/2;
        button.layer.masksToBounds = YES;
        button.titleLabel.font = YF_FONT(12);
        [button addTarget:self action:@selector(withdrawalClick) forControlEvents:UIControlEventTouchUpInside];
        _withdrawalButton = button;

    }
    return _withdrawalButton;
}

-(void)withdrawalClick
{
    /*
     充值/提现 前验证两个存管账户是否都有在用银行卡
     */
    
    [self ValidBankCard:1];
}

-(void)ValidBankCard:(NSInteger )type
{
    //        获取是否开通借款者存管 IS_DEPOSITORY_B       取是否开通投资者存管 IS_DEPOSITORY             0未开通 1已开通 9正在申请中

    if ([[YFTool userDefaultsId:YFisDepository] integerValue]==0 ||[[YFTool userDefaultsId:YFisDepositoryB] integerValue]==0) {
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        _CustomOpenTheDepositoryView =[[YFCustomOpenTheDepositoryView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
        _CustomOpenTheDepositoryView.OpenTheDepositoryDelegate=self;
        [window addSubview:_CustomOpenTheDepositoryView];
        
        return;
    }else if ([[YFTool userDefaultsId:YFisDepository] integerValue] == 9 ){
        [YFProgressHUD showInfoWithStatus:@"投资者存管正在审核中"];
        return;
    }else if ([[YFTool userDefaultsId:YFisDepositoryB] integerValue] == 9){

        [YFProgressHUD showInfoWithStatus:@"借款者存管正在审核中"];
        return;
    }
    
 
    [YFProgressHUD showWithStatus:nil];
    [YFMineRequest YFValidBankCardSuccess:^(id json) {
        
        if ([YFTool Nsdic:json]==1) {
            NSLog(@"111 == %@",json);
            NSDictionary *dataDic=[json objectForKey:@"data"];
            /*
             已绑定银行卡
             */
            if ([[NSString stringWithFormat:@"%@",[dataDic objectForKey:@"status"]] integerValue]==1) {
                /*
                 充值账户
                 */
                if (type==0) {
                    YFTopUpViewController *YFTopUpVC=[[YFTopUpViewController alloc] init];
                    [self.navigationController pushViewController:YFTopUpVC animated:YES];
                }
                /*
                 提现
                 */
                if (type==1) {
                    
                    NSLog(@"2222 = %@  33333 ===%@",_TZNumberString,_JKNumberString);
                    
                    if ([_TZNumberString floatValue]<0) {
                        _TZNumberString=@"0";
                    }
                    if ([_JKNumberString floatValue]<0) {
                        _JKNumberString=@"0";
                    }
                    YFWithdrawalViewController *YFWithdrawalVC=[[YFWithdrawalViewController alloc] init];
                    YFWithdrawalVC.investorString=[NSString stringWithFormat:@"%@",_TZNumberString];
                    YFWithdrawalVC.borrowerString=[NSString stringWithFormat:@"%@",_JKNumberString];
                    [self.navigationController pushViewController:YFWithdrawalVC animated:YES];
                }
                
            }
            /*
             未绑定银行卡
             */
            if ([[NSString stringWithFormat:@"%@",[dataDic objectForKey:@"status"]] integerValue]==0) {
                
                UIWindow *window = [UIApplication sharedApplication].keyWindow;
                _tiedCardPopView =[[YFTiedCardPopView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
                _tiedCardPopView.TiedCardPopDelegate=self;
                _tiedCardPopView.tag=1;
                _tiedCardPopView.tittleLabel.text=@"您未绑定银行卡,将不能进行提现操作";
                [window addSubview:_tiedCardPopView];
                
            }


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

/*
  数据请求
 */
-(void)DataRequest
{
    [YFMineRequest YFPageNumString:@"1" PageSizeString:@"10" success:^(id json) {
        
        if ([YFTool Nsdic:json]==1) {
           
            
            NSDictionary *dic=[json objectForKey:@"data"];
            NSDictionary *accountDic=[dic objectForKey:@"account"];
            NSDictionary *memberDetailDic=[dic objectForKey:@"memberDetail"];
            
            _TZNumberString=[dic objectForKey:@"investor"];
            _JKNumberString=[dic objectForKey:@"borrower"];
           
            NSLog(@"6666 == %@",memberDetailDic);
            /*
             借款存管账户开通标记
             */
            [YFTool setObject:[memberDetailDic objectForKey:@"isDepositoryB"] key:YFisDepositoryB];
            /*
             投资存管账户开通标记
             */
            [YFTool setObject:[memberDetailDic objectForKey:@"isDepository"] key:YFisDepository];
            
            /**TODO   颁发众签数字证书且签署金米袋用户授权委托书（并签署三方协议）*/
            if ([memberDetailDic objectForKey:@"isDepositoryB"] || [memberDetailDic objectForKey:@"isDepository"]) {
                if (!([memberDetailDic[@"isThird"] integerValue] == 1 && [memberDetailDic[@"isDigital"] integerValue] == 1)) {
                    //请求
                    [YFMineRequest YFDigitalSignAuthSuccess:^(id json) {
                        
                    } failure:^(NSError *error) {
                        
                    }];
                }
            }
            if ([[YFTool userDefaultsId:YFisDepository] integerValue]==1 &&[[YFTool userDefaultsId:YFisDepositoryB] integerValue]==1) {
               
                /*
                 昵称
                 */
                if (![[memberDetailDic objectForKey:@"realname"] isKindOfClass:[NSNull class]]) {
                    NSMutableString * safeBase64Str = [[NSMutableString alloc]initWithString:[memberDetailDic objectForKey:@"realname"]];
                    safeBase64Str = (NSMutableString * )[safeBase64Str stringByReplacingOccurrencesOfString:@"-" withString:@"+"];
                    safeBase64Str = (NSMutableString * )[safeBase64Str stringByReplacingOccurrencesOfString:@"_" withString:@"/"];
                    NSInteger mod4 = safeBase64Str.length % 4;
                    if(mod4 > 0)
                        [safeBase64Str appendString:[@"====" substringToIndex:(4-mod4)]];
                    [YFTool setObject:[safeBase64Str aci_decryptWithAES] key:YFNICK];
                }
              
                
            }
            if ([[YFTool userDefaultsId:YFisDepository] integerValue]==0 || [[YFTool userDefaultsId:YFisDepositoryB] integerValue]==0) {
                
                /*
                 昵称
                 */
                
                [YFTool setObject:@"" key:YFNICK];
                
            }
            /*
             数据刷新
             */
            [self dataAssignment:accountDic];
            
           
        }
      else if ([[json objectForKey:@"error"] isEqualToString:@"invalid_token"]) {
           
            [YFLoginManager showLogViewVC];
            self.tabBarController.selectedIndex=0;
        }
      else{
          
          [YFProgressHUD showInfoWithStatus:MESSAGE];
      }
        
    } failure:^(NSError *error) {

        
    }];
}

-(void)dataAssignment:(NSDictionary *)accountDic
{
    /*
     名字
     */
    self.nickNameLabel.text=[YFTool userDefaultsId:YFMEMBERNO];
    
    /*
     总资产
     */
    self.assetsNumberLabel.text=[NSString stringWithFormat:@"%.2f",[[accountDic objectForKey:@"total"] doubleValue]];
    /*
     待还金额(元)
     */
    self.stayStillNumberLabel.text=[NSString stringWithFormat:@"%.2f",[[accountDic objectForKey:@"waitRepay"] doubleValue]];
    /*
     已投金额(元)
     */
    self.hasBeenCastNumberLabel.text=[NSString stringWithFormat:@"%.2f",[[accountDic objectForKey:@"investment"] doubleValue]];
    /*
     累计净回报(元)
     */
    self.cumulativeNumberLabel.text=[NSString stringWithFormat:@"%.2f",[[accountDic objectForKey:@"netReturn"] doubleValue]];
    /*
     可用余额
     */
    self.availableBalanceLabelNumberLabel.text=[NSString stringWithFormat:@"%.2f",[[accountDic objectForKey:@"available"] doubleValue]];
    /*
     当前冻结金额
     */
    self.amountFrozenNumberLabel.text=[NSString stringWithFormat:@"%.2f",[[accountDic objectForKey:@"freeze"] doubleValue]];
    
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
