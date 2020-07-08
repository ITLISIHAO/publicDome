//
//  SHChildModel.h
//  SHTheChile
//
//  Created by apple on 2020/7/7.
//  Copyright © 2020 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SHChildModel : NSObject

@property(nonatomic, strong) NSString *title;

@property(nonatomic, strong) NSString *content;

@property(nonatomic, strong) NSMutableArray *validationArr;

- (instancetype)initWithModel:(NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
