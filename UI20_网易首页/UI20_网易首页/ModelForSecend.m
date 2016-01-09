//
//  ModelForSecend.m
//  UI20_网易首页
//
//  Created by dllo on 16/1/9.
//  Copyright © 2016年 lanou.com. All rights reserved.
//

#import "ModelForSecend.h"

@implementation ModelForSecend

// 两个数组需要初始化,不然指向空,不报错,但赋不上值. 
- (instancetype)init {
    
    self = [super init];
    if (self) {
        self.arrTitles = [NSMutableArray array];
        self.arrImages = [NSMutableArray array];
    }
    return self;
    
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {}

@end
