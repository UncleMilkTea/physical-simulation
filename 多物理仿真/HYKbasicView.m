//
//  HYKbasicView.m
//  多物理仿真
//
//  Created by 侯玉昆 on 16/1/9.
//  Copyright © 2016年 侯玉昆. All rights reserved.
//

#import "HYKbasicView.h"
#define COLOR colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1
@implementation HYKbasicView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        /**
         *  设置背景图片平铺
         */
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"BackgroundTile"]];
        /**
         *  设置公共的演示图片
         */
        _boxView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
        
        _boxView.image = [UIImage imageNamed:@"Box1"];
        
        [self addSubview:_boxView];
        
        /**
         *  设置附着点图片
         */
        _imagePoint = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"AttachmentPoint_Mask"]];
        
        [self addSubview:_imagePoint];
        /**
         *  设置蓝色控件
         */
        _blueView = [[UIImageView alloc]initWithFrame:CGRectMake(50, 80, 20, 20)];
        
        _blueView.backgroundColor = [UIColor COLOR];
        
        /**
         *  设置物理仿真者
         */
        _animator = [[UIDynamicAnimator alloc]initWithReferenceView:self];
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    path.lineWidth = 10;
    
    path.lineJoinStyle = kCGLineJoinRound;
    
    [path moveToPoint:_imagePoint.center];
    
    [path addLineToPoint:_currentPoint];
    
    [[UIColor COLOR] setStroke];
    
    [path stroke];
    
}

@end
