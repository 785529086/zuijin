//
//  CellTableViewCell.h
//  UI19_网易首页
//
//  Created by dllo on 16/1/7.
//  Copyright © 2016年 lanou.com. All rights reserved.
//

#import <UIKit/UIKit.h>


@class ModelForData;
@interface CellTableViewCell : UITableViewCell

- (void)passValue:(ModelForData *)model;

@end
