//
//  YFSetLoginPasswordViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/13.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFSetLoginPasswordViewController.h"

@interface YFSetLoginPasswordViewController ()<UITextFieldDelegate>


/*
 返回按钮
 */
@property(nonatomic,strong)UIButton *backButton;


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
 规则文字
 */
@property(nonatomic,strong)UILabel *rulesLabel;

/*
 下一步按钮
 */
@property(nonatomic,strong)UIButton *theNextStepButton;

/*
 底部图片
 */
@property(nonatomic,strong)UIImageView *downView;

@end

@implementation YFSetLoginPasswordViewController


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
    [self.view sd_addSubviews:@[self.backButton,self.loginLabel,self.passwordTextField,self.xuXianView,self.theNextStepButton,self.rulesLabel,self.downView,self.hiddenNoButton]];
    
    self.backButton.sd_layout
    .leftSpaceToView(self.view, YF_W(14))
    .topSpaceToView(self.view, YF_H(41))
    .widthIs(YF_W(10))
    .heightIs(YF_H(18));
    
    
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
    
    self.rulesLabel.sd_layout
    .leftSpaceToView(self.view, YF_W(30))
    .topSpaceToView(self.view, YF_H(193))
    .widthIs(WIDTH - YF_W(60))
    .heightIs(YF_H(34));
    
    
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
        label.text =@"设置登录密码";
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
        textfield.attributedPlaceholder =[YFTool nsstring:@"请输入8-16位密码"];
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


-(UILabel *)rulesLabel
{
    if (!_rulesLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(12);
        label.numberOfLines = 0;
        label.textColor =[YFTool YFColorWithString:@"999999"];
        label.text =@"请输入8-16位密码，必须包含“数字、字母、符号”其中2种，不能包含手机号，空格";
        _rulesLabel = label;
    }
    return _rulesLabel;
}


-(UIButton *)theNextStepButton
{
    if (!_theNextStepButton) {
        UIButton *button=[[UIButton alloc] init];
        button.backgroundColor =[YFTool YFColorWithString:@"DDDDDD"];
        [button setTitle:@"下一步" forState:UIControlStateNormal];
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
    NSRange range = [_passwordTextField.text rangeOfString:_phoneString];
    if (range.location!=NSNotFound) {
        [YFProgressHUD showInfoWithStatus:@"密码中不能包含手机号"];
        
        return;
    }
    
   if ([YFTool judgePassWordLegal:_passwordTextField.text]==YES && [YFTool AreThereAnySpaceString:_passwordTextField.text]==YES) {
       YFEnterPasswordAgainViewController *YFEnterPasswordAgainVc =[[YFEnterPasswordAgainViewController alloc] init];
       YFEnterPasswordAgainVc.passwordString =_passwordTextField.text;
       YFEnterPasswordAgainVc.phoneString =_phoneString;
       YFEnterPasswordAgainVc.inviterPhoneString =_inviterPhoneString;
       [self.navigationController pushViewController:YFEnterPasswordAgainVc animated:YES];
    }
    
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
