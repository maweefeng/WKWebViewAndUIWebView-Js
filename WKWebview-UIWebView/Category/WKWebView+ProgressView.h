//
//  WKWebView+ProgressView.h
//  WKWebview-UIWebView
//
//  Created by maweefeng on 2017/12/6.
//  Copyright © 2017年 maweefeng. All rights reserved.
//

#import <WebKit/WebKit.h>

@interface WKWebView (ProgressView)<WKNavigationDelegate>

@property(nonatomic,strong)UIProgressView *progressView;

/**
 直接添加进度条就什么事情都不用管了
 */
-(void)addProgress;


/**
 根据自己的需要设置颜色的加装进度条

 @param tintcolor 进度颜色
 @param trackTintColor 背景颜色
 */
-(void)addProgressWithTintColor:(UIColor*)tintcolor TrackTintColor:(UIColor*)trackTintColor;

@end
