//
//  ModelForPerson.m
//  UI20_本地存储(文件形式)
//
//  Created by dllo on 16/1/8.
//  Copyright © 2016年 lanou.com. All rights reserved.
//

#import "ModelForPerson.h"

@implementation ModelForPerson

#pragma mark 必须实现NSCoding两个协议方法.

// 归档时会自动调用此方法.
- (void)encodeWithCoder:(NSCoder *)aCoder {

    // 将想要保存的属性进行编码,保存到本地.
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.sex forKey:@"sex"];


}

// 反归档时自动调用此协议方法.
- (instancetype)initWithCoder:(NSCoder *)aDecoder {

    self = [super init];
    if (self) {
       self.name = [aDecoder decodeObjectForKey:@"name"];
        self.sex = [aDecoder decodeObjectForKey:@"sex"];
    }
    return self;
}


@end
