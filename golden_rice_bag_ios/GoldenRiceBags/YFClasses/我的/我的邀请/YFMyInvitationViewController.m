//
//  YFMyInvitationViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/4/16.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFMyInvitationViewController.h"

@interface YFMyInvitationViewController ()<UITableViewDelegate,UITableViewDataSource>

/*
 tableview
 */
@property(nonatomic,strong)YFBaseTableView *YFTableView;

/*
 headerView
 */
@property(nonatomic,strong)YFMyInvitationView *MyInvitationHeaderView;

/*
 立刻购买
 */
@property(nonatomic,strong)UIButton *YFButton;
@end

@implementation YFMyInvitationViewController
static NSString *cellId = @"YFMyInvitationTableViewCell";

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
    [self configuration];
    // Do any additional setup after loading the view.
}

-(void)configuration
{
    [self.view sd_addSubviews:@[self.YFTableView,self.YFButton]];
    
    self.YFTableView.sd_layout
    .topSpaceToView(self.view, YF_H(0))
    .leftSpaceToView(self.view, 0)
    .widthIs(WIDTH)
    .heightIs(HEIGHT - YF_H(49));
    

      [self.YFTableView setTableHeaderView:self.MyInvitationHeaderView];
    
    if (@available(iOS 11.0, *)) {
        self.YFTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    self.YFButton.sd_layout
    .bottomEqualToView(self.view)
    .leftSpaceToView(self.view, 0)
    .widthIs(WIDTH)
    .heightIs(YF_H(49));
    
    
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
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return YF_H(55);
    
    
    
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
    label.text =@"奖励记录";
    [view addSubview:label];
    
    label.sd_layout
    .leftSpaceToView(view, YF_W(32))
    .widthIs(YF_W(150))
    .heightIs(YF_H(24))
    .centerYEqualToView(view);

    
    
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return YF_H(62);
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 3;
    
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    YFMyInvitationTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell == nil) {
        cell = [[YFMyInvitationTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
    }
    
    return cell;
    
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
 
   
    
}

-(YFMyInvitationView *)MyInvitationHeaderView
{
    if (!_MyInvitationHeaderView) {
        YFMyInvitationView *view=[[YFMyInvitationView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, YF_H(399))];
        view.backgroundColor=WHITECOLOR;
        view.userInteractionEnabled=YES;
        _MyInvitationHeaderView=view;
        
    }
    return _MyInvitationHeaderView;
}


-(UIButton *)YFButton
{
    if (!_YFButton) {
        UIButton *button=[[UIButton alloc] init];
        button.backgroundColor =ZHUTICOLOR;
        [button setTitle:@"立即邀请" forState:UIControlStateNormal];
        [button setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        button.titleLabel.font = YF_FONT(17);
        [button addTarget:self action:@selector(openClick) forControlEvents:UIControlEventTouchUpInside];
        _YFButton = button;
        
    }
    return _YFButton;
}

-(void)openClick
{
   

    [UMSocialShareUIConfig shareInstance].sharePageGroupViewConfig.sharePageGroupViewPostionType = UMSocialSharePageGroupViewPositionType_Bottom;
    [UMSocialShareUIConfig shareInstance].sharePageScrollViewConfig.shareScrollViewPageItemStyleType = UMSocialPlatformItemViewBackgroudType_None;
    
    [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo) {
       
        
        
        
        if (platformType == UMSocialPlatformType_WechatSession) {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [self shareWebPageToPlatformType:UMSocialPlatformType_WechatSession];
                
            });
        }
        if (platformType == UMSocialPlatformType_Sms) {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [self shareWebPageToPlatformType:UMSocialPlatformType_Sms];
                
            });
        }
        if (platformType == UMSocialPlatformType_WechatTimeLine) {
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [self shareWebPageToPlatformType:UMSocialPlatformType_WechatTimeLine];
                
                
            });
        }
        if (platformType == UMSocialPlatformType_Sina) {
            
            NSLog(@"2222微博");
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [self shareWebPageToPlatformType:UMSocialPlatformType_Sina];
                
            });
        }
        
        if (platformType == UMSocialPlatformType_QQ) {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [self shareWebPageToPlatformType:UMSocialPlatformType_QQ];
                
            });
        }
        if (platformType == UMSocialPlatformType_Qzone) {
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [self shareWebPageToPlatformType:UMSocialPlatformType_Qzone];
                
                
            });
        }
        
    }];
    
    
}

-(void)shareWebPageToPlatformType:(UMSocialPlatformType)platformType
{
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    //创建网页内容对象
    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:@"测试名字" descr:@"123456测试" thumImage:[UIImage imageNamed:@"erweimaImage"]];
    //设置网页地址
    shareObject.webpageUrl =@"https://baike.baidu.com/item/丑八怪/12017342?fr=aladdin";
    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
    
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
        if (error) {
            NSLog(@"************Share fail with error %@*********",error);
            
        }else{
            NSLog(@"response data is %@",data);
            
        }
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
