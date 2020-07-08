//
//  SHChileController.h
//  SHTheChile
//
//  Created by apple on 2020/7/7.
//  Copyright © 2020 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SHChileController : UIViewController

@property (nonatomic, copy) void(^verBlcok)(NSInteger btnTag, NSInteger inTag);

@end

NS_ASSUME_NONNULL_END
