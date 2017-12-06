//
//  BaseNavViewController.m
//  WKWebview-UIWebView
//
//  Created by maweefeng on 2017/12/6.
//  Copyright © 2017年 maweefeng. All rights reserved.
//

#import "BaseNavViewController.h"

@interface BaseNavViewController ()

@end

@implementation BaseNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBack];
    // Do any additional setup after loading the view.
}

- (void)setNavigationBack{
    
    UINavigationBar * navigationBar = [UINavigationBar appearance];
    //返回按钮的箭头颜色
    //[navigationBar setTintColor:[UIColor greenColor]];
    
    //设置返回样式图片
    UIImage *image = [UIImage imageNamed:@"back_nor"];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //iOS7之后如果要定制返回图片，需要下面2个值都设置
    //Note: These properties must both be set if you want to customize the back indicator image.
    navigationBar.backIndicatorImage = image;
    navigationBar.backIndicatorTransitionMaskImage = image;
    
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
