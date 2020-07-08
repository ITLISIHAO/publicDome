//
//  ViewController.m
//  SHTheChile
//
//  Created by apple on 2020/7/7.
//  Copyright © 2020 apple. All rights reserved.
//

#import "ViewController.h"
#import "SHChileController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 150, 100)];
    [button setTitle:@"点击这里查看" forState:UIControlStateNormal];
    [button setTitleColor:UIColor.redColor forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonClick {
    
    SHChileController *child = [[SHChileController alloc] init];
    child.view.frame         = self.view.bounds;
    // 处理自控制器点击事件
    [child setVerBlcok:^(NSInteger btnTag, NSInteger inTag) {
        
    }];

    // 把弹出验证控制器作为子控制器添加到 当前控制器上
    [self addChildViewController:child];
    [self.view addSubview:child.view];
}


@end
