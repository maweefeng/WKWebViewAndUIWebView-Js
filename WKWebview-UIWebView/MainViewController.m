//
//  MainViewController.m
//  WKWebview-UIWebView
//
//  Created by maweefeng on 2017/12/6.
//  Copyright © 2017年 maweefeng. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITabBarItem *item = [UITabBarItem appearance];
    // 设置默认字体样式
    NSMutableDictionary *attr = [[NSMutableDictionary alloc]init];
    attr[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attr[NSForegroundColorAttributeName] = [UIColor grayColor];
    [item setTitleTextAttributes:attr forState:UIControlStateNormal];
    // 设置选中字体样式，注意不要用上面的字典了,不同state下的属性要用不同的字典来装
    NSMutableDictionary *attrSelected = [[NSMutableDictionary alloc]init];
    attrSelected[NSFontAttributeName] = attr[NSFontAttributeName];
    attrSelected[NSForegroundColorAttributeName] = [UIColor colorWithRed:214/255.0 green:34/255.0 blue:25/255.0 alpha:1.0];
    [item setTitleTextAttributes:attrSelected forState:UIControlStateSelected];
    // Do any additional setup after loading the view.
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
