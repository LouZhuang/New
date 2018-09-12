//
//  YFUnbindBankCardWebViewController.m
//  GoldenRiceBags
//
//  Created by 风鼎-叶烽 on 2018/4/10.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "YFUnbindBankCardWebViewController.h"
#import <WebKit/WebKit.h>
@interface YFUnbindBankCardWebViewController ()<WKNavigationDelegate,WKUIDelegate,WKScriptMessageHandler>
@property(nonatomic,strong)WKWebView *YFWKWebView;
@property (nonatomic, strong) UIProgressView *progressView;//设置加载进度条

@end

@implementation YFUnbindBankCardWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initWK];
    [self.view addSubview:self.progressView];
    // Do any additional setup after loading the view.
}
-(UIProgressView *)progressView{
    if (!_progressView) {
        _progressView= [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
        _progressView.frame = CGRectMake(0, 0, WIDTH, 5);
        //        _progressView.hidden = YES;
        //        [_progressView setTrackTintColor:[UIColor redColor]];
        _progressView.progressTintColor =ZHUTICOLOR;
        
    }
    return _progressView;
}

-(void)initWK
{
    
    
    // 创建配置
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    // 创建UserContentController（提供JavaScript向webView发送消息的方法）
    WKUserContentController* userContent = [[WKUserContentController alloc] init];
    // 添加消息处理，注意：self指代的对象需要遵守WKScriptMessageHandler协议，结束时需要移除
    [userContent addScriptMessageHandler:self name:@"NativeMethod"];
    // 将UserConttentController设置到配置文件
    config.userContentController = userContent;
    // 高端的自定义配置创建WKWebView
    _YFWKWebView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT - 64) configuration:config];
    // 设置访问的URL
//    NSURL *url = [NSURL URLWithString:_urlString];
//    // 根据URL创建请求
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_YFWKWebView loadHTMLString:_urlString baseURL:nil];
    _YFWKWebView.scrollView.bounces = NO;
    // WKWebView加载请求
//    [_YFWKWebView loadRequest:request];
    _YFWKWebView.navigationDelegate=self;
    _YFWKWebView.UIDelegate=self;
    [_YFWKWebView addObserver:self
                   forKeyPath:NSStringFromSelector(@selector(estimatedProgress))
                      options:0
                      context:nil];
    // 将WKWebView添加到视图
    [self.view addSubview:_YFWKWebView];
    
    
    
}
// 页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation
{
    NSLog(@"页面开始加载");
    //开始加载的时候，让进度条显示
    self.progressView.hidden = NO;
}
// 当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation
{
    NSLog(@"内容开始返回");
}
// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    NSLog(@"页面加载完成");
}
// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation
{
    NSLog(@"页面加载失败");
}

// 接收到服务器跳转请求之后再执行
- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation
{
    
}
// 在收到响应后，决定是否跳转
//- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler
//{
//    //获取请求的url路径.
//    NSString *requestString = navigationResponse.response.URL.absoluteString;
//    NSLog(@"requestString:%@",requestString);
//    // 遇到要做出改变的字符串
//    NSString *subStr = @"www.baidu.com";
//    if ([requestString rangeOfString:subStr].location != NSNotFound) {
//        NSLog(@"这个字符串中有subStr");
//        //回调的URL中如果含有百度，就直接返回，也就是关闭了webView界面
//        [self.navigationController  popViewControllerAnimated:YES];
//    }
//
//    decisionHandler(WKNavigationResponsePolicyAllow);


//}
// 在发送请求之前，决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
{
    
    //获取请求的url路径.
    NSString *requestString = navigationAction.request.URL.absoluteString;
    NSLog(@"requestString:%@",requestString);
    
    // 遇到要做出改变的字符串
    NSString *subStr =@"http://sky.natapp4.cc/app/open/depository/redirect";
    
    if ([requestString rangeOfString:subStr].location != NSNotFound) {
        NSLog(@"这个字符串中有subStr");
        [YFProgressHUD showSuccessWithStatus:@"操作成功"];
      
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            
            if (_changePassWordType ==9) {
                /*
                 充值
                 */
                YFTopUpDetailViewController *YFTopUpDetailVC=[[YFTopUpDetailViewController alloc] init];
                YFTopUpDetailVC.successType=1;
                [self.navigationController pushViewController:YFTopUpDetailVC animated:YES];
                
                return;
            }
            if (_changePassWordType ==10) {
                /*
                 提现
                 */
                YFWithdrawalDetailViewController *YFTopUpDetailVC=[[YFWithdrawalDetailViewController alloc] init];
                YFTopUpDetailVC.successType=1;
                [self.navigationController pushViewController:YFTopUpDetailVC animated:YES];
                
                return;
            }
            
            
            
            for (UIViewController *controller in self.navigationController.viewControllers) {
                
                if (_changePassWordType ==6) {
                    /*
                     修改密码
                     */
                    if ([controller isKindOfClass:[YFAccountSecurityViewController class]]) {
                        [self.navigationController popToViewController:controller animated:YES];
                        
                    }
                }
                
                else{
                    if ([controller isKindOfClass:[YFMineBnakCardAllViewController class]]) {
                        [self.navigationController popToViewController:controller animated:YES];
                        
                    }
                }
                
                
            }
        });
        
        
    }
    
    
    
    decisionHandler(WKNavigationActionPolicyAllow);
}

//kvo 监听进度
-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                      context:(void *)context{
    
    if ([keyPath isEqualToString:NSStringFromSelector(@selector(estimatedProgress))]
        && object == self.YFWKWebView) {
        [self.progressView setAlpha:1.0f];
        BOOL animated = self.YFWKWebView.estimatedProgress > self.progressView.progress;
        [self.progressView setProgress:self.YFWKWebView.estimatedProgress
                              animated:animated];
        
        if (self.YFWKWebView.estimatedProgress >= 1.0f) {
            [UIView animateWithDuration:0.3f
                                  delay:0.3f
                                options:UIViewAnimationOptionCurveEaseOut
                             animations:^{
                                 [self.progressView setAlpha:0.0f];
                             }
                             completion:^(BOOL finished) {
                                 [self.progressView setProgress:0.0f animated:NO];
                             }];
        }
    }else{
        [super observeValueForKeyPath:keyPath
                             ofObject:object
                               change:change
                              context:context];
    }
}


-(void)dealloc
{
    [_YFWKWebView.configuration.userContentController removeScriptMessageHandlerForName:@"NativeMethod"];
    [self.YFWKWebView removeObserver:self
                          forKeyPath:NSStringFromSelector(@selector(estimatedProgress))];
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

