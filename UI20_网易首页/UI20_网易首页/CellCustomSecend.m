//
//  CellCustomSecend.m
//  UI20_网易首页
//
//  Created by dllo on 16/1/9.
//  Copyright © 2016年 lanou.com. All rights reserved.
//

#import "CellCustomSecend.h"
#import "ModelForSecend.h"
#import "UIImageView+WebCache.h"
@interface CellCustomSecend ()

@property (weak, nonatomic) IBOutlet UILabel *labelOfTitle;

@property (weak, nonatomic) IBOutlet UILabel *labelOfdigest;

@property (weak, nonatomic) IBOutlet UIImageView *image;

@end

@implementation CellCustomSecend


- (void)passValueForCell:(ModelForSecend *)model {

     self.labelOfTitle.text = model.title;
    self.labelOfdigest.text = model.digest;
    [self.image sd_setImageWithURL:[NSURL URLWithString:model.imgsrc]];

}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
