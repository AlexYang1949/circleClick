//
//  ViewController.m
//  demo
//
//  Created by haoqidai on 15/7/31.
//  Copyright (c) 2015年 devYang. All rights reserved.
//

#import "ViewController.h"
#import "drawView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    drawView *draw=[[drawView alloc] initWithFrame:CGRectMake(10, 0, 300, 300)];
    [self.view addSubview:draw];
    
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
