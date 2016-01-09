//
//  CellForDataTableViewCell.m
//  UI19_网易首页
//
//  Created by dllo on 16/1/7.
//  Copyright © 2016年 lanou.com. All rights reserved.
//

#define WIDTH [UIScreen mainScreen].bounds.size.width

#import "CellForDataTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "ModelForData.h"
#import "SmallModel.h"

@interface CellForDataTableViewCell ()

@property (nonatomic, retain) UIScrollView *scrollView;
@property (nonatomic, retain) UILabel *labelOftitle;

// 储存两张图片
@property (nonatomic, retain) NSMutableArray *arr;

@end

@implementation CellForDataTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

        [self createScrollView];
        
    }
    return self;
}

- (void)createScrollView {

    self.scrollView = [[UIScrollView alloc]init];
    [self addSubview:self.scrollView];
}



- (void)layoutSubviews {

    [super layoutSubviews];
    
    self.scrollView.frame = CGRectMake(0,10, WIDTH - 20, 200);
    self.scrollView.contentSize =CGSizeMake(WIDTH * 2, 200);
    

}


- (void)passData:(NSArray *)smallArr {
    
    SmallModel *small1 = smallArr[1];
    UIImageView *imagead = [[UIImageView alloc]init];
    [imagead sd_setImageWithURL:[NSURL URLWithString:small1.imgsrc]];
    imagead.frame = CGRectMake(20, 10, WIDTH - 20, 180);
    [self.scrollView addSubview:imagead];
    
    
    SmallModel *small2 = smallArr[2];
    UIImageView *imagead2 = [[UIImageView alloc]init];
    [imagead2 sd_setImageWithURL:[NSURL URLWithString:small2.imgsrc]];
    imagead2.frame = CGRectMake(WIDTH + 10, 10, WIDTH - 20, 180);
    [self.scrollView addSubview:imagead2];
    
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
