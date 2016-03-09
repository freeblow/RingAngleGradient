//
//  TFCircleRotationView.m
//  TransformDemo
//
//  Created by freeblow on 16/3/7.
//  Copyright © 2016年 freeblow. All rights reserved.
//

#import "TFCircleRotationView.h"


#import "AngleGradientLayer.h"

@implementation TFCircleRotationView

+ (Class)layerClass
{
    return [AngleGradientLayer class];
}


- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
        
        [self initInnerLayer];
    }
    return self;
}

- (id)init
{
    if (self = [super init]) {
        [self initInnerLayer];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initInnerLayer];
    }
    return self;
}


- (void)initInnerLayer
{
    NSMutableArray *colors = [[NSMutableArray alloc] initWithCapacity:16];
    
    [colors addObject:(id) [UIColor colorWithRed: 0.4 green: 0.545 blue: 0.98 alpha: 1].CGColor];
    [colors addObject:(id)[UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1].CGColor];
    
    AngleGradientLayer *l = (AngleGradientLayer *)self.layer;
    l.cornerRadius = MAX(CGRectGetWidth([self frame]), CGRectGetHeight([self frame]))/2;
    l.masksToBounds = NO;
    l.colors = colors;
}

- (void)showAnimation
{
    AngleGradientLayer *l = (AngleGradientLayer *)self.layer;
    l.cornerRadius = MAX(CGRectGetWidth([self frame]), CGRectGetHeight([self frame]))/2;
    l.ringsRadius = 3.0f;

    l.masksToBounds = YES;
    
    CABasicAnimation * spin = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    spin.duration = 1;
    spin.toValue = [NSNumber numberWithFloat:M_PI];
    spin.cumulative = YES;
    spin.repeatCount = MAXFLOAT;
    [self.layer addAnimation:spin forKey:@"spin"];
}


@end
