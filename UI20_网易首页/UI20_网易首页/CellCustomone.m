//
//  CellCustomone.m
//  UI20_网易首页
//
//  Created by dllo on 16/1/9.
//  Copyright © 2016年 lanou.com. All rights reserved.
//

#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#import "CellCustomone.h"
#import "ModelForSecend.h"
#import "UIImageView+WebCache.h"
@interface CellCustomone ()

@property (nonatomic, retain) UIScrollView *scroll;

@end

@implementation CellCustomone


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self createScrollView];
    }
    return self;
}


- (void)createScrollView {

    self.scroll = [[UIScrollView alloc]init];
    [self addSubview:self.scroll];
    self.scroll.pagingEnabled = YES;
    
}

-(void)layoutSubviews {

    [super layoutSubviews];
    
    self.scroll.frame = CGRectMake(0,0, WIDTH, 200);
    self.scroll.contentSize = CGSizeMake(WIDTH * 6,200);
//    self.scroll.backgroundColor = [UIColor cyanColor];
}


- (void)passModelForCell:(ModelForSecend *)model {


    for (int i = 0; i < model.arrImages.count; i++) {
        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(WIDTH * i + 10,0, WIDTH - 20, 200)];
        [image sd_setImageWithURL:[NSURL URLWithString:model.arrImages[i]]];
        [self.scroll addSubview:image];
    }
}

- (void)awakeFromNib {
    
    // Initialization code
//        self.scroll.contentSize = CGSizeMake(self.scroll.frame.size.width * 4,self.scroll.frame.size.height);
//        self.scroll.backgroundColor = [UIColor cyanColor];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
