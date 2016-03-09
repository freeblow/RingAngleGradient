//
//  TFCircleRotationView.m
//  TransformDemo
//
//  Created by freeblow on 16/3/7.
//  Copyright © 2016年 freeblow. All rights reserved.
//

#import "TFCircleRotationView.h"


#import "AngleGradientLayer.h"
@interface TFCircleRotationView()
{
    BOOL _isAnimationMotion;
}
@end

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
    
    _isAnimationMotion = NO;
    
    if (!_spin)
    {
        _spin = [[CABasicAnimation alloc] init];
        [_spin setKeyPath:@"transform.rotation"];
    }
}

- (void)setInnerRadius:(CGFloat)aRadius
{
    AngleGradientLayer *l = (AngleGradientLayer *)self.layer;
    l.ringsRadius = aRadius;
}

- (void)showAnimation
{
    if (!_isAnimationMotion)
    {
        _isAnimationMotion = YES;
        AngleGradientLayer *l = (AngleGradientLayer *)self.layer;
        l.cornerRadius = MAX(CGRectGetWidth([self frame]), CGRectGetHeight([self frame]))/2;
        l.masksToBounds = YES;
        
        if (_spin)
        {
            _spin.duration = 1;
            _spin.toValue = [NSNumber numberWithFloat:M_PI];
            _spin.cumulative = YES;
            _spin.repeatCount = MAXFLOAT;
            [self.layer addAnimation:_spin forKey:@"spin"];
        }
    }
}

- (void)stopAnimation
{
    if (_isAnimationMotion)
    {
        if (_spin)
        {
            _isAnimationMotion = NO;
            [self.layer removeAnimationForKey:@"spin"];
        }
    }
}

#if !__has_feature(objc_arc)
- (void)dealloc
{
    if (_spin) {
        [_spin release];
         _spin = nil;
    }
    [super dealloc];
}
#endif


@end
