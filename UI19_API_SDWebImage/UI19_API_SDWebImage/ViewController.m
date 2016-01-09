//
//  ViewController.m
//  UI19_API_SDWebImage
//
//  Created by dllo on 16/1/7.
//  Copyright © 2016年 lanou.com. All rights reserved.
//

#import "ViewController.h"
//#import "SDWebImage/UIImageView+WebCache.h"
#import "UIImageView+WebCache.h"
#import "NetworkHandler.h"
@interface ViewController ()<NetworkHandlerDelegate,UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, retain) NSMutableArray *arr;
@property (nonatomic, retain) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self handleData];
    [self createTableView];
}

- (void)handleData {

    NSString *str = @"http://api.m.mtime.cn/News/NewsList.api?pageIndex=1";

    [NetworkHandler handlerJSONWithURL:str delegate:self];
    
}

#pragma mark - networkHandle delegate

- (void)handlerDidComplete:(id)result {

    self.arr = [NSMutableArray array];
    NSArray *arr = [result objectForKey:@"newsList"];
    for (NSDictionary *dic in arr) {
        NSString *imageURL = [dic objectForKey:@"image"];
        [self.arr addObject:imageURL];
        [self.tableView reloadData];
    }
}


- (void)createTableView {

    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    [_tableView release];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class]  forCellReuseIdentifier:@"pool"];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pool"];
    
//    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:self.arr[indexPath.row]placeholderImage:[UIImage imageNamed:@"1.jpg"]];
//    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:self.arr[indexPath.row]]placeholderImage:[UIImage imageNamed:@"1.jpg"]];
    
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:self.arr[indexPath.row]]];
    
    return cell;
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
