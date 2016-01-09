//
//  ViewController.m
//  UI20_本地存储(文件形式)
//
//  Created by dllo on 16/1/8.
//  Copyright © 2016年 lanou.com. All rights reserved.
//

#import "ViewController.h"
#import "ModelForPerson.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - 知识点1 App路径
- (IBAction)findAppPath:(id)sender {
    
    // NSBundle 类
    
    // 获取App包路径.
NSString *appPath = [[NSBundle mainBundle] resourcePath];
    NSLog(@"appPath:%@",appPath);
    
    // 获取App包中的某一个资源路径.
    NSString *resPath = [[NSBundle mainBundle]pathForResource:@"1" ofType:@"jpg"];
    NSLog(@"resPath%@",resPath);
    
}

#pragma mark - 知识点2 沙盒路径
- (IBAction)findSandBoxPath:(id)sender {
    
    // API. NSHomeDirectory
   NSString *sandBoxPath = NSHomeDirectory();
    NSLog(@"sandBoxPath:%@",sandBoxPath);
    
}

#pragma mark - 知识点3 利用API快速获取沙盒中各文件夹路径
- (IBAction)findPath:(id)sender {
    
    // API NSSearchPathForDirectoriesInDomains
    
    /**
     *
     * @brief 获取沙盒中Document文件夹路径.
     *
     * @param directory 要查找的目录名(文件夹)
     * @param domainMask 在哪个domain(域)中查找参数的目录名.
     * @param expandTilde 是否用" ~ "来代替域路径的展开 .
     * return NSArray 将查找出来的目录路径放到一个数组中返回(因为域大时可能会有多个同名的目录)
     */
  NSString *docPath =   [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES) lastObject];
    
    NSLog(@"%@",NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES));
    NSLog(@"%@",docPath);
    
    // 获取Caches(缓存文件夹)路径.
 NSString *cachesPath =    [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,  NSUserDomainMask, YES) lastObject];
    NSLog(@"%@",cachesPath);
    
    // 获取tmp(临时文件夹)路径.
    NSString *tmpPath = NSTemporaryDirectory();
    NSLog(@"%@",tmpPath);
    
    // 获取Library(资源库)路径.
    NSString *libPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
    NSLog(@"%@",libPath);
    
    // 获取Preferences文件夹路径.(拼接而成)
    NSString *prePath = [libPath stringByAppendingString:@"/Preferences"];
    NSLog(@"%@",prePath);
    
    //此方法在拼接路径时常用.
    NSString *prePath2 = [libPath stringByAppendingPathComponent:@"Preferences"];
    NSLog(@"%@",prePath2);
}

#pragma mark - 知识点4 简单对象读写到本地. 

#pragma mark ** NSString对象. 
- (IBAction)handleNSString:(id)sender {
    
    // 要保存的字符串对象.
    NSString *str = @"iPhone";
    
    // 文件保存路径.
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    
    NSString *file = [docPath stringByAppendingPathComponent:@"name.txt"];
    
    // 写入disk(磁盘).
    /** 详见API*/
    [str writeToFile:file atomically:YES encoding:NSUTF8StringEncoding error:nil];

}

- (IBAction)handleNSStringReadFromDisk:(id)sender {
        NSString *file = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject]stringByAppendingPathComponent:@"name.txt"];
    
    
    NSString *readStr = [NSString stringWithContentsOfFile:file encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"%@",readStr);
    
}

#pragma mark ** NSArray对象.
- (IBAction)handleArrayWriteToDisk:(id)sender {
    
    NSLog(@" array: %@", NSHomeDirectory());
    NSArray *arr = @[@"zhang",@"wang",@"wu"];
    
    // 创建文件保存路径 .
    NSString *file = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject]stringByAppendingPathComponent:@"array.plist"];
    
    // 写入
    [arr writeToFile:file atomically:YES];
    
    NSLog(@"%@",arr);
}

- (IBAction)handleNSArrayReadFromDisk:(id)sender {
    
    NSString *file = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject]stringByAppendingPathComponent:@"/array.plist"];
    NSLog(@"%@",file);
    // 创建array对象.
    NSArray *arr = [NSArray arrayWithContentsOfFile:file];
    NSLog(@"%@",arr);
}


#pragma mark ** NSDictionary对象.
- (IBAction)handleDicWriteToDisk:(id)sender {
    
   NSDictionary *dic = @{@"name":@"zhang",
                          @"sex":@"male"};
    
    // 路径
    NSString *file = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject]stringByAppendingPathComponent:@"dic.plist"];
    
    // 写入
    [dic writeToFile:file atomically:YES];
    
    
}
- (IBAction)handleDicReadFromDisk:(id)sender {
    
    // 路径
    NSString *file = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject]stringByAppendingPathComponent:@"dic.plist"];
    
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:file];
    NSLog(@"%@",dic);
}


#pragma mark ** NSData对象.
- (IBAction)handleDataWriteTiDisk:(id)sender {
    
    // 要存储的Data
    UIImage *image = [UIImage imageNamed:@"1.jpg"];
   NSData *data = UIImageJPEGRepresentation(image, 1);
    
    // 路径.
    NSString *file = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject]stringByAppendingPathComponent:@"1.jpg"];
    
    // 写入.
    [data writeToFile:file atomically:YES];
    NSLog(@"%@", NSHomeDirectory());
    
    
    
}

- (IBAction)handleDataReadFrom:(id)sender {
    
    
    // 路径.
    NSString *file = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject]stringByAppendingPathComponent:@"1.jpg"];
    // 创建data.
    NSData *data = [NSData dataWithContentsOfFile:file];
    
    // 创建image.
    UIImage *image = [UIImage imageWithData:data];
    
    NSLog(@"%@",image);
}

#pragma mark - 知识点5 复杂对象读写本地.(归档,做收藏界面)

- (IBAction)handleModelWriteToDisk:(id)sender {

    // 创建要归档的model对象.
    ModelForPerson *per = [[ModelForPerson alloc]init];
    per.name = @"zhangsan";
    per.sex = @"male";
    
    // 创建归档时所需的Data对象.(!!!!! 要归档的model类一定要实现NSCoding  两个协议方法)
    NSMutableData *data = [NSMutableData data];
    
    // 归档类.
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
    
    // 开始归档.
    [archiver encodeObject:per forKey:@"per"];
    
    // 归档结束.
    [archiver finishEncoding];
    
    // data写入本地.
    NSString *file = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject]stringByAppendingString:@"model.plist"];
    
    [data writeToFile:file atomically:YES];
    NSLog(@"%@",data);
    NSLog(@"%@",NSHomeDirectory());
    
}

- (IBAction)handleModelReadFromDisk:(id)sender {
    
    // data路径.
    NSString *file = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject]stringByAppendingString:@"model.plist"];
    // data.
    NSData *data = [NSData dataWithContentsOfFile:file];
    
    // 反归档.
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc]initForReadingWithData:data];
    
    ModelForPerson *per = [unarchiver decodeObjectForKey:@"per"];
    
    // 反归档结束
    [unarchiver finishDecoding];
    NSLog(@"%@, %@",per.name,per.sex);
}


#pragma mark - 知识点6 NSFileManager 类. (对文件进行管理)

#pragma mark - 知识点7 NSFileHandle 类. (对原数据进行操作,以字节精度)


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
