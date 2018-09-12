//
//  YFModifyPhoneNumberAgainViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/20.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFModifyPhoneNumberAgainViewController.h"

@interface YFModifyPhoneNumberAgainViewController ()

@end

@implementation YFModifyPhoneNumberAgainViewController

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
    self.view.backgroundColor = WHITECOLOR;
    [self VerificationCodeView];
    [self configuration];
    // Do any additional setup after loading the view.
}

-(void)VerificationCodeView
{
    
    GTVerifyCodeView *codeView = [[GTVerifyCodeView alloc] initWithFrame:CGRectMake(0, YF_H(209),WIDTH, YF_H(60)) onFinishedEnterCode:^(NSString *code) {
        /*
         验证码验证
         */
        [YFProgressHUD showWithStatus:nil];
        [YFLoginRequest YFPhoneString:_phoneString keyCodeString:@"common" smsCodeString:code success:^(id json) {
            if ([YFTool Nsdic:json]==1) {
                
                [YFProgressHUD showSuccessWithStatus:MESSAGE];
               
                /*
                 验证手机号是否存在
                 */
                [self verifyPhone];
//
            }
            else{
                
                [YFProgressHUD showInfoWithStatus:MESSAGE];
            }
            
        } failure:^(NSError *error) {
            
        }];
        
        
        
        
    }];
    [self.view addSubview:codeView];
    _YFCodeView = codeView;
}
-(void)reset
{
    [_YFCodeView resetDefaultStatus];
}

-(void)configuration
{
    [self.view sd_addSubviews:@[self.backButton,self.VerificationLabel,self.VerificationedLabel,self.pleaseVerificationLabel,self.timeButton]];
    
    self.backButton.sd_layout
    .leftSpaceToView(self.view, YF_W(14))
    .topSpaceToView(self.view, YF_H(41))
    .widthIs(YF_W(10))
    .heightIs(YF_H(18));
    
    self.VerificationLabel.sd_layout
    .leftSpaceToView(self.view, YF_W(30))
    .topSpaceToView(self.view, YF_H(90))
    .widthIs(YF_W(150))
    .heightIs(YF_H(28));
    
    self.VerificationedLabel.sd_layout
    .leftSpaceToView(self.view, YF_W(32))
    .topSpaceToView(self.view, YF_H(148))
    .widthIs(YF_W(200))
    .heightIs(YF_H(20));
    
    self.pleaseVerificationLabel.sd_layout
    .leftSpaceToView(self.view, YF_W(32))
    .topSpaceToView(self.view, YF_H(182))
    .widthIs(YF_W(150))
    .heightIs(YF_H(17));
    
    
   [self.timeButton timeFailBeginFrom:60];
}


#pragma mark - lazy

-(UIButton *)backButton
{
    if (!_backButton) {
        UIButton *button=[[UIButton alloc] init];
        [button setImage:[UIImage imageNamed:@"backImage"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
        [button setEnlargeEdge:YF_W(30)];
        _backButton = button;
        
    }
    return _backButton;
}

-(void)backClick
{
    [self.navigationController popViewControllerAnimated:YES];
}


-(UILabel *)VerificationLabel
{
    if (!_VerificationLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(20);
        label.textColor =[YFTool YFColorWithString:@"333333"];
        label.text =@"输入验证码";
        _VerificationLabel = label;
    }
    return _VerificationLabel;
}


-(UILabel *)VerificationedLabel
{
    if (!_VerificationedLabel) {
        NSString *string =[NSString stringWithFormat:@"验证码已发送至%@", [_phoneString stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"]];
        NSMutableAttributedString *aString = [[NSMutableAttributedString alloc]initWithString:string];
        [aString addAttribute:NSForegroundColorAttributeName value:[YFTool YFColorWithString:@"999999"] range:NSMakeRange(0, 7)];
        [aString addAttribute:NSForegroundColorAttributeName value:ZHUTICOLOR range:NSMakeRange(7, string.length-7)];
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(14);
        label.attributedText =aString;
        _VerificationedLabel = label;
    }
    return _VerificationedLabel;
}


-(UILabel *)pleaseVerificationLabel
{
    if (!_pleaseVerificationLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.textColor =[YFTool YFColorWithString:@"333333"];
        label.text =@"请输入验证码";
        _pleaseVerificationLabel = label;
    }
    return _pleaseVerificationLabel;
}



-(TimeButton *)timeButton
{
    if (!_timeButton) {
        _timeButton = [TimeButton buttonWithType:UIButtonTypeCustom];
        _timeButton.backgroundColor = WHITECOLOR;
        [_timeButton setTitleColor:[YFTool YFColorWithString:@"999999"] forState:UIControlStateNormal];
        _timeButton.titleLabel.font = YF_FONT(14);
        [_timeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
        _timeButton.frame = CGRectMake(YF_W(242), YF_H(289), YF_W(100), YF_H(20));
        [_timeButton addTarget:self action:@selector(codeBtn) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _timeButton;
}

/* 发送验证码 */
-(void)codeBtn
{
    
    [YFSRFManager YFSrfSuccess:^(id json) {
        
        [self srfString:json];
        
    } failure:^(NSError *error) {
        
    }];
    
    
}
-(void)srfString:(NSString *)srfStr
{
    [YFProgressHUD showWithStatus:nil];
    [YFLoginRequest YFPhoneString:_phoneString keyCodeString:@"common" timeStampString:[YFTool getTimeNow] srfString:srfStr success:^(id json) {
        if ([YFTool Nsdic:json]==1) {
            NSLog(@"6666 == %@",json);
//            [YFProgressHUD showSuccessWithStatus:@"验证码已发送"];
             [YFProgressHUD showSuccessWithStatus:json[@"message"]];
            [_timeButton timeFailBeginFrom:60];
        }
        else{
            [YFProgressHUD showInfoWithStatus:MESSAGE];
        }
        
    } failure:^(NSError *error) {
        
    }];
}

-(void)verifyPhone
{
    [YFLoginRequest YFPhoneString:_phoneString success:^(id json) {
        if ([YFTool Nsdic:json]==1) {
            /*
             用户存在
             */
            [YFProgressHUD showInfoWithStatus:@"该手机号已注册"];
           
            [self.navigationController popViewControllerAnimated:YES];
            
        }
        else if ([YFTool Nsdic:json]==0)
        {
            /*
             用户不存在
             */
            /*
             修改手机号
             */
            [self changePhone];
        }
        else{
            
            [YFProgressHUD showInfoWithStatus:MESSAGE];
        }
        
    } failure:^(NSError *error) {
        
    }];
}


-(void)changePhone
{
    [YFProgressHUD showWithStatus:nil];
    
    [YFMineRequest YFResetPhoneString:_phoneString success:^(id json) {
        if ([YFTool Nsdic:json]==1) {

            if ([YFTool Nsdic:json]==1) {
                [YFProgressHUD showSuccessWithStatus:@"修改手机号成功"];
                /*
                 手机号
                 */
                [YFTool setObject:_phoneString key:YFPHONE];
                [self.navigationController popToRootViewControllerAnimated:YES];
                
                
            }
        }else{
            [YFProgressHUD showInfoWithStatus:MESSAGE];
            
            
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
