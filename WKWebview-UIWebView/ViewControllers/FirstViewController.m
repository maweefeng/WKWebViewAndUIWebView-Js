//
//  FirstViewController.m
//  WKWebview-UIWebView
//
//  Created by maweefeng on 2017/12/4.
//  Copyright © 2017年 maweefeng. All rights reserved.
//
#import "WKWebView+ProgressView.h"
#import "FirstViewController.h"
#import <WebKit/WebKit.h>
#import <JavaScriptCore/JavaScriptCore.h>
@interface FirstViewController ()<WKNavigationDelegate,WKUIDelegate>{
    WKSnapshotConfiguration * config ;
    
}
@property(nonatomic,strong)WKWebView * webView;
@property(nonatomic,strong)JSContext *context;
@property(nonatomic,strong)UIProgressView *progressView;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self demo1];
    
}
-(void)demo1{
   
    WKWebViewConfiguration * config = [[WKWebViewConfiguration alloc]init];
    self.webView = [[WKWebView alloc]initWithFrame:self.view.frame configuration:config];
    self.webView.UIDelegate = self;
    [self.webView addProgress];
    self.webView.allowsLinkPreview = YES;
    //一个布尔值，指示水平轻扫手势是否会触发后退列表导航。
    self.webView.allowsBackForwardNavigationGestures = YES;
    self.webView.navigationDelegate = self;
    [self.view addSubview:self.webView];
    //   NSString * urlstr = [[NSBundle mainBundle]pathForResource:@"hello" ofType:@"html"];
    NSURL * url = [NSURL URLWithString:@"http://www.weibo.com"];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    
}


#pragma mark WKNavigationDelegate 用来追踪加载过程（页面开始加载、加载完成、加载失败）的方法：
// 页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    
}
// 当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
    
}
// 页面加载完成之后调用 相当于UIWebView的-webViewDidFinishLoad：
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    [self.progressView setProgress:0.0 animated:NO];
    self.title = @"微博";
    
    //wkwebview 截屏
    /*
    [webView takeSnapshotWithConfiguration:config completionHandler:^(UIImage * _Nullable snapshotImage, NSError * _Nullable error) {
        UIImageWriteToSavedPhotosAlbum(snapshotImage, self , @selector(image:didFinishSavingWithError:contextInfo:), nil);//保存图片到照片库
        
    }];*/
    
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    
    
    
}
// 页面加载失败时调用   类似UIWebView的 - webView：didFailLoadWithError：

- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation{
    
}

#pragma mark 页面跳转的代理方法：

// 接收到服务器跳转请求之后调用
- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation{
    
    
}
// 在收到响应后，决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler{
    
    decisionHandler(WKNavigationResponsePolicyAllow);
    
}
// 在发送请求之前，决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    
    //    if (navigationAction.navigationType == WKNavigationTypeLinkActivated){
    //        decisionHandler(WKNavigationActionPolicyCancel);
    //    } else {
    decisionHandler(WKNavigationActionPolicyAllow);
    //    }
}
#pragma mark WKUIDelegate

/**
 *  web界面中有弹出警告框时调用
 *
 *  @param webView           实现该代理的webview
 *  @param message           警告框中的内容
 *  @param frame             主窗口
 *  @param completionHandler 警告框消失调用
 */
- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler{
    // js里面的alert实现，如果不实现，网页的alert函数无效
    // js 里面的alert实现，如果不实现，网页的alert函数无效
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:message
                                                                             message:nil
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"确定"
                                                        style:UIAlertActionStyleCancel
                                                      handler:^(UIAlertAction *action) {
                                                          completionHandler();
                                                      }]];
    
    [self presentViewController:alertController animated:YES completion:^{}];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
