//
//  ViewController.m
//  项目引导图
//
//  Created by andy on 15/8/17.
//  Copyright (c) 2015年 andy. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)

#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#define DISTENCEW (([UIScreen mainScreen].bounds.size.width) / 320)

#define DISTENCEH (([UIScreen mainScreen].bounds.size.height) / 568)

@interface ViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //    隐藏导航栏
    self.navigationController.navigationBarHidden=YES;
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, -20, 320 * DISTENCEW, SCREEN_HEIGHT + 20)];
    [self.scrollView setContentSize:CGSizeMake(1600 * DISTENCEW, 0)];
    //    打开分页属性
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
    self.scrollView.backgroundColor = [UIColor lightGrayColor];
    
    //    [scrollView setPagingEnabled:YES];  //视图整页显示
    self.scrollView.bounces = NO; //避免弹跳效果,避免把根视图露出来
    
    
    _pageControl = [[UIPageControl alloc] init];
    self.pageControl.numberOfPages = 5;
    CGSize controlSize = [self.pageControl sizeForNumberOfPages:5];
    self.pageControl.frame = CGRectMake((320 * DISTENCEW - controlSize.width) / 2, 400 * DISTENCEW, controlSize.width , controlSize.height);
    self.pageControl.currentPageIndicatorTintColor = [UIColor cyanColor];
    self.pageControl.pageIndicatorTintColor = [UIColor orangeColor];
    [self.pageControl addTarget:self action:@selector(pageChanged:) forControlEvents:UIControlEventValueChanged];
    
    
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT + 20)];
    [imageview setImage:[UIImage imageNamed:@"1.jpg"]];
    [self.scrollView addSubview:imageview];
    
    
    UIImageView *imageview1 = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH , SCREEN_HEIGHT + 20)];
    [imageview1 setImage:[UIImage imageNamed:@"2.jpg"]];
    [self.scrollView addSubview:imageview1];
    
    
    UIImageView *imageview2 = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 2, 0, SCREEN_WIDTH , SCREEN_HEIGHT + 20)];
    [imageview2 setImage:[UIImage imageNamed:@"3.jpg"]];
    [self.scrollView addSubview:imageview2];
    
    
    UIImageView *imageview3 = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 3 , 0, SCREEN_WIDTH , SCREEN_HEIGHT + 20)];
    [imageview3 setImage:[UIImage imageNamed:@"4.jpg"]];
    [self.scrollView addSubview:imageview3];
    
    
    UIImageView *imageview4 = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 4, 0, SCREEN_WIDTH , SCREEN_HEIGHT + 20)];
    [imageview4 setImage:[UIImage imageNamed:@"5.jpg"]];
    imageview4.userInteractionEnabled = YES;    //打开imageview4的用户交互;否则下面的button无法响应
    [self.scrollView addSubview:imageview4];
    
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];//在imageview4上加载一个透明的button
    [button setTitle:nil forState:UIControlStateNormal];
    [button setFrame:CGRectMake(46, 371, 230, 37)];
    [button addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"点击进入" forState:UIControlStateNormal];
    [imageview4 addSubview:button];
    
    [self.view addSubview:self.scrollView];
    [self.view addSubview:self.pageControl];
}
#pragma mark --pageControl的事件方法
- (void)pageChanged:(UIPageControl*)pageControl{
    //    NSLog(@"%d",pageControl.currentPage);
    //    下面这种写法没动画
    //        self.scrollView.contentOffset = CGPointMake(320*pageControl.currentPage, 0);
    //    下面这种写法有动画
    [self.scrollView setContentOffset:CGPointMake(320 *DISTENCEW * pageControl.currentPage, 0) animated:YES];
}


#pragma mark --UIScrollViewDelegate
//这个方法是当我们拖拽scrollView，减速结束时会调用一次
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //    1.获取到当前页面的x偏移量
    CGFloat x = scrollView.contentOffset.x;
    
    //    NSLog(@"%f",x);
    //    2.通过取整求得当前页面为第几页
    NSInteger page = x / 320;
    
    //    NSLog(@"当前页面为第%d页",page);
    //    3.给pageControl设置当前页
    self.pageControl.currentPage = page;
    
}

- (void) button:(UIButton *)sender{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"labelFount" object:@"YES"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
