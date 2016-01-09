//
//  CellTableViewCell.m
//  UI19_网易首页
//
//  Created by dllo on 16/1/7.
//  Copyright © 2016年 lanou.com. All rights reserved.
//

#import "CellTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "ModelForData.h"

@interface CellTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *image;

@property (weak, nonatomic) IBOutlet UILabel *labelOftitle;

@property (weak, nonatomic) IBOutlet UILabel *labelOfDisgest;


@end
@implementation CellTableViewCell


//- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
//    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    if (self) {
//        
//        self.labelOfDisgest.numberOfLines = 2;
//        self.labelOftitle.numberOfLines = 2;
//        [self.labelOfDisgest sizeToFit];
//        [self.labelOftitle sizeToFit];
//        
//        
//    }
//    return self;
//
//}


- (void)passValue:(ModelForData *)model {

    [self.image sd_setImageWithURL:[NSURL URLWithString:model.imgsrc]];
    self.labelOftitle.text = model.title;
    self.labelOfDisgest.text = model.digest;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
