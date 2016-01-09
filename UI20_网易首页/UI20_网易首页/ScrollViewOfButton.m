//
//  ScrollViewOfButton.m
//  UI20_网易首页
//
//  Created by dllo on 16/1/9.
//  Copyright © 2016年 lanou.com. All rights reserved.
//

#import "ScrollViewOfButton.h"

@interface ScrollViewOfButton ()

@property (nonatomic, retain) UIScrollView *scroll;
@property (nonatomic, retain) NSArray *arr;

@end


@implementation ScrollViewOfButton

- (instancetype)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    if (self) {
        
        [self createScrollView:frame];
    }
    return self;
}

- (void)createScrollView:(CGRect)frame {

    self.arr = @[@"头条",@"娱乐",@"热点",@"体育",@"北京",@"大连",@"订阅",@"财经",@"科技"];
    self.scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, 50)];
    self.scroll.contentSize = CGSizeMake(frame.size.width / 5 * self.arr.count, 50);
    [self addSubview:self.scroll];
    
    self.scroll.pagingEnabled = YES;
    self.scroll.bounces = YES;
    [self createButton:frame];
    
}

- (void)createButton:(CGRect)frame {

   
    for (int i = 0; i < self.arr.count; i++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor = [UIColor whiteColor];
        button.frame = CGRectMake(frame.size.width / 5 * i, 0 , frame.size.width / 5 , 50);
        [button setTitle:self.arr[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [self.scroll addSubview:button];
    }
}


@end
