//
//  SHChileController.m
//  SHTheChile
//
//  Created by apple on 2020/7/7.
//  Copyright © 2020 apple. All rights reserved.
//

#import "SHChileController.h"
#import "SHChildView.h"
#import "SHChildModel.h"

@interface SHChileController ()

@end

@implementation SHChileController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置半透明效果
    self.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    
    // 设置配置显示框显示内容模型数据
    NSDictionary *dicAA = @{@"title":@"查看完整卡号",@"content":@"为了更好的保护您的个人信息，请选择认证方式", @"validationArr":@[@{@"name":@"手机短信",@"nameCode":@"100010"},@{@"name":@"E盾",@"nameCode":@"100000"}]};
    
    // 进行字典转模型
    SHChildModel *model    = [[SHChildModel alloc] initWithModel:dicAA];
    
    SHChildView *childView = [[SHChildView alloc] initWithFrame:CGRectMake(0, 0, 260, 260) model:model];
    
    // 设置验证方式验证框在控制器中心位置
    childView.center       = self.view.center;
    
    // 监听回调 可以在这里处理 方法
    [childView setBlock:^(NSInteger btnTag, NSInteger verTag) {
        if (!btnTag) { // 点击取消 移除子控制器
            [self removeFromParentViewController];
            [self.view removeFromSuperview];
        } else {
            // 可以设置回调在父控制器就行事件处理
            self.verBlcok(btnTag, verTag);
        }
        
    }];
    [self.view addSubview:childView];
    
}


@end
