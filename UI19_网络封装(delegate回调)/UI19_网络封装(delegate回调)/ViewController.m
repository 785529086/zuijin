//
//  ViewController.m
//  UI19_网络封装(delegate回调)
//
//  Created by dllo on 16/1/7.
//  Copyright © 2016年 lanou.com. All rights reserved.
//

#import "ViewController.h"
#import "NetworkHandler.h"
#import "CellForNetTableViewCell.h"
#import "ModelForNet.h"
@interface ViewController ()<NetworkHandlerDelegate,UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *arr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib

    [self handleData];
    [self createTableView];
}

- (void)handleData {

    NSString *str = @"http://api.map.baidu.com/place/v2/search?query=银行&region=大连&output=json&ak=6E823f587c95f0148c19993539b99295";
    // 使用接口1
//    NetworkHandler *handler = [[NetworkHandler alloc]init];
//    handler.delegate = self;
//    [handler networkHandlerJSONWithURL:str];
    
    
    // 使用接口2
    [NetworkHandler handlerJSONWithURL:str delegate:self];
    
}

#pragma mark - NetworkDelegate协议方法.
- (void)handlerDidComplete:(id)result {
    
    NSLog(@"result:%@",result);

    self.arr = [NSMutableArray array];
    NSArray *arr = [result objectForKey:@"results"];
    for (NSDictionary *dic in arr) {
        NSString *name = [dic objectForKey:@"name"];
        [self.arr addObject:name];
        
    }
    
    
}

- (void)createTableView {

    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[CellForNetTableViewCell class] forCellReuseIdentifier:@"pool"];
 
}

#pragma mark - tableView dataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CellForNetTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pool"];
    cell.textLabel.text = [self.arr objectAtIndex:indexPath.row];
    return cell;
}


#pragma mark - tableView delegate








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
