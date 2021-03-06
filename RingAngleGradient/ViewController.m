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
{
    TFCircleRotationView *rotationView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    
    
    
    rotationView = [[TFCircleRotationView alloc] init];
    [rotationView setFrame:CGRectMake(0.0f, 40.0f, 80.f, 80.f)];
    
    [rotationView setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:rotationView];
    
    
    [rotationView showAnimation];
    
    
    TFCircleRotationView *rotationView2 = [[TFCircleRotationView alloc] init];
    [rotationView2 setFrame:CGRectMake(0.0f, 200.0f, 20.0f, 20.0f)];
    
    [rotationView2 setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:rotationView2];
    [rotationView2 setInnerRadius:3];
    
    [rotationView2 showAnimation];
    
    [rotationView showAnimation];
    
    [[self view] setBackgroundColor:[UIColor redColor]];
}

- (IBAction)startClick:(id)sender {
    [rotationView showAnimation];
}
    
- (IBAction)stopClick:(id)sender {
    
    [rotationView stopAnimation];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
