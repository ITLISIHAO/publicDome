//
//  SHChildModel.m
//  SHTheChile
//
//  Created by apple on 2020/7/7.
//  Copyright © 2020 apple. All rights reserved.
//

#import "SHChildModel.h"
#import "SHVerArrModel.h"

@implementation SHChildModel


- (instancetype)initWithModel:(NSDictionary *)dic {
    
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
- (void)setValue:(id)value forKey:(NSString *)key {
    
    if ([key isEqualToString:@"validationArr"]) {
        NSMutableArray *temp = [[NSMutableArray alloc] init];
        
        for (NSDictionary *dicA in value) {
            
            [temp addObject:[[SHVerArrModel alloc] initWithDic:dicA]];
        }
        _validationArr = temp;
        
        return;
    }
    
    [super setValue:value forKey:key];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

@end
