//
//  RHWebViewController.m
//  GoldenRiceBags
//
//  Created by wiseMacBookPro on 2018/8/30.
//  Copyright © 2018年 风鼎-叶烽. All rights reserved.
//

#import "RHWebViewController.h"

#import <WebKit/WebKit.h>

@interface RHWebViewController ()<WKNavigationDelegate,WKUIDelegate,WKScriptMessageHandler>
@property (nonatomic,strong) WKWebView *wkWebview;
@property (nonatomic, copy) NSString *mimetype;
@end

@implementation RHWebViewController

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)createWebView
{
    
    if (!self.isWord) {
        self.mimetype = @"text/html";
    }
    self.wkWebview = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height )];
    if (!self.isWord) {
        if (@available(iOS 9.0, *)) {
            NSData *data = [NSData dataWithContentsOfFile:self.pathUrl];
            [self.wkWebview loadData:data MIMEType:self.mimetype characterEncodingName:@"GBK" baseURL:nil ];
        } else {
            // Fallback on earlier versions
        }
    }else{
        NSURL *url = [NSURL fileURLWithPath:self.pathUrl];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [self.wkWebview loadRequest:request];
    }
    [self.view addSubview:self.wkWebview];
    ///自动适应大小
    ///关闭下拉刷新效果
    self.wkWebview.scrollView.bounces = NO;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)setPathUrl:(NSString *)pathUrl
{
    _pathUrl = pathUrl;
    [self createWebView];
}
- (void)setWebUrl:(NSString *)webUrl
{
    _webUrl = webUrl;
        WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
        // 根据需要去设置对应的属性
         self.wkWebview.backgroundColor = [UIColor redColor];
        self.wkWebview = [[WKWebView alloc]initWithFrame:self.view.bounds configuration:config];
        self.wkWebview.UIDelegate=self;
        self.wkWebview.navigationDelegate=self;
    //    [self.wkWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.webUrl]]];
       NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.webUrl]];
        [self.wkWebview loadData:data MIMEType:@"application/pdf" characterEncodingName:@"GBK" baseURL:nil ];
    [self.view addSubview:self.wkWebview];
    
}
-(void)pulish:(id)sender{
    
    if (_wkWebview.canGoBack == YES) {
        [_wkWebview goBack];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}


#pragma mark - delegate
// 页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation
{
    NSLog(@"页面开始加载");
    //开始加载的时候，让进度条显示
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
//- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation
//{
//
//}
#pragma mark - event response

#pragma mark - public methods

#pragma mark - private methods

#pragma mark - setter and getter
- (void)setIsWord:(BOOL )isWord
{
    _isWord = isWord;
    
}
@end
