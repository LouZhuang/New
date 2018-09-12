//
//  YFLoginViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/13.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFLoginViewController.h"
#import <UMPush/UMessage.h>             // Push组件
@interface YFLoginViewController ()<UITextFieldDelegate>

/*
 返回按钮
 */
@property(nonatomic,strong)UIButton *deleteButton;
/*
 设置登录文字
 */
@property(nonatomic,strong)UILabel *loginLabel;


/*
 输入框
 */
@property(nonatomic,strong)UITextField *passwordTextField;

/*
 隐藏和显示密码
 */
@property(nonatomic,strong)UIButton *hiddenNoButton;


/*
 底部虚线
 */
@property(nonatomic,strong)UIImageView *xuXianView;


/*
 下一步按钮
 */
@property(nonatomic,strong)UIButton *theNextStepButton;

/*
 忘记密码按钮
 */
@property(nonatomic,strong)UIButton *forgotPasswordButton;



/*
 底部图片
 */
@property(nonatomic,strong)UIImageView *downView;

@end

@implementation YFLoginViewController


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
    [self configuration];
    // Do any additional setup after loading the view.
}


-(void)configuration
{
    [self.view sd_addSubviews:@[self.deleteButton,self.loginLabel,self.passwordTextField,self.xuXianView,self.theNextStepButton,self.downView,self.hiddenNoButton,self.forgotPasswordButton]];
    
    self.deleteButton.sd_layout
    .leftSpaceToView(self.view, YF_W(21.6))
    .topSpaceToView(self.view, YF_H(47.7))
    .widthIs(YF_W(18.7))
    .heightIs(YF_H(18.7));
    
    
    
    self.loginLabel.sd_layout
    .leftSpaceToView(self.view, YF_W(30))
    .topSpaceToView(self.view, YF_H(90))
    .widthIs(YF_W(150))
    .heightIs(YF_H(28));
    
    
    self.passwordTextField.sd_layout
    .leftSpaceToView(self.view, YF_W(30))
    .topSpaceToView(self.view, YF_H(148))
    .widthIs(YF_W(250))
    .heightIs(YF_H(24));
    
    self.xuXianView.sd_layout
    .leftSpaceToView(self.view, YF_W(30))
    .topSpaceToView(self.view, YF_H(182))
    .widthIs(YF_W(315))
    .heightIs(YF_H(1));
    
    self.theNextStepButton.sd_layout
    .leftSpaceToView(self.view, YF_W(68))
    .topSpaceToView(self.view, YF_H(253))
    .widthIs(WIDTH - YF_W(136))
    .heightIs(YF_H(49));
    
    
    
    self.downView.sd_layout
    .leftSpaceToView(self.view, YF_W(0))
    .bottomEqualToView(self.view)
    .widthIs(WIDTH)
    .heightIs(YF_H(282));
    
    self.hiddenNoButton.sd_layout
    .rightSpaceToView(self.view, YF_W(30))
    .topSpaceToView(self.view, YF_H(156))
    .widthIs(YF_W(20))
    .heightIs(YF_H(9));
    
    self.forgotPasswordButton.sd_layout
    .rightSpaceToView(self.view, YF_W(30))
    .topSpaceToView(self.view, YF_H(198))
    .widthIs(YF_W(75))
    .heightIs(YF_H(20));
    
}

#pragma mark - lazy


-(UIButton *)deleteButton
{
    if (!_deleteButton) {
        UIButton *button=[[UIButton alloc] init];
        [button setImage:[UIImage imageNamed:@"loginDeleteImage"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(deleteClick) forControlEvents:UIControlEventTouchUpInside];
        [button setEnlargeEdge:YF_W(30)];
        _deleteButton = button;
        
    }
    return _deleteButton;
}

-(void)deleteClick
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(UILabel *)loginLabel
{
    if (!_loginLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(20);
        label.textColor =[YFTool YFColorWithString:@"333333"];
        label.text =@"请输入登录密码";
        _loginLabel = label;
    }
    return _loginLabel;
}


-(UIImageView *)xuXianView
{
    if (!_xuXianView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image = [UIImage imageNamed:@"xuxianImage"];
        _xuXianView = imageView;
    }
    return _xuXianView;
}


- (UITextField *)passwordTextField {
    if (!_passwordTextField) {
        UITextField *textfield = [[UITextField alloc]init];
        textfield.font = YF_FONT(17);
        textfield.delegate = self;
        textfield.attributedPlaceholder =[YFTool nsstring:@"请输入您的密码"];
        textfield.secureTextEntry = YES;
        textfield.clearButtonMode = UITextFieldViewModeWhileEditing;
        textfield.clearsOnBeginEditing = YES;
        textfield.textColor =[YFTool YFColorWithString:@"333333"];
        [textfield addTarget:self action:@selector(phoneClick:) forControlEvents:UIControlEventEditingChanged];
        _passwordTextField = textfield;
    }
    return _passwordTextField;
}

-(void)phoneClick:(UITextField *)sender
{
    [self next];
  
}



-(UIButton *)hiddenNoButton
{
    if (!_hiddenNoButton) {
        UIButton *button=[[UIButton alloc] init];
        [button setImage:[UIImage imageNamed:@"secureTextEntryNOImage"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"secureTextEntryYESImage"] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(hiddenNoClick:) forControlEvents:UIControlEventTouchUpInside];
        [button setEnlargeEdge:YF_W(30)];
        _hiddenNoButton = button;
        
    }
    return _hiddenNoButton;
}

-(void)hiddenNoClick:(UIButton *)sender
{
    if (sender.selected == YES) {
        _passwordTextField.secureTextEntry = YES;
    }
    if (sender.selected == NO) {
        _passwordTextField.secureTextEntry = NO;
    }
    sender.selected = !sender.selected;
}



-(UIButton *)theNextStepButton
{
    if (!_theNextStepButton) {
        UIButton *button=[[UIButton alloc] init];
        button.backgroundColor =[YFTool YFColorWithString:@"DDDDDD"];
        [button setTitle:@"登录" forState:UIControlStateNormal];
        [button setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        button.layer.cornerRadius = YF_W(25);
        button.layer.masksToBounds = YES;
        button.titleLabel.font = YF_FONT(17);
        [button addTarget:self action:@selector(theNextStepClick) forControlEvents:UIControlEventTouchUpInside];
        _theNextStepButton = button;
        
    }
    return _theNextStepButton;
}

-(void)theNextStepClick
{
  
    
if ( [YFTool AreThereAnySpaceString:_passwordTextField.text]==YES) {
       [SVProgressHUD showWithStatus:nil];
       [YFLoginRequest YFUsernameString:_phoneString passwordString:_passwordTextField.text success:^(id json) {
           
               NSLog(@"LOGINYES == %@",json);
           
           
           if ([YFTool Nsdic:json]==1) {
               
               
               NSDictionary *dic=[json objectForKey:@"data"];
               
               [YFProgressHUD showSuccessWithStatus:MESSAGE];
               /*
                memberNo
                */
               [YFTool setObject:[dic objectForKey:@"memberNo"] key:YFMEMBERNO];
               /*
                id
                */
               [YFTool setObject:[dic objectForKey:@"id"] key:YFID];
               NSMutableString * safeBase64Str = [[NSMutableString alloc]initWithString:[dic objectForKey:@"cellPhone"]];
               safeBase64Str = (NSMutableString * )[safeBase64Str stringByReplacingOccurrencesOfString:@"-" withString:@"+"];
               safeBase64Str = (NSMutableString * )[safeBase64Str stringByReplacingOccurrencesOfString:@"_" withString:@"/"];
               NSInteger mod4 = safeBase64Str.length % 4;
               if(mod4 > 0)
                   [safeBase64Str appendString:[@"====" substringToIndex:(4-mod4)]];
               /*
                手机号
                */
               [YFTool setObject:[safeBase64Str aci_decryptWithAES] key:YFPHONE];
               /*
                access_token
                */
               [YFTool setObject:[dic objectForKey:@"accessToken"] key:YFAccess_Token];
               /*
                改变登录状态
                */
               [YFTool setObject:@"1" key:YFLOGIN];
               /*
               借款存管账户开通标记
                */
               [YFTool setObject:[dic objectForKey:@"isDepositoryB"] key:YFisDepositoryB];
               /*
               投资存管账户开通标记
                */
               [YFTool setObject:[dic objectForKey:@"isDepository"] key:YFisDepository];
               /*
                投资类型
                */
               [YFTool setObject:[dic objectForKey:@"investmentType"] key:YFInvestmentType];
               
               if ([[YFTool userDefaultsId:YFisDepository] integerValue]==1 &&[[YFTool userDefaultsId:YFisDepositoryB] integerValue]==1) {
                   if ([dic objectForKey:@"isDepositoryB"] || [dic objectForKey:@"isDepository"]) {
                       if (!([dic[@"isThird"] integerValue] == 1 && [dic[@"isDigital"] integerValue] == 1)) {
                           //请求
                           [YFMineRequest YFDigitalSignAuthSuccess:^(id json) {
                               
                           } failure:^(NSError *error) {
                               
                           }];
                       }
                   }
                   /*
                    昵称
                    */
                   NSMutableString * safeBase64Str = [[NSMutableString alloc]initWithString:[dic objectForKey:@"realname"]];
                   safeBase64Str = (NSMutableString * )[safeBase64Str stringByReplacingOccurrencesOfString:@"-" withString:@"+"];
                   safeBase64Str = (NSMutableString * )[safeBase64Str stringByReplacingOccurrencesOfString:@"_" withString:@"/"];
                   NSInteger mod4 = safeBase64Str.length % 4;
                   if(mod4 > 0)
                       [safeBase64Str appendString:[@"====" substringToIndex:(4-mod4)]];
                   
                   [YFTool setObject:[safeBase64Str aci_decryptWithAES] key:YFNICK];
                   
               }
               if ([[YFTool userDefaultsId:YFisDepository] integerValue]==0 || [[YFTool userDefaultsId:YFisDepositoryB] integerValue]==0) {
                   
                   /*
                    昵称
                    */
                   
                   [YFTool setObject:@"" key:YFNICK];
                   
               }
               [UMessage addAlias:[dic objectForKey:@"id"] type:@"UMENGPUSH" response:^(id  _Nonnull responseObject, NSError * _Nonnull error) {
                   
               }];
               [[NSNotificationCenter defaultCenter] postNotificationName:@"LoginYes" object:nil];
               
            
//               /*
//                注册推送
//                */
//               [YFLoginRequest YFRegisterSuccess:^(id json) {
//                  
//                   NSLog(@"tokenLogin222 === %@",json);
//                   
//               } failure:^(NSError *error) {
//                   
//               }];
               
               
               
               /*
                确定并登录
                */
               [self dismissViewControllerAnimated:YES completion:nil];
               
           }
           else{
               [YFProgressHUD showInfoWithStatus:MESSAGE];
           }
           
       } failure:^(NSError *error) {
    
           
       }];
       
    }
    
}


-(UIButton *)forgotPasswordButton
{
    if (!_forgotPasswordButton) {
        UIButton *button=[[UIButton alloc] init];
        [button setTitle:@"忘记密码" forState:UIControlStateNormal];
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        [button setTitleColor:[YFTool YFColorWithString:@"999999"] forState:UIControlStateNormal];
        button.titleLabel.font = YF_FONT(14);
        [button addTarget:self action:@selector(forgotPasswordpClick) forControlEvents:UIControlEventTouchUpInside];
        _forgotPasswordButton = button;
        
    }
    return _forgotPasswordButton;
}

-(void)forgotPasswordpClick
{
    [YFProgressHUD showWithStatus:nil];
    [YFLoginRequest YFValidCertificationUsernameString:_phoneString success:^(id json) {
         NSLog(@"11111 == %@",json);
         if ([YFTool Nsdic:json]==1) {
           
             NSDictionary *dataDic=[json objectForKey:@"data"];
             
             /*
              该手机号没有实名
              */
             if ([[dataDic objectForKey:@"status"] integerValue]==0) {
                 
                 YFForgotPasswordChangeViewController *YFForgotPasswordVC=[[YFForgotPasswordChangeViewController alloc] init];
                 YFForgotPasswordVC.phoneString=_phoneString;
                 YFForgotPasswordVC.nameString=@"";
                 [self.navigationController pushViewController:YFForgotPasswordVC animated:YES];
             }
             /*
              该手机号已经实名
              */
             if ([[dataDic objectForKey:@"status"] integerValue]==1) {
                 YFForgotPasswordViewController *YFForgotPasswordVC=[[YFForgotPasswordViewController alloc] init];
                 YFForgotPasswordVC.nameString=[dataDic objectForKey:@"name"];
                 YFForgotPasswordVC.phoneString=_phoneString;
                 [self.navigationController pushViewController:YFForgotPasswordVC animated:YES];
                 
             }
             
             
         }
         else{
             [YFProgressHUD showInfoWithStatus:MESSAGE];
         }
        
        
    } failure:^(NSError *error) {
        
    }];
    
    
   
}



-(UIImageView *)downView
{
    if (!_downView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image = [UIImage imageNamed:@"downImage"];
        _downView = imageView;
    }
    return _downView;
}

/*
 判断是否可进入下一步
 */
-(void)next
{

    if ([YFTool judgePassWordLegal:_passwordTextField.text]==YES && [YFTool AreThereAnySpaceString:_passwordTextField.text]==YES) {
        _theNextStepButton.backgroundColor = ZHUTICOLOR;
    }
    if ([YFTool judgePassWordLegal:_passwordTextField.text] == NO ||[YFTool AreThereAnySpaceString:_passwordTextField.text]==NO) {
        _theNextStepButton.backgroundColor = [YFTool YFColorWithString:@"DDDDDD"];
    }
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
