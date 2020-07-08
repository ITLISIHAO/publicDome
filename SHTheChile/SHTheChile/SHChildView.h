//
//  SHChildView.h
//  SHTheChile
//
//  Created by apple on 2020/7/7.
//  Copyright © 2020 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHChildModel.h"

typedef void(^codeBlock)(NSInteger btnTag, NSInteger verTag);

NS_ASSUME_NONNULL_BEGIN

@interface SHChildView : UIView

- (instancetype)initWithFrame:(CGRect)frame model:(SHChildModel *)model;

@property (nonatomic, strong) UIButton *button;

@property (nonatomic, assign) NSInteger btnTag;
 
@property (nonatomic, copy) codeBlock block;

@end

NS_ASSUME_NONNULL_END
