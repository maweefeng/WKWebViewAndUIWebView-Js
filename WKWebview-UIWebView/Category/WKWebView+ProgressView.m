//
//  WKWebView+ProgressView.m
//  WKWebview-UIWebView
//
//  Created by maweefeng on 2017/12/6.
//  Copyright © 2017年 maweefeng. All rights reserved.
//

#import "WKWebView+ProgressView.h"
#import <objc/runtime.h>
#import <objc/message.h>


@implementation WKWebView (ProgressView)


-(void)setProgressView:(UIProgressView *)progressView{
    /**
     *  为某个类关联某个对象
     *
     *  @param object#> 要关联的对象 description#>
     *  @param key#>    要关联的属性key description#>
     *  @param value#>  你要关联的属性 description#>
     *  @param policy#> 添加的成员变量的修饰符 description#>
     */
    objc_setAssociatedObject(self, @selector(progressView), progressView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)progressView {
    /**
     *  获取到某个类的某个关联对象
     *
     *  @param object#> 关联的对象 description#>
     *  @param key#>    属性的key值 description#>
     */
    return objc_getAssociatedObject(self, @selector(progressView));
}

-(void)addProgressWithTintColor:(UIColor*)tintcolor TrackTintColor:(UIColor*)trackTintColor{
    
    [self addProgress];
    self.progressView.tintColor = tintcolor;
    self.progressView.trackTintColor = trackTintColor;
    
}

-(void)addProgress{
    if (!self.progressView) {
        UIProgressView *progressView = [[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleDefault];
        progressView.frame = CGRectMake(0, 64, self.frame.size.width, 22);
        progressView.tintColor  = [UIColor orangeColor];
        progressView.trackTintColor = [UIColor whiteColor];
        self.progressView = progressView;
        [self addSubview:progressView];
        [self addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    }
}
#pragma mark 监听方法
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    if ([keyPath isEqualToString:@"estimatedProgress"]) {
        self.progressView.hidden = self.estimatedProgress == 1;
        [self.progressView setProgress:self.estimatedProgress animated:YES];
        if (self.progressView.hidden) {
            [self.progressView setProgress:0.0 animated:NO];

        }
        
    }
}

@end
