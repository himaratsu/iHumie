//
//  ViewController.m
//  Humie
//
//  Created by rhiramat on 2013/03/23.
//  Copyright (c) 2013年 rhiramat. All rights reserved.
//

#import "ViewController.h"
#import "HumieActionViewController.h"
#import "HumieTargetList.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)init {
    self = [super init];
    if (self) {
        _selectionIndex = 0;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"踏み絵を選ぶ";
    CGRect frame = [UIScreen mainScreen].applicationFrame;
    
    // coverflow風の画面を用意
    self.flowView = [[AFOpenFlowView alloc] initWithFrame:CGRectMake(0, 0, 320, frame.size.height-44)];
    _flowView.dataSource = self;
    _flowView.viewDelegate = self;
    _flowView.backgroundColor = [UIColor blackColor];
    [_flowView setNumberOfImages:[[HumieTargetList sharedInstance] count]];
    [self.view addSubview:_flowView];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(tapCoverFlow)];
    [_flowView addGestureRecognizer:tapGesture];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - AFOpenFlowViewDataSource

- (void)openFlowView:(AFOpenFlowView *)openFlowView requestImageForIndex:(int)index {
    NSString *fileName = [[HumieTargetList sharedInstance] fileNameAtIndex:index];
    [_flowView setImage:[UIImage imageNamed:fileName] forIndex:index];
}

- (UIImage *)defaultImage {
    return [UIImage imageNamed:@"jobs.jpg"];
}

#pragma mark - AFOpenFlowViewDataDelegate

- (void)openFlowView:(AFOpenFlowView *)openFlowView selectionDidChange:(int)index {
    _selectionIndex = index;
}

#pragma mark - User Action

- (void)tapCoverFlow {
    NSLog (@"%d番目の画像をTAP!", _selectionIndex);
    
    // 踏み絵画面へ遷移
    UIImage *image = [UIImage imageNamed:@"jobs.jpg"];
    HumieActionViewController *humieActionVC = [[HumieActionViewController alloc] initWithImage:image];
    [self.navigationController pushViewController:humieActionVC animated:YES];
}

@end
