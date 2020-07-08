//
//  SHVerArrModel.m
//  SHTheChile
//
//  Created by apple on 2020/7/7.
//  Copyright © 2020 apple. All rights reserved.
//

#import "SHVerArrModel.h"

@implementation SHVerArrModel


- (instancetype)initWithDic:(NSDictionary *)dic {
    
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

- (void)setValue:(id)value forKey:(NSString *)key {
    
    [super setValue:value forKey:key];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

@end
