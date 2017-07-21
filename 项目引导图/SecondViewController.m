//
//  SecondViewController.m
//  项目引导图
//
//  Created by andy on 15/8/17.
//  Copyright (c) 2015年 andy. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"第一个界面";
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBarHidden=NO;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(110, 100, 100, 30)];
    label.text = @"第一个界面";
    label.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
