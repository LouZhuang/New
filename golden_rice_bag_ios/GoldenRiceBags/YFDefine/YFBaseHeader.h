//
//  YFBaseHeader.h
//  FDBigHealth
//
//  Created by 风鼎-叶烽 on 2018/2/1.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#ifndef YFBaseHeader_h
#define YFBaseHeader_h




/*
 判断是否为iphone x
 */
#define IS_IPHONE_X_HEIGHT         ([[UIScreen mainScreen] bounds].size.height >= 812.0f ? 812.0f : 667.0f)

// debug下打印，release下不打印
#ifndef __OPTIMIZE__
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...) {}
#endif


/**  按照6的尺寸做适配比例  */
#define WIDTH ([UIScreen mainScreen].bounds.size.width)
#define HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define KeyWindow [UIApplication sharedApplication].keyWindow
/*
 tabbar 和navagationbar高度
 */
#define NAVAHEIGHT ([[UIScreen mainScreen] bounds].size.height >= 812.0f ? 812.0f : 64.0f)
#define TABAHEIGHT ([[UIScreen mainScreen] bounds].size.height >= 812.0f ? 812.0f : 49.0f)


#define YF_W(w) w * ([UIScreen mainScreen].bounds.size.width/375)
#define YF_H(h) h * ([UIScreen mainScreen].bounds.size.height/IS_IPHONE_X_HEIGHT)

/*  字体大小  */
#define YF_FONT(f) ([UIFont systemFontOfSize:YF_W(f)])


#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

//顶部安全高度
#define kSafeArea_TopHeight ([UIScreen mainScreen].bounds.size.height == 812.0 ? 34.0 : 0)
//底部安全高度
#define kSafeArea_BottomHeight ([UIScreen mainScreen].bounds.size.height == 812.0 ? 24.0 : 0)

#define YFWeakSelf __weak typeof(self) weakSelf = self;

/**  OSS  */
#define AccessKey (@"LTAIrWCBKY77P8Kz")
#define SecretKey (@"TrbFjCCZmE3TQXBQBs4uICgMktfrPz")
#define OSSHTTPS (@"http://midai88-bucket-test.oss-cn-shanghai.aliyuncs.com/")
#define BUCKETNAME (@"midai88-bucket-test")


/** 当前APP版本号 */
#define APP_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

/*
 常用
 */

/*
 主题颜色
 */
#define ZHUTICOLOR ([YFTool YFColorWithString:@"FF8421"])


/*
 白色
 */
#define WHITECOLOR ([YFTool YFColorWithString:@"FFFFFF"])


/*
 浅灰
 */
#define LIGHTGREYCOLOR ([YFTool YFColorWithString:@"F5F5F5"])
#define YF000 ([YFTool YFColorWithString:@"000000"])
#define YF333 ([YFTool YFColorWithString:@"333333"])
#define YF666 ([YFTool YFColorWithString:@"666666"])
#define YF999 ([YFTool YFColorWithString:@"999999"])

/**  返回信息  */
#define MESSAGE ([json objectForKey:@"message"])



/**  是否登录  0为未登录 1为登录  */
#define YFLOGIN (@"login")
/**  id  */
#define YFID (@"id")
/**  手机号  */
#define YFPHONE (@"cellPhone")
/**  支付密码  */
#define YFPAYCODE (@"payCode")
/**  昵称  */
#define YFNICK (@"nick")
/**  登录密码  */
#define YFPASSWORD (@"password")
/**  粉丝  */
#define YFFANS (@"fans")
/**  关注  */
#define YFFANS1 (@"fans1")
/**  订单  */
#define YFALLCOUNT (@"allCount")
/**  等级  */
#define YFLEVEL (@"level")
/**  ID  */
#define YFMEMBERNO (@"memberNo")
/**  头像  */
#define YFHEADER (@"header")
/**  access_token  */
#define YFAccess_Token (@"access_token")

/**  isDepositoryB  */
#define YFisDepositoryB (@"isDepositoryB")

/**  isDepository  */
#define YFisDepository (@"isDepository")

/**  investmentType  */
#define YFInvestmentType (@"investmentType")

//#define HTTP (@"http://192.168.11.127:8096")
#define HTTP (@"http://192.168.11.195:8096")

/*
 外网
 */
//#define HTTP (@"http://xkk.magicsoft.me")

#warning 登录注册
#define YF_SRF ([NSString stringWithFormat:@"%@/app/open/srf",HTTP])//srf获取
#define YF_Phone ([NSString stringWithFormat:@"%@/app/open/verify/phone",HTTP])//账户存在验证
#define YF_SignUp ([NSString stringWithFormat:@"%@/app/open/signUp",HTTP])//app用户注册
#define YF_SMS ([NSString stringWithFormat:@"%@/app/open/sms",HTTP])//验证码发送接口
#define YF_Validation ([NSString stringWithFormat:@"%@/app/open/sms/validation",HTTP])//验证码验证接口
#define YF_SignIn ([NSString stringWithFormat:@"%@/app/open/signIn",HTTP])//登录
#define YF_GetBindData ([NSString stringWithFormat:@"%@/app/api/bank/getBindData",HTTP])//绑卡注册（针对首次）
#define YF_ValidCertification ([NSString stringWithFormat:@"%@/app/open/validCertification",HTTP])//验证手机号是否实名过
#define YF_ForgetPasswordn ([NSString stringWithFormat:@"%@/app/open/forgetPassword",HTTP])//未登录重新设置新密码
#define YF_Register ([NSString stringWithFormat:@"%@/app/api/push/register",HTTP])//用户登录设备信息注册

#warning 我的
#define YF_Index ([NSString stringWithFormat:@"%@/app/api/personal/index",HTTP])//我的-首页
#define YF_About ([NSString stringWithFormat:@"%@/app/api/personal/about",HTTP])//我的-账户信息-关于
#define YF_Version ([NSString stringWithFormat:@"%@/app/api/personal/version",HTTP])//我的-账户信息-版本信息获取
#define YF_Auth ([NSString stringWithFormat:@"%@/app/api/personal/auth",HTTP])//我的-账户信息-授权管理
#define YF_SettingAuth ([NSString stringWithFormat:@"%@/app/api/personal/settingAuth",HTTP])//我的-账户信息-授权管理-授权（暂未接入存管）
#define YF_CancelAuth ([NSString stringWithFormat:@"%@/app/api/personal/cancelAuth",HTTP])//我的-账户信息-授权管理-授权取消（暂未接入存管）
#define YF_Refresh_token ([NSString stringWithFormat:@"%@/app/api/refresh_token",HTTP])//token刷新接口
#define YF_Message ([NSString stringWithFormat:@"%@/app/api/personal/message",HTTP])//我的-消息中心
#define YF_MessageList ([NSString stringWithFormat:@"%@/app/api/personal/messageList",HTTP])//我的-消息中心-详情分页
#define YF_VerifyPassword ([NSString stringWithFormat:@"%@/app/api/verifyPassword",HTTP])//我的-账户信息-账户安全-验证登录密码
#define YF_SetNewPassword ([NSString stringWithFormat:@"%@/app/api/setNewPassword",HTTP])//我的-账户信息-账户安全-替换新密码
#define YF_MyCoupon ([NSString stringWithFormat:@"%@/app/api/personal/myCoupon",HTTP])//我的-我的红包(加息券)
#define YF_SetStrategyAndOpen ([NSString stringWithFormat:@"%@/app/api/personal/setStrategyAndOpen",HTTP])//我的-我的投资-自动投标设置并开启
#define YF_GetStrategy ([NSString stringWithFormat:@"%@/app/api/personal/getStrategy",HTTP])//我的-我的投资-获取自动投标策略
#define YF_SetStrategyClose ([NSString stringWithFormat:@"%@/app/api/personal/setStrategyClose",HTTP])//我的-我的投资-关闭 自动投标
#define YF_SetStrategy ([NSString stringWithFormat:@"%@/app/api/personal/setStrategy",HTTP])//我的-我的投资-设置自动投标策略
#define YF_LoanDetail ([NSString stringWithFormat:@"%@/app/api/personal/loanDetail",HTTP])//我的-首页-借款明细
#define YF_LoanCancel ([NSString stringWithFormat:@"%@/app/api/personal/loanCancel",HTTP])//我的-首页-取消借款
#define YF_GetAdvance ([NSString stringWithFormat:@"%@/app/api/personal/getAdvance",HTTP])//我的-首页-借款明细-提前还款数据获取
#define YF_AheadRepay ([NSString stringWithFormat:@"%@/app/api/personal/aheadRepay",HTTP])//我的-首页-借款明细-提前还款
#define YF_loanOverdueRepay ([NSString stringWithFormat:@"%@/app/api/personal/loanRepay",HTTP])//我的-首页-借款明细-逾期还款

#define YF_Auths ([NSString stringWithFormat:@"%@/app/api/digitalSign/auth",HTTP])//颁发众签数字证书且签署金米袋用户授权委托书（并签署三方协议）


#define YF_SetInvestmentType ([NSString stringWithFormat:@"%@/app/api/personal/setInvestmentType",HTTP])//设置用户投资类型
#define YF_AddOrUpdateCard ([NSString stringWithFormat:@"%@/app/api/bank/addOrUpdateCard",HTTP])//添加或替换银行卡的网关地址获取
#define YF_UnBindCard ([NSString stringWithFormat:@"%@/app/api/bank/unBindCard",HTTP])//解绑银行卡的网关地址获取
#define YF_ValidIdCard ([NSString stringWithFormat:@"%@/app/open/validIdCard",HTTP])//验证身份证号
#define YF_SwitchPrePhone ([NSString stringWithFormat:@"%@/app/api/bank/switchPrePhone",HTTP])//更新预留手机号的网关地址获取
#define YF_ModifyTradePassword ([NSString stringWithFormat:@"%@/app/api/bank/modifyTradePassword",HTTP])//修改存管交易密码

#define YF_InvestmentList ([NSString stringWithFormat:@"%@/app/api/personal/investmentList",HTTP])//我的-首页-我的投资-我的投资列表
#define YF_InvestmentHistoryList ([NSString stringWithFormat:@"%@/app/api/personal/investmentHistoryList",HTTP])//我的-首页-我的投资-我的历史投资
#define YF_InvestmentDetail ([NSString stringWithFormat:@"%@/app/api/personal/investmentDetail",HTTP])//我的-首页-我的投资-我的投资详情
#define YF_InvestmentCancelData ([NSString stringWithFormat:@"%@/app/api/personal/investmentCancelData",HTTP])//我的-首页-我的投资-撤销投资数据获取
#define YF_InvestmentTransferData ([NSString stringWithFormat:@"%@/app/api/personal/investmentTransferData",HTTP])//我的-首页-我的投资-债权转让-转让数据获取
#define YF_InvestmentTransferDelivery ([NSString stringWithFormat:@"%@/app/api/personal/investmentTransferDelivery",HTTP])//我的-首页-我的投资-债权转让-发布债转
#define YF_InvestmentTransferList ([NSString stringWithFormat:@"%@/app/api/personal/investmentTransferList",HTTP])//我的-首页-我的投资-债权转让列表数据获取
#define YF_InvestmentCancel ([NSString stringWithFormat:@"%@/app/api/personal/investmentCancel",HTTP])//我的-首页-我的投资-撤销投标
#define YF_investmentTransferCancel ([NSString stringWithFormat:@"%@/app/api/personal/investmentTransferCancel",HTTP])//我的-首页-我的投资-债权转让-取消转让


#define YF_AccountRecordList ([NSString stringWithFormat:@"%@/app/api/personal/accountRecordList",HTTP])//我的-资金明细
#define YF_RechargeData ([NSString stringWithFormat:@"%@/app/api/personal/rechargeData",HTTP])//我的-充值(根据充值金额计算手续费)
#define YF_Recharge ([NSString stringWithFormat:@"%@/app/api/personal/recharge",HTTP])//我的-充值
#define YF_RechargeList ([NSString stringWithFormat:@"%@/app/api/personal/rechargeList",HTTP])//我的-充值-充值记录
#define YF_WithDrawData ([NSString stringWithFormat:@"%@/app/api/personal/withDrawData",HTTP])//我的-提现(根据提现金额计算手续费)
#define YF_WithdrawList ([NSString stringWithFormat:@"%@/app/api/personal/withdrawList",HTTP])//我的-提现-提现记录
#define YF_Withdraw ([NSString stringWithFormat:@"%@/app/api/personal/withdraw",HTTP])//我的-提现
#define YF_ResetPhone ([NSString stringWithFormat:@"%@/app/api/resetPhone",HTTP])//我的-账户信息-账户安全-替换手机号
#define YF_BankCard ([NSString stringWithFormat:@"%@/app/api/bank/bankCard",HTTP])//我的银行卡
#define YF_ValidBankCard ([NSString stringWithFormat:@"%@/app/api/bank/validBankCard",HTTP])//充值/提现 前验证两个存管账户是否都有在用银行卡

#warning 我要借款
#define YF_GenerateRate ([NSString stringWithFormat:@"%@/app/api/generateRate",HTTP])//根据借款月数获取年化利率
#define YF_ShowHowsRepay ([NSString stringWithFormat:@"%@/app/api/showHowsRepay",HTTP])//我要借款-还款方式
#define YF_SendLoanInfo ([NSString stringWithFormat:@"%@/app/api/sendLoanInfo",HTTP])//我要借款-借款信息提交




#warning 首页
#define YF_HomePageIndex ([NSString stringWithFormat:@"%@/app/open/index",HTTP])//首页
#define YF_ProjectDetail ([NSString stringWithFormat:@"%@/app/open/projectDetail",HTTP])//首页-项目详情
#define YF_GetData ([NSString stringWithFormat:@"%@/app/api/project/getData",HTTP])//购买项目份额时获取用户账号余额，和生效的优惠券和红包，项目剩余可买和已售百分数
#define YF_Investment ([NSString stringWithFormat:@"%@/app/api/project/investment",HTTP])//购买份额
#define YF_Calculate ([NSString stringWithFormat:@"%@/app/api/project/calculate",HTTP])//根据购买项目份额 计算手续费
#define YF_Regurl ([NSString stringWithFormat:@"%@/app/api/depository/regurl",HTTP])//开通存管网关地址获取


#warning 项目理财
#define YF_List ([NSString stringWithFormat:@"%@/app/open/project/list",HTTP])//项目理财



#endif /* YFBaseHeader_h */
