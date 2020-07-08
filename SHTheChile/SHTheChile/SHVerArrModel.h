//
//  SHVerArrModel.h
//  SHTheChile
//
//  Created by apple on 2020/7/7.
//  Copyright © 2020 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SHVerArrModel : NSObject

@property(nonatomic, strong) NSString *name;

@property(nonatomic, strong) NSString *nameCode;

- (instancetype)initWithDic:(NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
