//
//  SHChildView.m
//  SHTheChile
//
//  Created by apple on 2020/7/7.
//  Copyright © 2020 apple. All rights reserved.
//

#import "SHChildView.h"
#import "SHVerArrModel.h"

@implementation SHChildView

- (instancetype)initWithFrame:(CGRect)frame model:(SHChildModel *)model {
    if (self = [super init]) {
        // 设置view frame
        self.frame = frame;
        self.backgroundColor = UIColor.whiteColor;
        // 设置标题
        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, self.frame.size.width, 30)];
        title.text          = model.title;
        title.textAlignment = UIAlertActionStyleCancel;
        title.font          = [UIFont systemFontOfSize:18];
        [self addSubview:title];
        
        // 设置内容，如果内容多的话可以使用UITextView
        UILabel *content = [[UILabel alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(title.frame) + 30, self.frame.size.width - 20, 60)];
        content.text          = model.content;
        content.textAlignment = NSTextAlignmentCenter;
        content.font          = [UIFont systemFontOfSize:18];
        content.numberOfLines = 0;
        [self addSubview:content];
        
        // 设置验证方式
        CGFloat btnWidth = (self.frame.size.width - 20) / model.validationArr.count;
        for (int i = 0; i < model.validationArr.count; i++) {
            SHVerArrModel *verModel =  model.validationArr[i];
            UIButton *validationBtn = [[UIButton alloc] initWithFrame:CGRectMake(i * btnWidth + 15, CGRectGetMaxY(content.frame) + 50, btnWidth, 20)];
            // 设置默认第一个点击状态
            if (!i) {
                // 设置button 用于点击按钮的大小布局进行参照
                self.button         = validationBtn;
                
                [self btnClick:validationBtn];
            }
            validationBtn.titleLabel.font = [UIFont systemFontOfSize:16];
            [validationBtn setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
            [validationBtn setTitle:verModel.name forState:UIControlStateNormal];
            validationBtn.tag   = i;
            [validationBtn setImage:[UIImage imageNamed:@"verifyImage"] forState:UIControlStateNormal];
            [validationBtn setImage:[UIImage imageNamed:@"verifyImageSelect"] forState:UIControlStateDisabled];
            validationBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
            [validationBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:validationBtn];
        }
        
        // 点击按钮
        NSArray *arr = @[@"取消",@"确定"];
        CGFloat btnWidth1 = self.frame.size.width / arr.count;
        for (int i = 0; i < arr.count; i++) {
            UIButton *textButton = [[UIButton alloc] initWithFrame:CGRectMake(i * btnWidth1, CGRectGetMaxY(self.button.frame) + 25, btnWidth1, 30)];
            [textButton setTitle:arr[i] forState:UIControlStateNormal];
            textButton.tag = i;
            [textButton setTitleColor:UIColor.blueColor forState:UIControlStateNormal];
            [textButton addTarget:self action:@selector(textButton:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:textButton];
        }
        
        // 给View设置圆角
        /**
            如果不考虑离屏渲染可以使用下边的方法
            self.layer.cornerRadius = 10.0;
            self.layer.masksToBounds = YES;
         */
        UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(10, 10)];
        CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
        shapeLayer.frame         = self.frame;
        shapeLayer.path          = bezierPath.CGPath;
        self.layer.mask          = shapeLayer;
        
    }
    return self;
}

// 点击事件进行回调
- (void)textButton:(UIButton *)sender {
    self.block( sender.tag, self.btnTag);
}

// 选择验证方式
- (void)btnClick:(UIButton *)sender {
    
    self.button.enabled  = YES;
    sender.enabled       = NO;
    self.button          = sender;
    
    // 监听点击了那个验证方式
    self.btnTag          = sender.tag;
}
// 在 drawRect 里边设置分隔线
-(void)drawRect:(CGRect)rect {

    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    [[UIColor redColor] setStroke];
    CGContextMoveToPoint(context, 0, 50);
    CGContextSetLineWidth(context, .2);
    CGContextAddLineToPoint(context, self.bounds.size.width, 50);
    CGContextStrokePath(context);
    
    
    CGContextRef context1 = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context1, 0, 220);
    CGContextAddLineToPoint(context1, self.bounds.size.width, 220);
    CGContextSetLineWidth(context1, 0.2);
    [[UIColor redColor] setStroke];
    CGContextStrokePath(context1);
    CGContextStrokePath(context);
    
    
    CGContextRef context2 = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context2, self.bounds.size.width/2, 220);
    CGContextSetLineWidth(context2, 0.2);
    CGContextAddLineToPoint(context2, self.bounds.size.width/2, 260);
    [[UIColor redColor] setStroke];
    CGContextStrokePath(context2);
    
}

@end
