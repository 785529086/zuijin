//
//  ViewController.m
//  UI19_网易首页
//
//  Created by dllo on 16/1/7.
//  Copyright © 2016年 lanou.com. All rights reserved.
//

#import "ViewController.h"
#import "NetworkHandler.h"
#import "CellForDataTableViewCell.h"
#import "ModelForData.h"
#import "UIImageView+WebCache.h"
#import "CellTableViewCell.h"
#import "SmallModel.h"

@interface ViewController ()<NetworkHandlerDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *arr;
@property (nonatomic, retain) NSMutableArray *smallArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    
    
    self.title = @"网易体育";
    self.navigationController.navigationBar.titleTextAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:30]};
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"网易" style:UIBarButtonItemStylePlain target:self action:@selector(handleAction:)];
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(handleAction:)];
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc]initWithTitle:@"收藏" style:UIBarButtonItemStylePlain target:self action:@selector(handleAction:)];
    
    self.navigationItem.rightBarButtonItems = @[item1,item2];
    
//    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    [self handleData];
    [self createTableView];
    
}
- (void)handleAction:(UIBarButtonItem *)button {}

#pragma mark - 通过封装的NetworkHandle处理数据
- (void)handleData {

    [NetworkHandler handlerJSONWithURL:@"http://c.3g.163.com/nc/article/list/T1348649079062/0-20.html" delegate:self];
    
}
// 回调返回的数据.
- (void)handlerDidComplete:(id)result {
    self.arr = [NSMutableArray array];
    self.smallArr = [NSMutableArray array];
//    NSLog(@"%@",result);
    NSArray *arr = [result objectForKey:@"T1348649079062"];
    for (NSDictionary *dic in arr) {
        ModelForData *model = [[ModelForData alloc]init];
        [model setValuesForKeysWithDictionary:dic];
        [self.arr addObject:model];
        NSLog(@"model:%@",model);


    }
    
    
    // 处理广告里图片的数据.
    for (NSDictionary *dic in arr) {
        
        NSArray *arr = [dic objectForKey:@"imgextra"];
        if (arr != nil) {
            for (NSDictionary *dic in arr) {
                SmallModel *small = [[SmallModel alloc]init];
                [small setValuesForKeysWithDictionary:dic];
                [self.smallArr addObject:small];
            }
        }
    }
}


#pragma mark - 创建tableView
- (void)createTableView {

    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    [self.tableView registerClass:[CellForDataTableViewCell class] forCellReuseIdentifier:@"pool"];
 
//    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"pool1"];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"CellTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"pool1"];
    
    [self.tableView reloadData];
}

#pragma mark - tableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    ModelForData *model = [self.arr objectAtIndex:indexPath.row];
    
    if (model.imgextra != nil) {
    CellForDataTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pool"];
      
    // cell赋值.
    [cell passData:self.smallArr];

    return cell;
    }else {
//           UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pool1"];
//        cell.textLabel.text = model.title;
//        cell.detailTextLabel.text = model.digest;
//        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:model.imgsrc]];
//        NSLog(@"%@",model);
        CellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pool1"];
        [cell passValue:model];
//        NSLog(@"cell:  %@",cell);
        
        return cell;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    ModelForData *model = [self.arr objectAtIndex:indexPath.row];
    if (model.imgextra != nil) {
        return 200;
    }else{
 
        return 150;
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
