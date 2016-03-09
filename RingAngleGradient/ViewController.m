//
//  ViewController.m
//  RingAngleGradient
//
//  Created by freeblow on 16/3/9.
//  Copyright © 2016年 freeblow. All rights reserved.
//

#import "ViewController.h"

#import "TFCircleRotationView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    
    
    
    TFCircleRotationView *aRotationView = [[TFCircleRotationView alloc] init];
    [aRotationView setFrame:CGRectMake(0.0f, 40.0f, 14.f, 14.f)];
    
    [aRotationView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:aRotationView];
    
    
    [aRotationView showAnimation];
}

    

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
