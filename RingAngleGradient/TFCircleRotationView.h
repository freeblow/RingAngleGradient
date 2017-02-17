//
//  TFCircleRotationView.h
//  TransformDemo
//
//  Created by freeblow on 16/3/7.
//  Copyright © 2016年 freeblow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TFCircleRotationView : UIView
- (void)showAnimation;
- (void)stopAnimation;

@property(nonatomic, copy) CABasicAnimation * spin;

- (void)setInnerRadius:(CGFloat)aRadius;
@end
