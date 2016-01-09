//
//  ViewController.m
//  UI20_网易首页
//
//  Created by dllo on 16/1/8.
//  Copyright © 2016年 lanou.com. All rights reserved.
//

#import "ViewController.h"
#import "ScrollViewOfButton.h"
#import "CellCustomone.h"
#import "NetworkHandler.h"
#import "ModelForSecend.h"
#import "CellCustomSecend.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,NetworkHandlerDelegate>

@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *arr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];

    [self handleData];
    [self createScrollView];
    [self createTableView];
    
}

- (void)createScrollView {

    ScrollViewOfButton *titleButton = [[ScrollViewOfButton alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 50)];
    titleButton.backgroundColor = [UIColor grayColor];
    [self.view addSubview:titleButton];

}

#pragma mark - 数据处理.

- (void)handleData {

    [NetworkHandler handlerJSONWithURL:@"http://c.m.163.com/nc/article/headline/T1348647853363/0-140.html" delegate:self];
}
- (void)handlerDidComplete:(id)result {
    
    self.arr = [NSMutableArray array];
    NSArray *arr = [result objectForKey:@"T1348647853363"];
    
    for (NSDictionary *dic in arr) {
        
        if ([[dic allKeys] containsObject:@"ads"]) {
            ModelForSecend *model = [[ModelForSecend alloc]init];
            
            //注意:此处 ModelOne 的两个数组属性需要初始化,因而需要重写初始化方法.
            [model.arrTitles addObject:[dic objectForKey:@"title" ]];
            [model.arrImages addObject:[dic objectForKey:@"imgsrc"]];
            
            
            NSArray *ads = [[NSArray alloc]init];
            ads = [dic objectForKey:@"ads"];
            for (NSDictionary *dic in ads) {
                
                [model.arrTitles addObject:[dic objectForKey:@"title"]];
                [model.arrImages addObject:[dic objectForKey:@"imgsrc"]];
            }
            [self.arr addObject:model];
        }
        else {
            ModelForSecend *modelForTwo = [[ModelForSecend alloc]init];
            [modelForTwo setValuesForKeysWithDictionary:dic];
            [self.arr addObject:modelForTwo];
        }
    }
}

- (void)createTableView {

    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 114, self.view.frame.size.width, self.view.frame.size.height - 114) style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;

    [self.tableView registerClass:[CellCustomone class] forCellReuseIdentifier:@"pool1"];

    [self.tableView registerNib:[UINib nibWithNibName:@"CellCustomSecend" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"pool2"];
   [self.tableView reloadData];
}

#pragma mark - tableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.arr.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    ModelForSecend *model = [self.arr objectAtIndex:indexPath.row];
    if (model.arrImages != nil) {
        
           CellCustomone *cell = [tableView dequeueReusableCellWithIdentifier:@"pool1"];
        [cell passModelForCell:model];
        return cell;


  
    }
    else {
        CellCustomSecend *cell = [tableView dequeueReusableCellWithIdentifier:@"pool2"];
        [cell passValueForCell:model];
   return cell;
    }
}

#pragma mark - tableView Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    ModelForSecend *model = [self.arr objectAtIndex:indexPath.row];
    if (model.arrImages != nil) {
        return 200;
    }
    else{
        return 200;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
