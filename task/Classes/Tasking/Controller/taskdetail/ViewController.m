//
//  ViewController.m
//  sinaPersonalV
//
//  Created by 唐超 on 6/7/17.
//  Copyright © 2017 apple. All rights reserved.
//

#import "ViewController.h"
#import "TCPagesView.h"
#import "TableViewController.h"
//#import "task-Bridging-Header.h"
#import  "task-Swift.h"
@interface ViewController ()<TcPageDelegate>

@property (nonatomic, strong) UIView * navgationView;

@property (nonatomic, strong) UIView * navBgView;

@property (nonatomic, strong) CAGradientLayer * separetorLayer;

@property (nonatomic, strong) UIImageView * avatarImageView;

@property (nonatomic, strong) UIImageView * taskImageV;
@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
//    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    
   
    [self initUI];
    
    
    NSData * imageData = [[NSUserDefaults standardUserDefaults]objectForKey:self.taskid];//图片缓存
    
    if (imageData) {
          UIImage *image = [UIImage imageWithData:imageData];
         self.taskImageV.image = image;
    }else{
        [self getTaskInfo];
    }

}

-(void)getTaskInfo{
    
    
    
    
    
    //发送请求
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        NSString * str = [NSString stringWithFormat:@"http://taskbao.dev.cnfol.wh/v1/task/one?userid=%@&id=%@",[User GetUser].id ,self.taskid];
        NSURL *url = [NSURL URLWithString:str];
        
        
        
        
        NSURLSession *session = [NSURLSession sharedSession];
        NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            

             NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
     
            //1.确定URL
            NSURL *url = [NSURL URLWithString:dict[@"data"][@"image"]];
            
    
            //2.根据url下载图片二进制数据到本地
            NSData *imageData = [NSData dataWithContentsOfURL:url];
            
            if (imageData != nil ) {
                    [[NSUserDefaults standardUserDefaults] setObject:imageData forKey:self.taskid];
            }
            
        
            
            //回到主线程
            dispatch_async(dispatch_get_main_queue(), ^{
                //3.转换图片格式
                UIImage *image = [UIImage imageWithData:imageData];
                
                //4.显示UI
                self.taskImageV.image = image;
            });
            
        }];
        [dataTask resume];
        
    });
}

//-(void)download1:(NSString *)str
//{
//    //0.000018
//    //0.166099
//
//
//
//
//
//
//    //发送请求
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//
//
//
//            //回到主线程
//            dispatch_async(dispatch_get_main_queue(), ^{
//
//                NSDate *end = [NSDate date];  //获得当前的时间
//                NSLog(@"%f",[end timeIntervalSinceDate:start]);
//
//
//            });
//
//
//    });
//
//}

- (void)initUI
{

    self.title= self.taskName;
    
    UIImageView * headView = [[UIImageView alloc] initWithFrame:CGRectMake(0, -100, screenWidth, screenWidth*9/16+200)];
    headView.autoresizesSubviews = YES;
    headView.backgroundColor = [UIColor whiteColor];
    headView.clipsToBounds = YES;
    headView.image = [UIImage imageNamed:@"defaut_task"];
    _taskImageV = headView;

    
    NSMutableArray * array = [NSMutableArray array];
    for (int i = 0; i <2; i++) {
        
        
        TableViewController * vc = [[TableViewController alloc] initWithStyle:UITableViewStylePlain];
        [array addObject:vc];
    }
    
    
   
    TCPagesView * view = [[TCPagesView alloc] initWithFrame:[UIScreen mainScreen].bounds titles:@[@"任务目标",@"任务奖励"] headHeight:screenWidth*9/16 +10 segmentHeight:50 + 10  headView:headView itemsMargin:30 itemWidth:150 viewControllers:array belongController:self];
    [self.view addSubview:view];
    view.delegate = self;
    



    UIView * bottomV = [[UIView alloc] initWithFrame:CGRectMake(0, screenHeight -  60 -64, screenWidth, 60)];
    bottomV.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bottomV];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
   
    button.frame = CGRectMake((screenWidth - 100)/2, 0  , 100, 40);
    button.titleLabel.text = @"立即开始";
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    button.layer.cornerRadius = 5 ;
    button.layer.masksToBounds  = true;
    button.titleLabel.textColor = [UIColor whiteColor];
    button.backgroundColor = [UIColor colorWithRed:228/255.0 green:118/255.0 blue:44/255.0 alpha:1];
    [button setTitle:@"立即开始" forState:UIControlStateNormal ];
    [button addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
    [bottomV addSubview:button];
}

-(void)start{
    
    
    ZBStartTaskController *star = [[ZBStartTaskController alloc]init];
    star.taskid = self.taskid;
    [self.navigationController pushViewController:star animated:YES];
    
}

- (void)scrollViewDidScrollOffSetY:(CGFloat )offsety
{

}


//- (UIImageView *)avatarImageView
//{
//    if (!_avatarImageView) {
//        _avatarImageView = [[UIImageView alloc] init];
//        _avatarImageView.layer.masksToBounds = YES;
//        _avatarImageView.layer.cornerRadius = 30.f;
//        _avatarImageView.backgroundColor = [UIColor lightGrayColor];
//    }
//    return _avatarImageView;
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
