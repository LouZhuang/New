//
//  YFPhoneNumberInputViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/3/13.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFPhoneNumberInputViewController.h"

@interface YFPhoneNumberInputViewController ()<UITextFieldDelegate>

/*
 返回按钮
 */
@property(nonatomic,strong)UIButton *deleteButton;


/*
 输入手机号文字
 */
@property(nonatomic,strong)UILabel *phoneLabel;

/*
 +86
 */
@property(nonatomic,strong)UILabel *jiaBaLiu;

/*
 输入框
 */
@property(nonatomic,strong)UITextField *phoneTextField;

/*
 底部虚线
 */
@property(nonatomic,strong)UIImageView *xuXianView;

/*
 同意政策勾选按钮
 */
@property(nonatomic,strong)UIButton *agreedButton;

/*
 法律声明及隐私政策按钮
 */
//@property(nonatomic,strong)UIView *agreementView;

/*
 下一步按钮
 */
@property(nonatomic,strong)UIButton *theNextStepButton;

/*
 底部图片
 */
@property(nonatomic,strong)UIImageView *downView;

@property (nonatomic, strong) NSMutableArray *items;
@end

@implementation YFPhoneNumberInputViewController

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

    
    
    [self srf];
    [self configuration];
    // Do any additional setup after loading the view.
   
}
-(void)srf
{
    
}

-(void)configuration
{
    [self.view sd_addSubviews:@[self.phoneLabel,self.jiaBaLiu,self.phoneTextField,self.xuXianView,self.theNextStepButton,self.agreedButton,self.downView]];

    self.deleteButton.sd_layout
    .leftSpaceToView(self.view, YF_W(21.6))
    .topSpaceToView(self.view, YF_H(47.7))
    .widthIs(YF_W(18.7))
    .heightIs(YF_H(18.7));
    
    
    self.phoneLabel.sd_layout
    .leftSpaceToView(self.view, YF_W(30))
    .topSpaceToView(self.view, YF_H(90))
    .widthIs(YF_W(150))
    .heightIs(YF_H(28));
    
    self.jiaBaLiu.sd_layout
    .leftSpaceToView(self.view, YF_W(30))
    .topSpaceToView(self.phoneLabel, YF_H(30))
    .widthIs(YF_W(40))
    .heightIs(YF_H(24));
    
    self.phoneTextField.sd_layout
    .leftSpaceToView(self.view, YF_W(75))
    .topSpaceToView(self.phoneLabel, YF_H(30))
    .widthIs(WIDTH - YF_W(150))
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
    
    self.agreedButton.sd_layout
    .leftSpaceToView(self.view, YF_W(50))
    .topSpaceToView(self.view, YF_H(313))
    .widthIs(YF_W(self.agreedButton.width + 20))
    .heightIs(YF_H(self.agreedButton.height));
    
//    self.agreementView.sd_layout
//    .leftSpaceToView(self.agreedButton, YF_W(6))
//    .topSpaceToView(self.view, YF_H(313))
//    .widthIs(YF_W(200))
//    .heightIs(YF_H(100));
    
    self.downView.sd_layout
    .leftSpaceToView(self.view, YF_W(0))
    .bottomEqualToView(self.view)
    .widthIs(WIDTH)
    .heightIs(YF_H(282));
     [self createItem];
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


-(UILabel *)phoneLabel
{
    if (!_phoneLabel) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(20);
        label.textColor =[YFTool YFColorWithString:@"333333"];
        label.text =@"输入手机号";
        _phoneLabel = label;
    }
    return _phoneLabel;
}

-(UILabel *)jiaBaLiu
{
    if (!_jiaBaLiu) {
        UILabel *label =[[UILabel alloc] init];
        label.font = YF_FONT(17);
        label.textColor =[YFTool YFColorWithString:@"666666"];
        label.text =@"+86";
        _jiaBaLiu = label;
    }
    return _jiaBaLiu;
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


- (UITextField *)phoneTextField {
    if (!_phoneTextField) {
        UITextField *textfield = [[UITextField alloc]init];
        textfield.font = YF_FONT(17);
        textfield.delegate = self;
        textfield.clearButtonMode = UITextFieldViewModeWhileEditing;
        textfield.attributedPlaceholder =[YFTool nsstring:@"请输入手机号"];
        textfield.keyboardType = UIKeyboardTypeNumberPad;
        textfield.textColor =[YFTool YFColorWithString:@"333333"];
        [textfield addTarget:self action:@selector(phoneClick:) forControlEvents:UIControlEventEditingChanged];
        _phoneTextField = textfield;
    }
    return _phoneTextField;
}

-(void)phoneClick:(UITextField *)sender
{
    if (sender.text.length <= 11) {
        [self next];
    }
    if (sender.text.length > 11) {
        sender.text = [sender.text substringToIndex:11];
    }
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
        [button addTarget:self action:@selector(theNextStepClick:) forControlEvents:UIControlEventTouchUpInside];
        _theNextStepButton = button;
        _theNextStepButton.userInteractionEnabled = NO;
        
    }
    return _theNextStepButton;
}

-(void)theNextStepClick:(UIButton *)sender
{
    if ([YFTool isValidateMobile:_phoneTextField.text]==YES && _agreedButton.selected == YES) {
        [YFSRFManager YFSrfSuccess:^(id json) {
            [self Verification:sender srfString:json];
            
        } failure:^(NSError *error) {
            
        }];

        
    }


    
}

-(void)Verification:(UIButton *)sender srfString:(NSString *)srfStr
{
    [YFLoginRequest YFPhoneString:_phoneTextField.text keyCodeString:@"common" timeStampString:[YFTool getTimeNow] srfString:srfStr success:^(id json) {
        
        if ([YFTool Nsdic:json]==1) {
            NSLog(@"6666 == %@",json);
            YFVerificationCodeViewController *YFVerificationCodeVC =[[YFVerificationCodeViewController alloc] init];
            YFVerificationCodeVC.phoneString =_phoneTextField.text;
            [self.navigationController pushViewController:YFVerificationCodeVC animated:YES];
            [YFProgressHUD showSuccessWithStatus:MESSAGE];
        }
        else{
            [YFProgressHUD showInfoWithStatus:MESSAGE];
        }
      
        
    } failure:^(NSError *error) {
      
    }];
}

-(UIButton *)agreedButton
{
    if (!_agreedButton) {
        UIButton *button=[[UIButton alloc] init];
        [button setImage:[UIImage imageNamed:@"loginAgreedNoSelectImage"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"loginAgreedSelectImage"] forState:UIControlStateSelected];
         button.titleLabel.font = YF_FONT(16);
        [button setTitle:@"同意" forState:UIControlStateNormal];
        [button setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, -10)];
        [button setTitleColor:[YFTool YFColorWithString:@"999999"] forState:UIControlStateNormal];
        [button sizeToFit];
        [button addTarget:self action:@selector(agreedClick:) forControlEvents:UIControlEventTouchUpInside];
        _agreedButton = button;
        
    }
    return _agreedButton;
}

-(void)agreedClick:(UIButton *)sender
{
    sender.selected = !sender.selected;
    [self next];
}

- (void)createItem
{
   
        NSArray *arr = @[@"《注册协议》",@"《反洗钱告知及承诺书》",@"《金米袋隐私保护政策》",@"《金米袋平台在线服务协议》",@"《金米袋投资咨询与管理服务协议》"];
        for (int i = 0 ; i < arr.count; i++) {
            UIButton *button=[[UIButton alloc] init];
            button.titleLabel.font = YF_FONT(12);
            [button setTitle:arr[i] forState:UIControlStateNormal];
            button.tag = i;
            [button setTitleColor:[YFTool YFColorWithString:@"3987FF"] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(agreementClick:) forControlEvents:UIControlEventTouchUpInside];
            [button sizeToFit];
            CGFloat btnY = 308 *  ([UIScreen mainScreen].bounds.size.height/IS_IPHONE_X_HEIGHT);
            switch (i) {
                case 0:
                {
                    button.frame = CGRectMake(113,btnY, button.width, button.height);

                }
                    break;
                case 1:
                {
                    UIButton *btn = self.items[0];
                    button.frame = CGRectMake( btn.right, btnY, button.width, button.height);
                }
                    break;
                case 2:
                {
                     UIButton *btn = self.items[1];
                    button.frame = CGRectMake(50, btnY + btn.height , button.width, button.height);
                }
                    break;
                case 3:
                {
                       UIButton *btn = self.items[2];
                    button.frame = CGRectMake(btn.right, btnY + btn.height , button.width, button.height);
                }
                    break;
                case 4:
                {
                       UIButton *btn = self.items[3];
                    button.frame = CGRectMake(50, btnY + btn.height *2, button.width, button.height);
                }
                    break;
                    
                default:
                    break;
            }
            [self.items addObject:button];
            [self.view addSubview:button];
            [self.view bringSubviewToFront:button];
        }
}

-(void)agreementClick:(UIButton *)btn
{
//    YFLegalNoticesViewController *YFLegalNoticesVC = [[YFLegalNoticesViewController alloc] init];
//    [self.navigationController pushViewController:YFLegalNoticesVC animated:YES];
    RHWebViewController *vc = [[RHWebViewController alloc]init];
//    NSArray *arr = @[@"《注册协议》",@"《反洗钱告知及承诺书》",@"《金米袋隐私保护政策》",@"《金米袋平台在线服务协议》",@"《金米袋投资咨询与管理服务协议》"];

    switch (btn.tag) {
        case 0:
        {
            vc.title = @"注册协议";
            vc.pathUrl = [[NSBundle mainBundle]pathForResource:@"注册协议" ofType:@"html"];
        }
            break;
        case 1:
        {
            vc.title = @"反洗钱告知及承诺书";
            vc.pathUrl = [[NSBundle mainBundle]pathForResource:@"反洗钱告知及承诺书" ofType:@"html"];
        }
            break;
        case 2:
        {
            vc.title = @"金米袋隐私保护政策";
            vc.pathUrl = [[NSBundle mainBundle]pathForResource:@"金米袋隐私保护政策" ofType:@"html"];
        }
            break;
        case 3:
        {
            vc.title = @"金米袋平台在线服务协议";
            vc.pathUrl = [[NSBundle mainBundle]pathForResource:@"金米袋平台在线服务协议" ofType:@"html"];
        }
            break;
        case 4:
        {
            vc.title = @"金米袋投资咨询与管理服务协议";
            vc.pathUrl = [[NSBundle mainBundle]pathForResource:@"金米袋投资咨询与管理服务协议" ofType:@"html"];
        }
            break;
            
        default:
            break;
    }
 
    [self.navigationController pushViewController:vc animated:YES];
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
    if ([YFTool isValidateMobile:_phoneTextField.text]==YES && _agreedButton.selected == YES) {
        _theNextStepButton.backgroundColor = ZHUTICOLOR;
        self.theNextStepButton.userInteractionEnabled = YES;
    }
    if ([YFTool isValidateMobile:_phoneTextField.text] == NO || _agreedButton.selected == NO) {
        _theNextStepButton.backgroundColor = [YFTool YFColorWithString:@"DDDDDD"];
         self.theNextStepButton.userInteractionEnabled = NO;
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
- (NSMutableArray *)items{
    if (_items == nil) {
        _items = [NSMutableArray array];
    }
    return _items;
}
@end
